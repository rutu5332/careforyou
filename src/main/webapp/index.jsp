<%@page import="Storage.Data"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- ========== Meta Tags ========== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Care for you">

<!-- ========== Page Title ========== -->
<title>Care For You</title>

<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets\img\favicon.png"
	type="image/x-icon">

<!-- ========== Google Fonts ========== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800"
	rel="stylesheet">

</head>

<body>

	<!-- Preloader Start -->
	<div class="se-pre-con"></div>
	<!-- Preloader Ends -->

	<jsp:include page="header.jsp"></jsp:include>



	<!-- Start Banner 
    ============================================= -->
	<div class="banner-area heading-exchange text-dark">
		<div id="bootcarousel"
			class="carousel inc-top-heading slide carousel-fade animate_text"
			data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner carousel-zoom">
				<div class="item active">
					<div class="slider-thumb bg-cover"
						style="background-image: url(assets/img/banner/1.jpg);"></div>
					<div class="box-table">
						<div class="box-cell">
							<div class="container">
								<div class="row">
									<div class="col-md-8">
										<div class="content">
											<h1 data-animation="animated fadeInUp">
												Best <span>Specialist</span>
											</h1>
											<h2 data-animation="animated fadeInDown">Consult experienced doctors
												</h2>
											<p data-animation="animated slideInUp">
												<!-- The ourselves suffering the sincerity. Inhabit her manners adapted age certain.<br> Debating offended at branched striking be subjects. -->
											</p>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="slider-thumb bg-cover"
						style="background-image: url(assets/img/banner/lab7.jpg);"></div>
					<div class="box-table">
						<div class="box-cell">
							<div class="container">
								<div class="row">
									<div class="col-md-8">
										<div class="content">
											<h1 data-animation="animated fadeInUp">
												Best Technology
											</h1>
											<h2 data-animation="animated fadeInDown">Affordable
												tests by experienced phlebotomist</h2>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="slider-thumb bg-cover"
						style="background-image: url(assets/img/banner/31.jpg);"></div>
					<div class="box-table">
						<div class="box-cell">
							<div class="container">
								<div class="row">
									<div class="col-md-8">
										<div class="content">
											<h1 data-animation="animated fadeInUp">
												<span>Best</span> Care
											</h1>
											<h2 data-animation="animated fadeInDown">Wide range of medicine and 
											health products</h2>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Wrapper for slides -->

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#bootcarousel"
				data-slide="prev"> <i class="fa fa-angle-left"></i> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#bootcarousel"
				data-slide="next"> <i class="fa fa-angle-right"></i> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- End Banner -->

	<!-- Start About
    ============================================= -->
	<div class="about-area default-padding">
		<div class="container">
			<div class="row">
				<div class="about-items">
					<div class="col-md-6">
						<div class="site-heading text-center">
							<h2>
								Health <span>Tips</span>
							</h2>
						</div>
						<div
							class="health-tips-items tips-carousel owl-carousel owl-theme">
							<!-- Single Item -->

							<div class="info">

								<h3>How to live a healthy lifestyle?</h3>
								<p>Frequently partiality possession resolution at or
									appearance unaffected he me. Engaged its was evident pleased
									husband. Ye goodness felicity do disposal dwelling no. First am
									plate jokes to began of cause an scale. Subjects he prospect
									elegance followed no overcame possible it on.</p>
								<h4>Follow the instructions</h4>
								<ul>
									<li>Dont just worry about the things you cannot help.</li>
									<li>Eat Healthy, work better, do gardening.</li>
									<li>Some relationships can kill you. Avoid them at the
										most.</li>
									<li>Focus on the good things that you like</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Item -->


					<div class="col-md-6 tabs-items">
						<!-- Tab Nav -->
						<ul class="nav nav-pills">
							<li class="active"><a data-toggle="tab" href="#tab1"
								aria-expanded="true"> <i class="fa fa-stethoscope"></i>
									Doctors
							</a></li>
							<li><a data-toggle="tab" href="#tab2" aria-expanded="false">
									<i class="fas fa-flask"></i> Pathology lab
							</a></li>
							<li><a data-toggle="tab" href="#tab3" aria-expanded="false">
									<i class="flaticon-pharmacy"></i> Pharmacy
							</a></li>
						</ul>
						<!-- End Tab Nav -->
						<!-- Start Tab Content -->
						<div class="tab-content tab-content-info">
							<!-- Single Item -->
							<div id="tab1" class="tab-pane fade active in">
								<div class="info title">
									<h3>Consulted by experienced doctors</h3>
									<p>You can book doctors' Appointment. We have doctors in
										such type of fields. You can get the information of doctors
										and their details. You can also check their time slots that is
										available on their profile.</p>
									<p>Also home visit is available for some doctors.</p>
									<a class="btn btn-theme border btn-md" href="doctors.jsp">Make
										Appointment</a>
								</div>
							</div>
							<!-- End Single Item -->

							<!-- Single Item -->
							<div id="tab2" class="tab-pane fade">
								<div class="info title">
									<h3>Equiped Pathology Lab</h3>
									<p>The tests are available. Phlebotomist come at your home
										to take a sample. And a sample is very secured in lab so not
										to worry about a sample and any kind of mistake.And also your
										report will be send on your Email id. You can see your report
										and also your report history.</p>
									<a class="btn btn-theme border btn-md" href="Lab.jsp">Make
										Appointment</a>
									<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d14767.262289338461!2d70.79414485000001!3d22.284975!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1424308883981"></iframe> -->
								</div>
							</div>
							<!-- End Single Item -->

							<!-- Single Item -->
							<div id="tab3" class="tab-pane fade">
								<div class="info title">
									<h3>Top Medical Products</h3>
									<p>Here you can purchase top medical products. Also on some
										medical products, you can get discounts or discounts coupon
										with such kind of terms and conditions. You can purchase a
										product at a best price. Sometimes you will get a benefit of
										free shipping charge and free home delivery .</p>
									<a class="btn btn-theme border btn-md" href="Pharmacy.jsp">Purchase</a>
								</div>
							</div>
							<!-- End Single Item -->

						</div>
						<!-- End Tab Content -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End About -->

	<!-- Start Tips
    ============================================= -->
	<div
		class="services-area inc-icon bg-gray carousel-shadow default-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="site-heading text-center">
						<h2>
							Care <span>Tips</span>
						</h2>
						<p>Enjoy plenty of fruits and vegetables. Reduce salt and
							sugar intake. Eat regularly, control the portion size. Drink
							plenty of fluids. Maintain a healthy body weight.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div
						class="services-items text-center services-carousel owl-carousel owl-theme">
						<!-- Single Item -->
						<div class="item">
							<div class="info">
								<h4>
									<a href="#">Eye Care</a>
								</h4>
								<div class="overlay">
									<i class="flaticon-medical"></i>
								</div>
								<p>Eat a Balanced Diet. As part of your healthy diet, choose
									foods rich in antioxidants, like Vitamins A and C; foods like
									leafy, green vegetables. Exercise. Get a good night's sleep.
									Wash your hands. Don't Smoke. Wear Sunglasses. Devices and Blue
									Light.</p>
								<!--  <a class="btn btn-theme border circle btn-md" href="#">Read More</a>-->
							</div>
						</div>
						<!-- End Single Item -->
						<!-- Single Item -->
						<div class="item">
							<div class="info">
								<h4>
									<a href="#">Skin Care</a>
								</h4>
								<div class="overlay">
									<i class="flaticon-anesthesia"></i>
								</div>
								<p>Use the correct cleanser. Don't use too many products.
									Moisturize both day and night. Don't touch your face. Hydrate
									inside and out. Avoid direct heat exposure. Exfoliate a couple
									times per week. Vitamins should go on your skin, too.</p>
								<!-- <a class="btn btn-theme border circle btn-md" href="#">Read More</a> -->
							</div>
						</div>
						<!-- End Single Item -->
						<!-- Single Item -->
						<div class="item">
							<div class="info">
								<h4>
									<a href="#">Hair Care</a>
								</h4>
								<div class="overlay">
									<i class="flaticon-anatomy"></i>
								</div>
								<p>Wash Your Hair Regularly. Washing your hair regularly
									ensures that your scalp and hair is free of dirt and excess
									oil. Use Chemical Free shampoos. Condition Correctly. Dry Your
									Hair Naturally. Oil Your Hair properly. Use A Wide-toothed
									Comb. Trim Your Hair Regularly.</p>
								<!--  <a class="btn btn-theme border circle btn-md" href="#">Read More</a> -->
							</div>
						</div>
						<!-- End Single Item -->
						<!-- Single Item -->
						<div class="item">
							<div class="info">
								<h4>
									<a href="#">Body Care</a>
								</h4>
								<div class="overlay">
									<i class="flaticon-lung-cancer"></i>
								</div>
								<p>Limit bath time. Hot water and long showers or baths
									remove oils from your skin. Avoid strong soaps. Strong soaps
									and detergents can strip oil from your skin. Shave carefully.
									Pat dry. Moisturize dry skin. Eat a healthy diet. Manage
									Stress.</p>
								<!-- <a class="btn btn-theme border circle btn-md" href="#">Read More</a> -->
							</div>
						</div>
						<!-- End Single Item -->
						<!-- Single Item -->
						<div class="item">
							<div class="info">
								<h4>
									<a href="#">Health Care</a>
								</h4>
								<div class="overlay">
									<i class="flaticon-thinking"></i>
								</div>
								<p>Don't drink sugar calories. Eat nuts. Avoid processed
									junk food (eat real food instead) Don't fear coffee. Get enough
									sleep. Take care of your gut health with probiotics and fiber.
									Drink some water, especially before meals.</p>
								<!-- <a class="btn btn-theme border circle btn-md" href="#">Read More</a> -->
							</div>
						</div>
						<!-- End Single Item -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Tips -->


	<!-- Start Testimonials 
    ============================================= -->
	<div class="testimonials-area carousel-shadow bg-gray default-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="site-heading text-center">
						<h2>
							Patient <span>Testimonials</span>
						</h2>
						<p>Here are some experience of some patients.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div
						class="testimonial-items testimonial-carousel owl-carousel owl-theme">
						<%
                        	Data dt=new Data();
                        	int i=0;
                        	dt.st=dt.cn.createStatement();
                        	String select;
                        	//select="select * from testimonial_tbl order by iTestimonialId desc";
                        	select="select * from testimonial_tbl t inner join signup_tbl s on ";
                        	select +="t.iSignupId=s.iSignupId order by t.iTestimonialId desc";
                        	dt.rs=dt.st.executeQuery(select);
                        	while(dt.rs.next())
                        	{
                        		i++;
                        		out.println("<div class=\"item\"> <div class=\"content\">");
                        		out.println("<p>" + dt.rs.getString("vMessage") +"</p>");
                        		out.println("</div><div class=\"provider\">");
                        		out.println("<div class=\"thumb\"><img src=\"assets/img/user/");
                        		out.println(dt.rs.getString("vImage")+"\"  alt=\"Thumb\"></div>");//style=\"border:1px solid black;\"
                        		out.println("<div class=\"info\"> <h4 style=\"margin-bottom:10px;\">"+dt.rs.getString("vUserName") );
                        		out.println("</h4>"+dt.rs.getString("dStar")+" star</div></div></div>");
                        		 if(i==5)
                        		{
                        			break;
                        		} 
                        	}
                        %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Testimonials 
    ============================================= -->

	<!--Start Testimonial form -->
	<% 
   if(session.getAttribute("user") != null)
   {
	   %>
	<div class="testimonials-area carousel-shadow bg-gray default-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="site-heading text-center">
						<h2>
							Patient <span>Testimonial Form</span>
						</h2>
						<p>
							Please give us the information about your experience with our
							doctors and phlebotomist. <br>Also rate our app.
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 appoinment">
				<form action="TestimonialSubmit.jsp" method="post" name="testimonialForm" id="testimonialForm">
					<div class="row" id="testimonialApp">
						<div class="col-md-2"></div>
						<div class="col-md-5">
							<div class="form-group comments">
								<textarea class="form-control" id="experience" name="experience"
									placeholder="Tell us your Experience *" rows="3"></textarea>
								<span style="color: red" id="expErr"></span>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								Rate us *<br> <input type="number" id="rate" name="rate" value=0 min=0
									max=5 step="0.5"> 
							<span style="color: red" id="ratErr"></span>
							</div>
						</div>
						<div class="col-md-3">
							<button type="submit" name="TestimonialSub" id="TestimonialSub">
                                      Done<i class="fa fa-paper-plane"></i>
                             </button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="assets/js/Testimonialjs.js"></script>
	<%
  			 }
      %>
	<!--End Testimonial form -->


	<jsp:include page="footer.jsp"></jsp:include>

</body>


</html>