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
    <title>Doctor Information</title>
    
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

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Start Breadcrumb 
    ============================================= -->
	<div class="breadcrumb-area shadow dark bg-fixed text-light"
		style="background-image: url(assets/img/banner/25.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Doctor Details</h1>
				</div>
				<!--  <div class="col-md-6 text-right">
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                        <li><a href="#">Services</a></li>
                        <li class="active">Doctor-details</li>
                    </ul>
                </div> -->
			</div>
		</div>
	</div>
	<!-- End Breadcrumb -->


	<%
		String id = request.getParameter("id");
		Data dt = new Data();
		int id_dc = Integer.parseInt(id);
		dt.st = dt.cn.createStatement();
		String sql = "select * from doctorinfo_tbl where iDoctorId=" + id_dc + " ";
		
		dt.rs = dt.st.executeQuery(sql);

		String fnm = "", lnm = "", email = "", phno = "", flnm = "", address = "", gender = "", degree = "",
				exp = "",fees="";
		int type=0;
		String days="";
		String mon = "", tue = "", wed = "", thur = "", fri = "", sat = "";
		while (dt.rs.next()) {
			flnm = dt.rs.getString("vFileName");
			fnm = dt.rs.getString("vFirstName");
			lnm = dt.rs.getString("vLastName");
			degree = dt.rs.getString("vDegree");
			exp = dt.rs.getString("iExperience");
			email = dt.rs.getString("vEmail");
			phno = dt.rs.getString("vMobile");
			address = dt.rs.getString("vClinicAdd");
			gender = dt.rs.getString("vGender");
			type=Integer.parseInt(dt.rs.getString("iWorkType"));
			fees=dt.rs.getString("iFees");
		}
		String depnames[]={"","Primary Care","cardiologist","dermatologist","pediatrician","neurologist",
				"psychiatrist","gynecologist","urologist","radiologist","orthopedist","immunologist","dentist"};
		String tm = "select * from dctimehour_tbl where iDoctorId=" + id_dc;
		dt.rs = dt.st.executeQuery(tm);

		while (dt.rs.next()) {
			mon = dt.rs.getString("Mon");
			tue = dt.rs.getString("Tue");
			wed = dt.rs.getString("Wed");
			thur = dt.rs.getString("Thur");
			fri = dt.rs.getString("Fri");
			sat = dt.rs.getString("Sat");
		}
		days="00-00/"+mon+"/"+tue+"/"+wed+"/"+thur+"/"+fri+"/"+sat+"/00-00";
		if(mon.equals("00-00"))
			mon="Closed";
		if(tue.equals("00-00"))
			tue="Closed";
		if(wed.equals("00-00"))
			wed="Closed";
		if(thur.equals("00-00"))
			thur="Closed";
		if(fri.equals("00-00"))
			fri="Closed";
		if(sat.equals("00-00"))
			sat="Closed";
		
	%>
	<div class="doctor-details-area default-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="thumb">
						<img src="assets/img/doctors/<%out.println(flnm);%>" alt="Thumb">
					</div>
				</div>
			<div class="col-md-8">
				<div class="info">
					<h2><%out.println("Dr."+" "+fnm+" "+lnm ); %></h2>
					<h4><%out.println("Qualification : "+" "+ depnames[Integer.parseInt(degree)]); %> </h4>
					<h4><%out.println("Experience : "+" "+ exp +" Years") ;%></h4>
					<h4><%out.println("Gender : " + gender ); %></h4>
					<%-- <h4><%out.println("Contact Number : " + phno); %> </h4> --%>
					<h4><%out.println("Email : " + email); %></h4>
					<h4><%out.println("Clinic Address : " + address ); %></h4>
					<h4><%out.println("Fees : " + fees); %></h4>
					<%-- <%
						String link="Appointment.jsp";
						/* if(session.getAttribute("uid") == null)
						{
							link="Login.jsp";
						} */
					%> --%>
					<form method="post" action="Appointment.jsp">
						<input type="hidden" name="id" value="<%out.println(id);%>" >
						<input type="hidden" name="fees" value="<%out.println(fees);%>" >
						<!-- <div class="col-md-12">
							<table>
								<tr>
									<td>&nbsp;<input name="t1" id="t1" type="radio"
										value="Clinic Visit"
										style="height: 20px; width: 20px; verticle-align: middle;"></td>
									<td>&nbsp;Clinic Visit</td>
									<td>&nbsp;&nbsp;<input name="t1" id="t1"
										value="Home Visit" type="radio"
										style="height: 20px; width: 20px;"></td>
									<td>&nbsp;Home Visit &nbsp;</td>
									<td><span id="errortype" style="color: red"></span></td>
								</tr>
							</table>
						</div> -->
						<div class="col-md-12">
							<table>
								<tr>
								<%
									switch(type)
									{
										case 1:
										{
											out.println("<td>&nbsp;&nbsp;<input   name=\"t1\" id=\"t1\" value=\"Home Visit\" type=\"radio\" style=\"height:20px;width:20px;\"></td>");
									 		out.println("<td>&nbsp;Home Visit &nbsp;*</td>");
									 		out.println("<td><span id=\"errorgen\" style=\"color:red\"></span></td>");
									 		break;
										}
										case 2:
										{
											out.println("<td >&nbsp;<input name=\"t1\" id=\"t1\" type=\"radio\" value=\"Clinic Visit\" style=\"height:20px;width:20px;verticle-align:middle;\"></td>");	
									 		out.println("<td>&nbsp;Clinic Visit &nbsp;*</td>");
									 		break;
										}
										case 3:
										{		
									 		out.println("<td >&nbsp;<input name=\"t1\" id=\"t1\" type=\"radio\" value=\"Clinic Visit\" style=\"height:20px;width:20px;verticle-align:middle;\"></td>");	
									 		out.println("<td>&nbsp;Clinic Visit</td>");
									 		out.println("<td>&nbsp;&nbsp;<input   name=\"t1\" id=\"t1\" value=\"Home Visit\" type=\"radio\" style=\"height:20px;width:20px;\"></td>");
									 		out.println("<td>&nbsp;Home Visit &nbsp;*</td>");
									 		out.println("<td><span id=\"errorgen\" style=\"color:red\"></span></td>");
									 		break;
										}
									}
								%>
								</tr>
							</table>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<select id="date" name="date">
										<option value="dt">Date *</option>
										<option value="today">Today</option>
										<option value="tomorrow">Tomorrow</option>
										<option value="next"><%out.println(java.time.LocalDate.now().plusDays(2)); %></option>
									</select> <span style="color: red" id="dtErr"></span>
								</div>
							</div>
						</div>
						<input type="hidden" name="days" value="<%out.println(days);%>" >
						<button class="btn btn-theme border btn-md" type="Submit" name="docsub" id="docsub">Make Appoinment</button>
					</form>
					

					<ul class="nav nav-pills">
						<li class="active"><a data-toggle="tab" href="#tab1"
							aria-expanded="true"> Working Hours </a></li>
					</ul>
					<div class="tab-content tab-content-info">
						<div id="tab1" class="tab-pane fade active in">
							<div class="info title">
								<h3>Schedule of working hours</h3>
								<ul>
									<li><span> Monday : </span>
										<div class="pull-right"><%out.println(mon); %></div></li>
									<li><span> Tuesday : </span>
										<div class="pull-right"><%out.println(tue); %></div></li>
									<li><span> Wednesday : </span>
										<div class="pull-right"><%out.println(wed); %></div></li>
									<li><span> Thursday : </span>
										<div class="pull-right"><%out.println(thur); %></div></li>
									<li><span> Friday : </span>
										<div class="pull-right"><%out.println(fri); %></div></li>
									<li><span> Saturday : </span>
										<div class="pull-right"><% out.println(sat); %></div></li>
									<li><span> Sunday : </span>
									<div class="pull-right closed">Closed</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="assets/js/Appointmentjs.js"></script>

</body>

<jsp:include page="footer.jsp"></jsp:include>
    
</html>