<%@page import="Storage.Data" %>
<%


 		String name,mno,email,msg;
		
		name=request.getParameter("name");
		email=request.getParameter("email");
		mno=request.getParameter("phone");
		msg=request.getParameter("comments");
	
		
		
			try{
				
	
				//out.println("hello");
				Data dt=new Data();
				
				dt.st=dt.cn.createStatement();
			
				String insert="insert into contact_tbl(vName,vEmail,vMessage,vMobile) values('"+name+"','"+email+"','"+msg+"','"+mno+"')";
				// String insert="insert into tbl_reg(Name,Gender,Date,Mno,Email,Psw) values('"+name+"','"+gen+"','"+date+"',"+Long.parseLong(mno) +",'" + eid + "','" + psw + "')";
				dt.st.executeUpdate(insert);
				
				response.sendRedirect("index.jsp");
				
			}
			catch(Exception ex){
				out.println(ex.toString());
			}
%>
		

