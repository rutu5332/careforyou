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
		String mon,tue,wed,thu,fri,sat,id="";
		mon= ((request.getParameter("mon-st").toString()).length() == 2) ? request.getParameter("mon-st") : "0"+ request.getParameter("mon-st");
		mon += "-" + (((request.getParameter("mon-end").toString()).length() == 2) ? request.getParameter("mon-end") : "0"+ request.getParameter("mon-end"));
		tue= ((request.getParameter("tue-st").toString()).length() == 2) ? request.getParameter("tue-st") : "0"+ request.getParameter("tue-st");
		tue += "-" + (((request.getParameter("tue-end").toString()).length() == 2) ? request.getParameter("tue-end") : "0"+ request.getParameter("tue-end"));
		wed= ((request.getParameter("wed-st").toString()).length() == 2) ? request.getParameter("wed-st") : "0"+ request.getParameter("wed-st");
		wed += "-" + (((request.getParameter("wed-end").toString()).length() == 2) ? request.getParameter("wed-end") : "0"+ request.getParameter("wed-end"));
		thu= ((request.getParameter("thu-st").toString()).length() == 2) ? request.getParameter("thu-st") : "0"+ request.getParameter("thu-st");
		thu += "-" + (((request.getParameter("thu-end").toString()).length() == 2) ? request.getParameter("thu-end") : "0"+ request.getParameter("thu-end"));
		fri= ((request.getParameter("fri-st").toString()).length() == 2) ? request.getParameter("fri-st") : "0"+ request.getParameter("fri-st");
		fri += "-" + (((request.getParameter("fri-end").toString()).length() == 2) ? request.getParameter("fri-end") : "0"+ request.getParameter("fri-end"));
		sat= ((request.getParameter("sat-st").toString()).length() == 2) ? request.getParameter("sat-st") : "0"+ request.getParameter("sat-st");
		sat += "-" + (((request.getParameter("sat-end").toString()).length() == 2) ? request.getParameter("sat-end") : "0"+ request.getParameter("sat-end"));
		
		//id=request.getParameter("docid");
		if(session.getAttribute("docid") != null)
			id=session.getAttribute("docid").toString();
		System.out.println("done at "+id);
		
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		String insert="update dctimehour_tbl set Mon='"+mon+"',Tue='"+tue+"',Wed='"+wed+"',Thur='"+thu+"',Fri='"+fri+"',Sat='"+sat+"' where iDoctorId="+id;
		dt.st.executeUpdate(insert); 
		response.sendRedirect("index.jsp");
	%>
</body>
</html>