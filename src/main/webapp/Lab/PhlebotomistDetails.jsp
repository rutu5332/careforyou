<%@page import="Storage.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phlebotomist Details</title>
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
		
		String id="";
		Data dt=new Data();
		dt.st=dt.cn.createStatement();
		id=request.getParameter("id");
		//System.out.println(pid);
		lid="9";
	%>
	<div class="banner-area responsive-auto-height text-small" style="overflow:auto;height:auto;"> 
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/lab7.jpg);">
			<div class="box-table" >
				<div class="box-cell" >
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:5px 0px 20px 0px;">
									<div class="info">
										<div class="heading">
											<h2>Phlebotomist Details </h2>
										</div>
										<%
											String slct = "select * from phlebotomist_tbl where iPhleboId=" + id;
											dt.rs = dt.st.executeQuery(slct);
											String  gen="";
											while (dt.rs.next()) {
												out.println("<h4>Name : " + dt.rs.getString("vPhleboName")+ "</h4>");
												//out.println("<h4>Email : " + dt.rs.getString("vEmail") + "</h4>");
												if(dt.rs.getString("vPhleboGender").equalsIgnoreCase("m"))
													gen="Male";
												else if(dt.rs.getString("vPhleboGender").equalsIgnoreCase("f"))
													gen="female";
												else
													gen="other";
												out.println("<h4>Gender : " + gen + "</h4>");
												out.println("<h4>Phone no : " + dt.rs.getString("vPhleboPhno") + "</h4>");
												out.println("<h4>Degree : " + dt.rs.getString("vPhleboDegree") + "</h4>");
												out.println("<h4>Experience : " + dt.rs.getString("dPhleboExperience") + "</h4>");
											}	
										%>
										<div class="appoinment-box" style="margin-bottom:10px;">
											<div class="info">
											<div class="heading"><h2>Related Tests</h2></div>
											<%
												slct="select * from test_tbl where iPhleboId="+id;
												dt.rs = dt.st.executeQuery(slct);
												while (dt.rs.next()) {
													out.println("<h4> &nbsp -" + dt.rs.getString("vTestName")+ "</h4>");
													
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
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>