<!DOCTYPE html>
<%@page import="Storage.Data"%>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Notification Details</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

	<%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%>

	<jsp:include page="header.jsp"></jsp:include> 
	<% 
		String id=request.getParameter("id");
		String tbl="",fid="",heading="";
		Data dt=new Data();
		String select,update;
		dt.st=dt.cn.createStatement();
		update="update notification_tbl set eStatus='I' where iNotificationId="+id;
		dt.st.executeUpdate(update);
		select="select * from notification_tbl where iNotificationId="+id;
		dt.rs=dt.st.executeQuery(select);
		while(dt.rs.next())
		{
			tbl=dt.rs.getString("vFacilityTable");
			fid=dt.rs.getString("iFacilityId");
			heading=dt.rs.getString("vNotificationDetails");
		}
	%>
	
	<div class="banner-area responsive-auto-height text-small" style="height:auto;">
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/26.jpg);">
			<div class="box-table">
				<div class="box-cell">
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:10px 0px;">
									<div class="info">
										<div class="heading">
											<h2>Notification Details</h2>
										</div>
										<% 
											String pid="",did="",date="",time="",type="",dis="",fees="";
											out.println("<h2>"+heading+"</h2>");	
											out.println("<h4><u>Details	</u></h4>");	
											if(tbl.equalsIgnoreCase("docappointment_tbl"))
											{
												select="select * from docappointment_tbl where iAppointId="+fid;
												dt.rs=dt.st.executeQuery(select);
												while(dt.rs.next())
												{
													pid=dt.rs.getString("iPatientId");
													did=dt.rs.getString("iDoctorId");
													date=dt.rs.getString("dAppointDate");
													time=dt.rs.getString("tAppointTime");
													type=dt.rs.getString("vAppointType");
													dis=dt.rs.getString("vDisease");
													fees=dt.rs.getString("iPayment");
												}
												String slct = "select * from patient_tbl where iPatientId=" + pid;
												dt.rs = dt.st.executeQuery(slct);
												while (dt.rs.next()) {
											
													out.println("<h4>Patient Id : p-" + pid + "</h4>");
													out.println(
															"<h4>Patient Name : " + dt.rs.getString("vFname") + " " + dt.rs.getString("vLname") + "</h4>");
													out.println("<h4>Email : " + dt.rs.getString("vEmail") + "</h4>");
													out.println("<h4>Gender : " + dt.rs.getString("vGender") + "</h4>");
													out.println("<h4>Age : " + dt.rs.getString("iAge") + "</h4>");
													out.println("<h4>Phone no : " + dt.rs.getString("vPhoneNo") + "</h4>");
												}
												String sql_slt = "select * from doctorinfo_tbl where iDoctorId=" + did;
												dt.rs = dt.st.executeQuery(sql_slt);
												while (dt.rs.next()) {
													out.println("<h4>Doctor Name : Dr." + dt.rs.getString("vFirstName") + " " + dt.rs.getString("vLastName")
															+ "</h4>");
												}
												out.println("<h4>Appointment Type : " + type + " Visit</h4>");
												out.println("<h4>Date : " + date + "</h4>");
												out.println("<h4>Time : " + time + "</h4>");
												out.println("<h4>Disease : " + dis + "</h4>");
												out.println("<h4>Amount : " + fees + "</h4>");
												
											}
											else if(tbl.equalsIgnoreCase("testappointment_tbl"))
											{
												String tid="",tnm="",mid="",reports="";
												select="select * from testappointment_tbl where iTappointId="+fid;
												dt.rs=dt.st.executeQuery(select);
												while(dt.rs.next())
												{
													pid=dt.rs.getString("iPatientId");
													date=dt.rs.getString("dAppointDate");
													time=dt.rs.getString("tAppointTime");
													fees=dt.rs.getString("iPayment");
													tid=dt.rs.getString("iTestId");
													reports=dt.rs.getString("vReports");
												}
												String slct = "select * from patient_tbl where iPatientId=" + pid;
												dt.rs = dt.st.executeQuery(slct);
												while (dt.rs.next()) {
													out.println("<h4>Patient Id : p-" + pid + "</h4>");
													out.println(
															"<h4>Patient Name : " + dt.rs.getString("vFname") + " " + dt.rs.getString("vLname") + "</h4>");
													out.println("<h4>Email : " + dt.rs.getString("vEmail") + "</h4>");
													out.println("<h4>Gender : " + dt.rs.getString("vGender") + "</h4>");
													out.println("<h4>Age : " + dt.rs.getString("iAge") + "</h4>");
													out.println("<h4>Phone no : " + dt.rs.getString("vPhoneNo") + "</h4>");
												}
												if(! reports.equalsIgnoreCase("none"))
												{
													out.println("<h4>Report : <u><a style=\"color:blue;\" ");
													out.println("href=\"assets/img/reports/"+reports+"\">OPEN");
													out.println("</a></u></h4>");
												}
												select="select * from test_tbl where iTestId="+tid;
												dt.rs=dt.st.executeQuery(select);
												while(dt.rs.next())
												{
													tnm=dt.rs.getString("vTestName");
													mid=dt.rs.getString("iMainTestId");
												}
												select="select * from maintest_tbl where iMainTestId="+mid;
												dt.rs=dt.st.executeQuery(select);
												while(dt.rs.next())
												{
													out.println("<h4>Main Test : " + dt.rs.getString("vMainTestName") + "</h4>");
												}
												out.println("<h4>Sub Test : " + tnm  + "</h4>");
												out.println("<h4>Date : " + date + "</h4>");
												out.println("<h4>Time : " + time + "</h4>");
												out.println("<h4>Amount : " + fees + "</h4>");
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