<!DOCTYPE html>
<%@page import="Storage.Data"%>
<%@page import="server.dt_tm"%>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Lab Appointment</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
<!-- Preloader Start -->
	<div class="se-pre-con"></div>
	<!-- Preloader Ends -->

	<%
		if (session.getAttribute("user") == null)
			response.sendRedirect("Index.jsp");
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<%
		String testid, date;
		testid = request.getParameter("testid").trim();
		date = request.getParameter("date").trim();
		//fees = request.getParameter("fees").trim();
		String dys = request.getParameter("days").trim();
		System.out.println(dys);
		String days[] = (request.getParameter("days").trim()).split("/");
		String dy = request.getParameter("day").trim();
		int d = Integer.parseInt(dy);
	%>
	
	<%
		String patids="";
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		String select="select * from patient_tbl";
		dt.rs=dt.st.executeQuery(select);
		while(dt.rs.next())
		{
			patids += dt.rs.getString("iPAtientId")+ "/";
		}
		
	%>

	<!-- Start Breadcrumb 
    ============================================= -->
	<div class="breadcrumb-area shadow dark bg-fixed text-light"
		style="background-image: url(assets/img/banner/5.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Lab Appointment</h1>
				</div>

			</div>
		</div>
	</div>
	<!-- End Breadcrumb -->

	<!-- Start Features
    ============================================= -->
	<div class="features-area default-padding bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-6 appoinment">
					<div class="appoinment-box">
						<div class="heading">
							<h4>Make an Appointment</h4>
							
						</div>
						<form action="LabSubmit.jsp" method="post" name="labApp2">
							<input type="hidden" name="testid" value="<%out.println(testid);%>">
							<input type="hidden" name="date" value="<%out.println(date);%>">
							
							<input type="hidden" name="patids" id="patids" value="<%out.println(patids);%>">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<div class="col-md-2"
										style="font-size: 25px; padding-top: 5px;">p-</div>
									<div class="col-md-8">
										<div class="form-group">
											<input class="form-control" id="pid" name="pid"
												placeholder="Patient ID *" type="text">
										</div>
										<span style="color: red" id="pidErr2"></span>
									</div><div class="col-md-2"></div>
									<span style="color: red" id="pidErr"></span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<select id="time" name="time">
											<option value="time">--Select Time--</option>
											<%
												dt_tm tmd = new dt_tm();
												String print = tmd.get_timeslot(days, d);
												String tms[] = print.split("/");
												if (tms.length == 1) {
													out.println("<option value=\"no\">----No slots Available---- </option>");
												} else {
													for (int i = 0; i < tms.length; i++) {
														out.println("<option value=\"" + tms[i] + "\"> " + tms[i] + "</option>");
													}
												}
											%>
										</select> <span style="color: red" id="timeErr"></span>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-12">
                                    <div class="form-group comments">
                                        <textarea class="form-control" id="address" name="address" placeholder="Address *"></textarea>
                                        <span style="color:red" id="addErr"></span>
                                    </div>
                                </div>
                             </div>
							
							<div class="row">
								<div class="col-md-12">
									<button type="submit" name="labsub2" id="labsub2">
										Book Appointment <i class="fa fa-paper-plane"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>

<script src="assets/js/Labjs.js"></script>
    
</html>