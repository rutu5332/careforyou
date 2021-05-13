<%@page import="Storage.Data"%>
<html>
<body>

  <%
  	Data dt =new Data();
  
  	String iid=request.getParameter("id");
  	String table=(String)session.getAttribute("tblval");
  	String column=(String)session.getAttribute("clmval");
  	String p=(String)session.getAttribute("pageval");
  	
  	int uid=Integer.parseInt(iid);
  		

  		try{
  			dt.st = dt.cn.createStatement();
  			//String del = "delete from "+table+" where "+column+"="+uid ;
  			
  			String del = "update "+table+" SET eStatus = 'I' WHERE " +column+ "=" +uid ;
  			
			int c=dt.st.executeUpdate(del);
				
  			System.out.println(c);
  			response.sendRedirect(p);
  		}
  		catch(Exception e)
  		{
  			System.out.println(e);
  		}
  		
  		
  		%>
  	
</body>
</html>