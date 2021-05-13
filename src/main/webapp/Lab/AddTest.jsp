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
<title>Add Test</title>

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
	<%
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
	%>

	<jsp:include page="headerlab.jsp"></jsp:include>

	<div class="banner-area responsive-auto-height text-small" style="height:600px;">
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/29.jpg);">
			<div class="box-table">
				<div class="box-cell">
					<div class="container">
						<div class="row">
							<div class="content double-items">

								<div class="col-md-7 col-sm-6">
									
								</div>

								<!-- Start Appoinment Form -->

								<div class="col-md-5 col-sm-6 appoinment">
									<div class="appoinment-box">
										<div class="heading">
											<h2>ADD TEST</h2>
											<h5 style="color: red">
												<br>* Required
											</h5>
										</div>


										<form action="TestSubmit.jsp" method="post" name="testform">
										
											<div class="row">
											<div class="col-md-12">
				                                    <div class="form-group">
				                                        <select id="MainTest" name="MainTest">
				                                        	<option value="0">Main Test *</option>
				                                            <%
				                                            	Data dt=new Data();
				                                            	dt.st=dt.cn.createStatement();
				                                            	String select;
				                                            	select="select * from maintest_tbl";
				                                            	dt.rs=dt.st.executeQuery(select);
				                                            	while(dt.rs.next())
				                                            	{
				                                            		out.println("<option value=\""+dt.rs.getString(1)+"\"> ");
				                                            		out.println(dt.rs.getString(2)+"</option>");
				                                            	}
				                                            %>
				                                        </select>
				                                        <span style="color:red" id="errorMaintest"></span>
				                                    </div>
				              
				                                </div>
											
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="Name" name="Name"
															placeholder="Test Name *" type="text"> <span
															id="errorname" style="color: red"></span>
													</div>
												</div>

												
				                                
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="Price" name="Price"
															placeholder="Price *" type="text"> <span
															id="errorprice" style="color: red"></span>
													</div>
												</div>
												<%
													String phids="";
													select="select * from phlebotomist_tbl";
	                                            	dt.rs=dt.st.executeQuery(select);
	                                            	while(dt.rs.next())
	                                            	{
	                                            		phids += dt.rs.getString("iPhleboId") + "/";
	                                            	}
												%>
												<input type="hidden" id="phids" name="phids" value ="<%out.println(phids);%>">
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" id="PhId" name="PhId"
															placeholder="Enter Phlebotomist Id *" type="text">
													</div>
													<span id="errorphid" style="color: red"></span>
												</div>

												<div class="col-md-12">
													<button type="submit" name="submitTest" id="submitTest">
														Submit <i class="fa fa-paper-plane"></i>
													</button>
												</div>
											</div>

										</form>
									</div>
								</div>
								<!-- End Form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   <script src="assets/js/Testjs.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>