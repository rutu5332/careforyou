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
		String lnk = request.getHeader("Referer");
		String id = request.getParameter("id");
		String uid;
		String cart = "",qty="";
		if (session.getAttribute("cart") != null)
			cart = session.getAttribute("cart").toString();
		if(session.getAttribute("quantity") !=null)
			qty=session.getAttribute("quantity").toString();

		if (cart.equals("0"))
			cart = "";
		if(qty.equals("0"))
			qty="";
		
		if(cart.indexOf(id) == -1)
		{
			cart += id + "/";
			qty += "1/";
		}
		
		//System.out.println("after add cart :: "+cart);
		session.setAttribute("cart", cart);
		session.setAttribute("quantity",qty);
		if (session.getAttribute("uid") != null) {
			String update;
			uid = session.getAttribute("uid").toString();
			try {
				Data dt = new Data();
				dt.st = dt.st = dt.cn.createStatement();
				update = "update cart_tbl set vProducts='" + cart + "',vQuantity='"+ qty +"' where iSignupId=" + uid;
				dt.st.executeUpdate(update);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		String wlst="";
		if(session.getAttribute("wishlist") !=null)
				wlst=session.getAttribute("wishlist").toString();
		
		wlst=wlst.replace(id+"/" , "");
		
		if(wlst.length() == 0)
			wlst="0";
		//System.out.println("after rmv wlst :: "+wlst);
		session.setAttribute("wishlist", wlst);
		if(session.getAttribute("uid") != null )
		{
			String update;
			uid=session.getAttribute("uid").toString();
			try
			{
				Data dt=new Data();
				dt.st=dt.st=dt.cn.createStatement();
				update="update wishlist_tbl set vProducts='" + wlst + "' where iSignupId="+uid;
				dt.st.executeUpdate(update);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		response.sendRedirect(lnk);
	%>
</body>
</html>