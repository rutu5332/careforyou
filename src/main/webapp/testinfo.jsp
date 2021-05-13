<%@page import="Storage.Data"%>
<!DOCTYPE html>
<html lang="en">

<!-- ========== Page Title ========== -->
<title>Test Information</title>

 <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet"> 

</head>

<body>

	<!-- Preloader Start -->
	<!-- <div class="se-pre-con"></div> -->
	<!-- Preloader Ends -->

	<jsp:include page="header.jsp"></jsp:include>

	<!-- Start Breadcrumb 
    ============================================= -->
	<div class="breadcrumb-area shadow dark bg-fixed text-light"
		style="background-image: url(assets/img/banner/lab7.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Test Details</h1>
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
		int id_test = Integer.parseInt(id);
		dt.st = dt.cn.createStatement();
		String sql = "select * from maintest_tbl where iMainTestId=" + id_test + " ";
		String ti = "select * from test_tbl where iMainTestId=" + id_test + " ";
		//String time="Select * from labhour_tbl";
		dt.rs = dt.st.executeQuery(sql);

		String mid="",mtnm="",tnm="",price="",icon="",tid="";
		String days="",flnm="";
		String mon = "9:00 am - 8:00 pm", tue = "9:00 am - 8:00 pm", wed = "9:00 am - 8:00 pm ", thur = "9:00 am - 8:00 pm", fri = "9:00 am - 8:00 pm", sat = "9:00 am - 8:00 pm",sun="Closed";
		while (dt.rs.next()) {
			mid=dt.rs.getString("iMainTestId");
			mtnm = dt.rs.getString("vMainTestName");
			icon=dt.rs.getString("vMainTestIcon");
			flnm=dt.rs.getString("vFileName");

		}
		dt.rs = dt.st.executeQuery(ti);
		//dt.rs=dt.st.executeQuery(time);
		
		days="00/09-20/09-20/09-20/09-20/09-20/09-20/00";
	%>
	
	<div class="solid-services-area default-padding bottom-less bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <%out.println("<h2><span>" + mtnm +"</span></h2>");%>
                        <!--  <p>
                            While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old
                        </p>-->
                    </div>
                </div>.
                
            </div>
            <div class="row">
                <div class="services-items">
                    <!-- Single Item -->
					<%
						int i=1;
						while (dt.rs.next()) {

							tid = dt.rs.getString("iTestId");
							tnm = dt.rs.getString("vTestName");
							price = dt.rs.getString("fTestPrice");
							out.println("<div class=\"col-md-4 col-sm-6 equal-height\">");
							out.println("<div class=\"item\"\">");
							out.println("<ul>");

							//String tnm=dt.rs.getString("vTestName");
							out.println("<b><h3 align=\"center\"style= \"font-size: 27px;\">" + tnm + "</h3></b> <br>");
							out.println("<b><h5><li style= \"font-size: 17px;\">Test Price : " + price + "</li></h5></b><br>");
							out.println("<form method=\"post\" action=\"LabAppointmentForm.jsp\">");
							out.println("<input type=\"hidden\" name=\"tid\" value=\""+tid+"\">");
							out.println("<input type=\"hidden\" name=\"i\" value=\""+i+"\">");
							out.println("<div class=\"row\">");
							out.println("<div class=\"col-md-10\">");
							out.println("<div class=\"form-group\">");
							out.println("<select  id=\"date"+i+"\" name=\"date\">");
							out.println("<option value=\"dt\">  Date*  </option>");
							out.println("<option value=\"today\">Today</option>");
							out.println("<option value=\"tomorrow\">Tomorrow</option>");
							out.println("<option value=\"next2\">"+java.time.LocalDate.now().plusDays(2)+"</option>");
							out.println("<option value=\"next3\">"+java.time.LocalDate.now().plusDays(3)+"</option>");
							out.println("<option value=\"next4\">"+java.time.LocalDate.now().plusDays(4)+"</option>");
							out.println("</select> <span style=\"color: red\" id=\"dtErr"+i+"\"></span>");
							out.println("</div>");
							out.println("</div>");
							out.println("</div>");
							
							out.println("<br><input type=\"hidden\" name=\"days\" value=\""+days+"\">");
							out.println(
									"<button class=\"btn btn-theme border btn-md\" type=\"Submit\" name=\"testsub\" id=\"testsub"+i+"\">Book Now</button><br>");
							out.println("</form>");
							out.println("</ul>");
							out.println("</div>");
							out.println("</div>");
							i++;
						}
					%>
					<!-- End Single Item -->
              
                    
                  <script src="assets/js/Labappointmentjs.js"></script>
           
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <%out.println("<h2>Schedule of Lab <span> Working Hours </span></h2>");%>
                        <!--  <p>
                            While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old
                        </p>-->
                    
					<div class="tab-content tab-content-info">
						<div id="tab1" class="tab-pane fade active in">
							<div class="info title">
								<h3>Schedule of working hours</h3>
								<ul>
									<li><span> Monday : </span>
										<div class="pull-right"> <%out.println(mon); %></div></li>
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
								</ul>
							</div>
						</div>
					</div>
					<br>
					<br>
					<div class="site-heading text-center">
                        <%out.println("<h2> Sunday :  <span> "+sun+" </span></h2>");%>
                    </div>
        		</div>
    	</div>
    </div>
   </div>
   </div>
    <!-- End Services -->
			
	
	
	
	

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script src="assets/js/Labappointmentjs.js"></script>
</html>