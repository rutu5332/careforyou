<%@page import="Storage.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		
		String sql_menu = "select * from signup_tbl";
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		String sid=" ";
		sid=(request.getParameter("email")).trim();
		//System.out.println(sid);
		
		String id,pswold,pswnew;
		boolean flag=false;
		
		
		pswnew=request.getParameter("PasswordNew");
		
		try
		{
			
			
			while(dt.rs.next())
			{
					//String eid=dt.rs.getString("vEmail");
				String eid=dt.rs.getString("vEmail");
				
				if( eid.equals(sid))
				{
					flag=true;
					String sql_up = "update signup_tbl SET vPassword='"+pswnew+"'  WHERE vEmail='"+sid+"' ";
					int c=dt.st.executeUpdate(sql_up);
				    System.out.println(c+" record updated");
					response.sendRedirect("index.jsp");
				}
			}
			if(flag!=true)
			{
				String msg="Invalid Username";
				System.out.println("error");
				response.sendRedirect("Forgotpsw.jsp?msg="+msg);
			}
			
			 
		}

		
		catch(Exception ex)
		{
			out.println(ex);
		}

%>
<script type="text/javascript">window.onload=alertname</script>