<%@page import="Storage.Data"%>
<html>
<body>

  <%
  	Data dt =new Data();
  	String iid=request.getParameter("id");
 
  	  	int uid=Integer.parseInt(iid);
  	  
  		try{
  			dt.st = dt.cn.createStatement();
  			String del = "delete from contact_tbl where iContactId="+uid ;
  			dt.st.executeUpdate(del);
  			
  			response.sendRedirect("Contactdata.jsp");
  		}
  		catch(Exception e)
  		{
  			System.out.println(e);
  		}
  %>
  	
</body>
</html>