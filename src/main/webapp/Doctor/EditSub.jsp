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
		String name="",id="",phno="",gen="",lname="",fees="",add="",st="";
		if(session.getAttribute("docid") != null)
			id=session.getAttribute("docid").toString();
		name=request.getParameter("fname");
		lname=request.getParameter("lname");
		gen=request.getParameter("gender");
		phno=request.getParameter("phone");
		fees=request.getParameter("fees");
		add=request.getParameter("address");
		st=request.getParameter("type");
		
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		String update="update doctorinfo_tbl set vFirstName='" + name + "',vLastName='" + lname + "',";
		update+="vGender='" +gen+"',vMobile='"+ phno+"',iFees="+fees+",iWorkType="+st+" where iDoctorId="+id;
		session.setAttribute("doctor",name+" "+lname);
		dt.st.executeUpdate(update);
		if(add != "")
		{
			update="update doctorinfo_tbl set vClinicAdd='" +add +"' where iDoctorId="+id;
			dt.st.executeUpdate(update);
		}
		
		response.sendRedirect("Profile.jsp");
	%>
</body>
</html>