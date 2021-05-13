<%@page import="Storage.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		String msg;
		String id,pswold,pswnew,cpsw;
		boolean flag=false;

		//id=session.getAttribute("labid").toString();
		id="1";
		pswold=request.getParameter("PasswordOld");
		pswnew=request.getParameter("PasswordNew");
		cpsw=request.getParameter("Password");
		
		String sql_menu = "select * from lab_tbl where iLabId="+id;
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		try
		{
			
			
			while(dt.rs.next())
			{
					//String eid=dt.rs.getString("vEmail");
					String psw=dt.rs.getString("vLabPassword");
				
				if( psw.equals(pswold))
				{
					flag=true;
					String sql_up = "update lab_tbl SET vLabPassword='"+pswnew+"'  WHERE iLabId="+id;
					//int c=
					dt.st.executeUpdate(sql_up);
				    //System.out.println(c+" record updated");
					response.sendRedirect("Profile.jsp");
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