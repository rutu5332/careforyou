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
		String name="",id="",phno="",gen="";
		if(session.getAttribute("uid") != null)
			id=session.getAttribute("uid").toString();
		name=request.getParameter("name");
		gen=request.getParameter("gender");
		phno=request.getParameter("phone");
		
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		String update="update signup_tbl set vUserName='" + name + "' where iSignupId="+id;
		session.setAttribute("user",name);
		dt.st.executeUpdate(update);
		update="update signup_tbl set vGender='" +gen+"' where iSignupId="+id;
		dt.st.executeUpdate(update);
		update="update signup_tbl set vMobile=" +phno+" where iSignupId="+id;
		dt.st.executeUpdate(update);
		response.sendRedirect("profile.jsp");
	%>
</body>
</html>