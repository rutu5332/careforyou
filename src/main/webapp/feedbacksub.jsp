<%@page import="Storage.Data" %>
<%@page import="server.Mail" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
			String email=request.getParameter("eid");
			String msg=request.getParameter("fd");
			String text="Thank you for your feedback.";
			try
			{
				Data dt=new Data();
				dt.st=dt.cn.createStatement();
				String insert="insert into feedback_tbl (vEmail,vFeedback) values('"+email+"','"+msg+"')";
				dt.st.executeUpdate(insert);
				Mail mail=new Mail(email,"Feedback",text);
				response.sendRedirect("index.jsp");
			}
			catch(Exception e)
			{
				out.println(e);
			}
		%>
</body>
</html>