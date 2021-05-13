<%@page import="Storage.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
</head>
<body>
	<%
		if(session.getAttribute("doctor") == null)
			response.sendRedirect("../LoginDoc.jsp");
	%>

	<jsp:include page="headerdc.jsp"></jsp:include> 
	<% 
		String did="";
		if(session.getAttribute("docid") != null)
			did=session.getAttribute("docid").toString();
		
		String pid="";//,date="",time="",type="",dis="",fees="";
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		/* String select="select * from docappointment_tbl where iDoctorId="+did;
		dt.rs=dt.st.executeQuery(select);
		while(dt.rs.next())
		{
			//pid=dt.rs.getString("iPatientId");
			date=dt.rs.getString("dAppointDate");
			time=dt.rs.getString("tAppointTime");
			type=dt.rs.getString("vAppointType");
			dis=dt.rs.getString("vDisease");
			//fees=dt.rs.getString("iPayment");
		} */
		pid=request.getParameter("id");
		//System.out.println(pid);
	%>
	<div class="banner-area responsive-auto-height text-small" style="overflow:auto;height: auto;"> 
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/5.jpg);">
			<div class="box-table" >
				<div class="box-cell" >
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:5px 0px;">
									<div class="info">
										<div class="heading">
											<h2>Appointment Details </h2>
										</div>
										<%
											String slct = "select * from patient_tbl where iPatientId=" + pid;
											dt.rs = dt.st.executeQuery(slct);
											while (dt.rs.next()) {
												out.println("<h4>Patient Name : " + dt.rs.getString("vFname") + " " + dt.rs.getString("vLname") + "</h4>");
												out.println("<h4>Email : " + dt.rs.getString("vEmail") + "</h4>");
												out.println("<h4>Gender : " + dt.rs.getString("vGender") + "</h4>");
												out.println("<h4>Age : " + dt.rs.getString("iAge") + "</h4>");
												out.println("<h4>Phone no : " + dt.rs.getString("vPhoneNo") + "</h4>");
											}
											 
											String select="select * from docappointment_tbl where iDoctorId="+did +"&& iPatientId=" + pid;
											dt.rs=dt.st.executeQuery(select);
											while(dt.rs.next())
											{
												out.println("<div class=\"appoinment-box\" style=\"margin-bottom:10px;\">");
												out.println("<h4 style=\"color:black;\">Date : " + dt.rs.getString("dAppointDate") + "</h4>");
												out.println("<h4 style=\"color:grey;\">Appointment Type : " + dt.rs.getString("vAppointType") + " Visit</h4>");
												out.println("<h4 style=\"color:grey;\">Time : " + dt.rs.getString("tAppointTime") + "</h4>");
												out.println("<h4 style=\"color:grey;\">Disease : " + dt.rs.getString("vDisease") + "</h4>");
												//out.println("<h4>Amount : " + dt.rs.getString("iPayment") + "</h4>");
												out.println("</div>");
											} 
											
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>