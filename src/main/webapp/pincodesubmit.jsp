
<%@page import="Storage.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		
		String sql_menu = "select * from pincode_tbl";
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		
		String id="";
		boolean flag=false;

		id=request.getParameter("pcode");
		
		
		try
		{
			
			
			while(dt.rs.next())
			{
					String eid=dt.rs.getString("iPincodes");
					
			
				
				if(eid.equals(id) )
				{
					flag=true;
					// session.setAttribute("user", user_name);
					String msg="We are here..Go for Checkout";
							
					response.sendRedirect("Cart.jsp?msg="+msg);
				}
			}
			if(flag!=true)
			{
				String msg="Sorry ..We are not here";
				
				response.sendRedirect("Cart.jsp?msg="+msg);
				
				
					
			}
			
			 
		}

		
		catch(Exception ex)
		{
			out.println(ex);
		}

			
	

%>
