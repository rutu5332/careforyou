<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Storage.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String id=request.getParameter("id");
	String cart="",qty="";
	if(session.getAttribute("cart") !=null)
			cart=session.getAttribute("cart").toString();
	if(session.getAttribute("quantity") !=null)
			qty=session.getAttribute("quantity").toString();
	
	if(cart.equals("0"))
		cart="";
	if(qty.equals("0"))
		qty="";
	
	cart+=id+"/";
	qty+="1/";
	//System.out.println("after add cart :: "+cart);
	session.setAttribute("cart", cart);
	session.setAttribute("quantity",qty);
	if(session.getAttribute("uid") != null )
	{
		String update;
		id=session.getAttribute("uid").toString();
		try
		{
			Data dt=new Data();
			dt.st=dt.st=dt.cn.createStatement();
			update="update cart_tbl set vProducts='" + cart + "',vQuantity='"+ qty +"' where iSignupId="+id;
			dt.st.executeUpdate(update);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	response.sendRedirect(request.getHeader("Referer"));
%>

</body>
</html>