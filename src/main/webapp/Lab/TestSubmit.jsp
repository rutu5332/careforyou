<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Storage.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name="",mid="",phid="",price="";
	name=request.getParameter("Name");
	mid=request.getParameter("MainTest");
	price=request.getParameter("Price");
	phid=request.getParameter("PhId");
	Data dt=new Data();
	dt.st=dt.cn.createStatement();
	String insert="insert into test_tbl(iPhleboId,vTestName,fTestPrice,iMainTestId,eStatus)";
	insert +="values("+phid+",'"+name+"',"+price+","+mid+",'A')";
	dt.st.executeUpdate(insert);
	response.sendRedirect("Profile.jsp");
%>
</body>
</html>