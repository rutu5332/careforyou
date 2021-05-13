
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>care for you</title>
</head>
<body>

	<%-- <%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%> --%>
	<%
		String type=request.getParameter("t1");
		String id=request.getParameter("id");
		String dt=request.getParameter("date");
		//System.out.println(dt);
		if(type.equalsIgnoreCase("Home Visit"))
		{
			//response.sendRedirect("HomeAppointmentForm.jsp");
			request.getRequestDispatcher("HomeAppointmentForm.jsp").forward(request, response);
		}
		else
		{
			/* response.sendRedirect("ClinicAppointmentForm.jsp"); */
			request.getRequestDispatcher("ClinicAppointmentForm.jsp").forward(request, response);
		}
	%>
</body>
</html>