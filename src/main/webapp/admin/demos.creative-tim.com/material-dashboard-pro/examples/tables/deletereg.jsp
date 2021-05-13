<%@page import="Storage.Data"%>
<html>
<body>

  <%
  	Data dt =new Data();
  	String iid=request.getParameter("id");
 
  	  	int uid=Integer.parseInt(iid);
  	  
  		try{
  			dt.st = dt.cn.createStatement();
  			String del = "delete from signup_tbl where iSignupId="+uid ;
  			dt.st.executeUpdate(del);
  			
  			response.sendRedirect("RegData.jsp");
  		}
  		catch(Exception e)
  		{
  			System.out.println(e);
  		}
  %>
  	
</body>
</html>