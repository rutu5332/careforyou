<%@page import="Storage.Data" %>
<%@page import="server.Mail" %>
<%


 		String name,psw,cpsw,mno,age,id,address,email,gen;
		
		name=request.getParameter("UserName");
		address=request.getParameter("Address");
		age=request.getParameter("Userage");
		//id=request.getParameter("SignupId");
		email=request.getParameter("Email");
		psw=request.getParameter("Password");
		cpsw=request.getParameter("cpsw");
		mno=request.getParameter("Mobile");
		gen=request.getParameter("r1");

	
		out.println(name);
		
		
			try{
				
				String sub="Hello "+ name +" , Welcome to Care For You";
						
				String text="<div><center><div style=\"border:1px solid black;height:70%;width:95%;text-align:center;\"><br>";
				text+="<label style=\"font-family:Copperplate Gothic Bold;color:#0cb8b6;font-size:70px;\"> ";
				text+="<a href=\"localhost:8080/careforyou/index.jsp\" >careforyou.com</a></label>";
				text+="<br><br><hr>";
				text+="<div style=\"background-color:teal;height:90%;width:100%;padding-top:10px;\"> <center>";
				text+="<div style=\"background-color:white;height:40%;width:75%;box-shadow:black;\"><br><br>";
				text+="<label style=\"font-family:Lucida Handwriting;font-size:45px;\">Welcome to the World of</label><br>";
				text+="<label style=\"font-size:80px;font-family:Algerian;color:#0cb8b6;\">care for you</label><br><br>";
				text+="<h2>let the care for your self and your loved ones' begin!</h2></div></center><hr>";
				text+="</div><h1 style=\"font-family:Lucida Handwriting;font-size:43px;color:blue;\">Thank you ...!!!</h1>";
				text+="For any query or concern  mail us at care4you2019@gmail.com </div></center></div>";;
	
				out.println("hello");
				Data dt=new Data();
				
				dt.st=dt.cn.createStatement();
				String select="select * from signup_tbl";
				String e_id,phn;
				dt.rs=dt.st.executeQuery(select);
				while(dt.rs.next())
				{
					e_id=dt.rs.getString("vEmail");
					phn=dt.rs.getString("vMobile");
					if(e_id.equals(email) || phn.equals(mno))
					{
						String msg="Email or no is already registred.";
						response.sendRedirect("Signup.jsp?msg");
					}
				}
				
				//sending mail to new user
				Mail mail=new Mail(email,sub,text);
				String insert="insert into signup_tbl(vUserName,vUserAge,vGender,vAddress,vEmail,vMobile,vPassword) values('"+name+"','"+age+"','"+gen+"','"+address+"','"+email+"','"+mno+"','"+psw+"')";
				// String insert="insert into tbl_reg(Name,Gender,Date,Mno,Email,Psw) values('"+name+"','"+gen+"','"+date+"',"+Long.parseLong(mno) +",'" + eid + "','" + psw + "')";
				dt.st.executeUpdate(insert);
				
				select="select iSignupId from signup_tbl where vEmail='" + email + "'";
				dt.rs=dt.st.executeQuery(select);
				String uid="";
				while(dt.rs.next())
				{
					uid=dt.rs.getString("iSignupId");
				}
				String cart,qty,wlst;
				if(session.getAttribute("cart") == null)
					cart="0";
				else
					cart=session.getAttribute("cart").toString();
				
				if(session.getAttribute("quantity") == null)
					qty="0";
				else
					qty=session.getAttribute("quantity").toString();
				
				if(session.getAttribute("wishlist") == null)
					wlst="0";
				else
					wlst=session.getAttribute("wishlist").toString();
				
				insert="insert into cart_tbl (iSignupId,vProducts,vQuantity) values ("+uid+" , '"+cart+"' , '"+qty+"')";
				dt.st.executeUpdate(insert);
				insert="insert into wishlist_tbl (iSignupId,vProducts) values ("+uid+" , '"+wlst+"')";
				dt.st.executeUpdate(insert);
				session=request.getSession(true);
				session.setAttribute("uid", uid);
				session.setAttribute("user", name);
				session.setAttribute("type", "user");
				session.setAttribute("email", email);
				response.sendRedirect("index.jsp");
				
			}
			catch(Exception ex){
				out.println(ex.toString());
			}
%>
		

