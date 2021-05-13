
<%@page import="Storage.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		
		String sql_menu = "select * from signup_tbl";
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		
		String id,psw;
		boolean flag=false;

		id=request.getParameter("Email");
		psw=request.getParameter("Password");
		
		try
		{
			
			
			while(dt.rs.next())
			{
					String eid=dt.rs.getString("vEmail");
					String user_name=dt.rs.getString("vUserName");
					String psw1=dt.rs.getString("vPassword");
				out.println(eid);
				out.println(psw1);
				if(eid.equals(id) && psw1.equals(psw))
				{
					flag=true;
					session.setAttribute("user", user_name);
					response.sendRedirect("index.jsp");
				}
			}
			if(flag!=true)
			{
				String msg="Invalid Username Or Password";
				response.sendRedirect("Login.jsp?msg");
					
			}
			
			 
		}

		
		catch(Exception ex)
		{
			out.println("hi");
		}

			
	

%>
