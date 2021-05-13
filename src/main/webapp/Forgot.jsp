

<%@page import="server.Mail" %>

<head>
<!-- ========== Meta Tags ========== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="care for you">

<!-- ========== Page Title ========== -->
<title>Forgot Password</title>

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


<!-- ========== Google Fonts ========== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800"
	rel="stylesheet">

</head>
<body>
	<div class="se-pre-con"></div>

	<div class="banner-area responsive-auto-height text-small">
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/4.jpg);">
			<div class="box-table">
				<div class="box-cell">
					<div class="container">
						<div class="row">
							<div class="content double-items">

								<div class="col-md-7 col-sm-6">
									<h1 data-animation="animated slideInRight">
										Best care for your <span> Good health</span>
									</h1>
									<p data-animation="animated slideInUp">The ourselves
										suffering the sincerity. Inhabit her manners adapted age
										certain. Debating offended at branched striking be subjects.</p>
									<!--  <a data-animation="animated slideInUp" class="btn btn-light border btn-md" href="#">View Details</a> -->
								</div>

								<!-- Start Appoinment Form -->
								<div class="col-md-5 col-sm-6 appoinment">
									<div class="appoinment-box">
										<div class="heading">
											<h2>Forgot Password</h2>
										</div>
										<form action="Forgotpsw.jsp" method="post" name="form4">
											<div class="row">

												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="Email" name="Email"
															placeholder="Email" type="text"> <span
															id="errormail">
															<%
																String msg;
		                            							msg=request.getParameter("msg");
							                            		if(msg!=null)
							                            		{
							                            			out.println("Invalid email ");
							                            		}
															%>
															</span>
													</div>
												</div>

												<div class="col-md-12">
												
													<button type="submit" name="submit" id="submit">
														Submit <i class="fa fa-paper-plane"></i>
													</button>
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
<jsp:include page="footer.jsp"></jsp:include>
<script src="assets/js/jquery-1.12.4.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/equal-height.min.js"></script>
<script src="assets/js/jquery.appear.js"></script>
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/modernizr.custom.13711.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/isotope.pkgd.min.js"></script>
<script src="assets/js/imagesloaded.pkgd.min.js"></script>
<script src="assets/js/count-to.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/bootsnav.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/Forgot1js.js"></script>
