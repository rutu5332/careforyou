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
	
	String ct[]=cart.split("/");
	String qt[]=qty.split("/");
	qty="";
	for(int i=0;i<ct.length;i++)
	{
		if(ct[i].equals(id))
		{
			continue;
		}
		qty += qt[i] + "/";
	}
	//System.out.println(qty);
	cart=cart.replace(id+"/" , "");
	if(cart.length() == 0)
	{
		cart="0";
		qty="0";
	}
	//System.out.println("after rmv cart :: "+cart);
	session.setAttribute("cart", cart);
	if(session.getAttribute("uid") != null )
	{
		String update;
		id=session.getAttribute("uid").toString();
		session.setAttribute("quantity",qty);
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
	//response.sendRedirect("Cart.jsp");
	response.sendRedirect(request.getHeader("Referer"));
%>
</body>
</html>