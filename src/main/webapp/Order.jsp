<%@page import="java.time.LocalDate" %>
<%@page import="Storage.Data" %>
<%@page import="server.Mail" %>
<%
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		
 		String name=" ", uid=" ",tot="" ,user="",pid="",qt="";
		
		uid=session.getAttribute("email").toString();
		name=session.getAttribute("user").toString();
		tot=session.getAttribute("total").toString();
		user=session.getAttribute("uid").toString();
		pid=session.getAttribute("cart").toString();
		qt=session.getAttribute("quantity").toString();
		session.setAttribute("cart","0");
		session.setAttribute("quantity","0");
		String update="update cart_tbl set vProducts='" + 0 + "',vQuantity='"+ 0 +"' where iSignupId="+user;
		dt.st.executeUpdate(update);
		//int qty=Integer.parseInt(qt);
		
		String counts[]=pid.split("/");
		
		
			try{
				
				
				String citems[]=pid.split("/");
				String qitems[]=qt.split("/");
					
				
				String sub="Order Confirmation";
						
				String txt="Hello , "+ name +".\n Welcome to Care for you. Thanks for choosing our site.\n";
				txt += "Glad to have you at our platform.\n";
				txt="<h3>Thank you for your Order.</h3><br>";
				txt += "<center><br><h2>Order Details</h2>";
				txt += "<font color=black size=3>";
				txt += "<table border=1 cellpadding=10 cellspacing=0><tr>";
				txt+="<th>Product name</th><th>Price</th><th>Quantity</th><th>SubTotal</th>";
				//txt += "<td>Name </td><td>"+fnm + " "+lnm;	
				double subtot;
				for(int i=0;i<citems.length ; i++)
					{
						txt+="<tr>";
						String select = "select * from product_tbl where iProductId="+citems[i];
	         		 	dt.rs=dt.st.executeQuery(select);
	         		 	String pname="",id="",price="",brand="",img="",stock="";
	         		 	while(dt.rs.next())
	         		 	{
	         		 		pname=dt.rs.getString("vProductName");
	         		 		price=dt.rs.getString("dSellPrice");
	         		 		txt+="<td>"+pname+"</td><td>"+price+"</td>";
	         		 		subtot = Math.round(Double.parseDouble(price) * 100.00 * Double.parseDouble(qitems[i]) ) / 100.00;
	         		 		txt+="<td>"+qitems[i]+"</td><td>"+subtot+"</td></tr>";
	         		 	}
					}
				txt += "</td></tr><tr><td colspan=4><b>Total : "+tot+"</b></td></tr></table></font></center>"; 
				txt += "Thank you.\n";
				txt += "For any query or concern  mail us at care4you2019@gmail.com ";
	
				
			
				//sending mail about order placed
				Mail mail=new Mail(uid,sub,txt);
				LocalDate mydate=LocalDate.now();
				String insert="insert into order_tbl (iProductId,iQuantity,iSignupId,dOrderDate,dPayment,eStatus) values ('"+pid+"','"+qt+"','"+user+"','"+mydate+"','"+tot+"','A')";
				dt.st.executeUpdate(insert);
				String qties[]=qt.split("/");
				for(int i=0;i<counts.length;i++)
				{
				
				 update = "Update product_tbl set iProductStock = iProductStock - '"+qties[i]+"' where iProductId=" + counts[i];
				
				dt.st.executeUpdate(update);
				}
				
				response.sendRedirect("Thank.jsp");
				
			}
			catch(Exception ex){
				out.println(ex.toString());
			}
%>
		

