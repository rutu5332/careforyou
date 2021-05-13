<%@page import="Storage.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		
		String sql_menu = "select * from signup_tbl";
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		String msg;
		String id,pswold,pswnew,cpsw;
		boolean flag=false;

		id=session.getAttribute("email").toString();;
		pswold=request.getParameter("PasswordOld");
		pswnew=request.getParameter("PasswordNew");
		cpsw=request.getParameter("Password");
		
		if(! pswnew.equalsIgnoreCase(cpsw))
		{
			msg="Confirm password is not match with password";
			response.sendRedirect("Changepsw.jsp?msg="+msg);
		}
		
		try
		{
			
			
			while(dt.rs.next())
			{
					String eid=dt.rs.getString("vEmail");
					String psw=dt.rs.getString("vPassword");
				
				if(eid.equals(id) && psw.equals(pswold))
				{
					flag=true;
					String sql_up = "update signup_tbl SET vPassword='"+pswnew+"'  WHERE vEmail='"+eid+"' ";
					int c=dt.st.executeUpdate(sql_up);
				    //System.out.println(c+" record updated");
					response.sendRedirect("index.jsp");
				}
			}
			if(flag!=true)
			{
				msg="Invalid Old Password ";
				response.sendRedirect("Changepsw.jsp?msg="+msg);
			}
			
			 
		}

		
		catch(Exception ex)
		{
			out.println(ex);
		}

%>
<script type="text/javascript">window.onload=alertname</script>