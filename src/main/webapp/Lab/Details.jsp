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
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
	%>

	<jsp:include page="headerlab.jsp"></jsp:include> 
	<% 
		String lid="";
		if(session.getAttribute("labid") != null)
			lid=session.getAttribute("labid").toString();
		
		String pid="";
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		pid=request.getParameter("id");
		//System.out.println(pid);
		lid="9";
	%>
	<div class="banner-area responsive-auto-height text-small" style="overflow:auto;height: auto;"> 
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/26.jpg);">
			<div class="box-table" >
				<div class="box-cell" >
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:5px 0px 20px 0px;">
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
											 
											String select;//="select * from testappointment_tbl where iPatientId=" + pid;
											select="select * from testappointment_tbl ta inner join test_tbl t";
											select+=" on ta.iTestId=t.iTestId where iPatientId=" + pid;
											dt.rs=dt.st.executeQuery(select);
											while(dt.rs.next())
											{
												out.println("<div class=\"appoinment-box\" style=\"margin-bottom:10px;\">");
												out.println("<h4 style=\"color:black;\">Date : " + dt.rs.getString("dAppointDate") + "</h4>");
												
												out.println("<h4 style=\"color:grey;\">Time : " + dt.rs.getString("tAppointTime") + "</h4>");
												out.println("<h4 style=\"color:grey;\">Test Name : " + dt.rs.getString("vTestName") + "</h4>");
												out.println("<h4 style=\"color:grey;\">Amount : " + dt.rs.getString("iPayment") + "</h4>");
												if(! dt.rs.getString("vReports").equals("none"))
												{
													/* out.println("<h4 style=\"color:grey;\">Report : <embed src=\"../assets/img/reports/" );
													out.println(dt.rs.getString("vReports") + "\" type=\"application/pdf\" class=\"responsive\">");
													out.println("<a href=\"#\">fd</a> </h4>"); */
													out.println("<h4 style=\"color:grey;\">Report : <u><a style=\"color:blue;\" ");
													out.println("href=\"../assets/img/reports/"+dt.rs.getString("vReports")+"\">OPEN");
													out.println("</a></u></h4>");
												}
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
<jsp:include page="footer.jsp"></jsp:include>
</html>