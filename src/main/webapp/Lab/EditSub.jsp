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
		String name="",id="1",phno="",add="";
		if(session.getAttribute("labid") != null)
			id=session.getAttribute("labid").toString();
		name=request.getParameter("name");
		//lname=request.getParameter("lname");
		//gen=request.getParameter("gender");
		phno=request.getParameter("phone");
		//fees=request.getParameter("fees");
		add=request.getParameter("address");
		System.out.println(name + phno + add + id);
		id="1";
		
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		String update="update lab_tbl set vLabName='" + name + "' , iLabPhno="+ phno+" where iLabId="+id;
		System.out.println(update);
		session.setAttribute("lab",name);
		dt.st.executeUpdate(update);
		if(add != "")
		{
			update="update lab_tbl set vLabAddress='" +add +"' where iLabId="+id;
			dt.st.executeUpdate(update);
		}
		
		response.sendRedirect("Profile.jsp");
	%>
</body>
</html>