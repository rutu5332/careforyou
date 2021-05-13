<%@page import="java.util.function.Function"%>


<head>
<!-- ========== Meta Tags ========== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- ========== Page Title ========== -->
<title>Signup</title>

<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<!-- ========== Start Stylesheet ========== -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<link href="assets/css/flaticon-set.css" rel="stylesheet" />
<link href="assets/css/magnific-popup.css" rel="stylesheet" />
<link href="assets/css/owl.carousel.min.css" rel="stylesheet" />
<link href="assets/css/owl.theme.default.min.css" rel="stylesheet" />
<link href="assets/css/animate.css" rel="stylesheet" />
<link href="assets/css/bootsnav.css" rel="stylesheet" />
<link href="style.css" rel="stylesheet">
<link href="assets/css/responsive.css" rel="stylesheet" />
<!-- ========== End Stylesheet ========== -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="assets/js/html5/html5shiv.min.js"></script>
 	  <script src="assets/js/html5/respond.min.js"></script>
      
    <![endif]-->

<!-- ========== Google Fonts ========== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800"
	rel="stylesheet">


</head>
<body>
	<div class="se-pre-con"></div>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="banner-area responsive-auto-height text-small"
		style="height: 1200px;">
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/4.jpg)">
			<div class="box-table">
				<div class="box-cell">
					<div class="container">
						<div class="row">
							<div class="content double-items">

								<div class="col-md-7 col-sm-6">
									<h1 data-animation="animated slideInRight">
										Best care for your <span> Good health</span>
									</h1>
									<p data-animation="animated slideInUp">
										<!--  The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects. -->
									</p>
									<!--  <a data-animation="animated slideInUp" class="btn btn-light border btn-md" href="#">View Details</a> -->
								</div>

								<!-- Start Appoinment Form -->

								<div class="col-md-5 col-sm-6 appoinment">
									<div class="appoinment-box">
										<div class="heading">
											<h2>Sign Up</h2>
										</div>
										<form action="../Signup" method="post" name="form1"
											enctype="multipart/form-data">

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="fname" name="fname"
															placeholder="First Name *" type="text"> <span
															id="errorfname" style="color: red"></span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="lname" name="lname"
															placeholder="Last Name*" type="text"> <span
															id="errorlname" style="color: red"></span>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="birthdate"
															name="birthdate" value="Enter birthdate*"
															type="date"> <span id="errorbirthdate"
															style="color: red"></span>
													</div>
												</div>
											</div>

											<div class="col-md-12">
												<table>
													<tr>
														<td>&nbsp;<input name="r1" type="radio" value="male"
															style="height: 20px; width: 20px; verticle-align: middle;"></td>
														<td>&nbsp;Male</td>
														<td>&nbsp;&nbsp;<input name="r1" type="radio"
															value="female" style="height: 20px; width: 20px;"></td>
														<td>&nbsp;Female</td>
														<td><span id="errorgen" style="color: red"></span></td>
													</tr>
												</table>

											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<textarea class="form-control"
														placeholder="Enter Clinic Address" id="Address"
														name="Address"></textarea>
													<span id="erroradd" style="color: red"></span>
												</div>
											</div>
											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input class="form-control" id="Mobile" name="Mobile"
														placeholder="Mobile Number" type="text"> <span
														id="errormobile" style="color: red"></span>
												</div>
											</div>
											</div>
											
											<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													 
														<select class="form-control" id="degree" name="degree">
															<option value="0">Department</option>
															<option value="1">Primary Care</option>
															<option value="2">Cardiologist</option>
															<option value="3">Dermatologist</option>
															<option value="4">Pediatrician</option>
															<option value="5">Neurologist</option>
															<option value="6">Psychiatrist</option>
															<option value="7">Gynecologist</option>
															<option value="8">Urologist</option>
															<option value="9">Radiologist</option>
															<option value="10">Orthopedist</option>
															<option value="11">Immunologist</option>
															<option value="12">Dentist</option>
														</select> <span
														id="errordeg" style="color: red"></span>
												</div>
											</div>
											
											<div class="col-md-6">
												<div class="form-group">
													<input class="form-control" id="Exp" name="Exp"
														placeholder="Years of Experience" type="number"> <span
														id="errorexp" style="color: red"></span>
												</div>
											</div>
											</div>
											
											<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input class="form-control" id="Email" name="Email"
														placeholder="Email" type="email">
												</div>
												<span id="errormail" style="color: red"></span>
											</div>
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<select name="type" id="type">
															<option value="0">Select service type</option>
															<option  value="1">Home Visit</option>
															<option  value="2">Clinic Service</option>
															<option  value="3">Both</option>
														
														</select>
													</div>
													<span id="errortype" style="color: red"></span>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input type="text" class="form-control" id="fees"
															name="fees" placeholder="Fees"> 
															<span
															id="errorfees" style="color: red"></span>
													</div>
												</div>
											
											</div>
											
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<input class="form-control" id="Password" name="Password"
															placeholder="Password" type="password"> <span
															id="pswerror" style="color: red"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input class="form-control" id="cpsw" name="cpsw"
															placeholder="Confirm Password" type="password"> <span
															id="errorcpsw" style="color: red"></span>
													</div>
												</div>
											</div>
											<div class="row">
											<div class="col-md-12">
												<div class="col-md-6">
													<div class="form-group">
														<br><label style="font-size:27px;text-align:center;">Your Image : </label>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input type="file" class="form-control" id="image"
															name="image"> 
															<span
															id="errorfile" style="color: red"></span>
													</div>
												</div>

											</div>
											</div>
											
											<div class="row">
											<div class="col-md-12">
												<div class="col-md-6">
													<div class="form-group">
														<br><label style="font-size:25px;text-align:center;">License Image : </label>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<input type="file" class="form-control" id="license"
															name="license"> 
															<span
															id="errorlic" style="color: red"></span>
													</div>
												</div>

											</div>

											<div class="row">
												<div class="col-md-12">
													<button type="submit" name="submit1" id="submit1">
														Submit <i class="fa fa-paper-plane"></i>
													</button>
												</div>
												</div>
											</div>
									
									</form>
								</div>
							</div>
							<!-- End Appoinment Form -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


</body>

<script src="assets/js/Signupdcjs.js"></script>

