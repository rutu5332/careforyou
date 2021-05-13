<%@page import="Storage.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Details</title>
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
		String name="",price="",pid="",mid="";
		String slct = "select * from test_tbl where iTestId =" + id;
		dt.rs = dt.st.executeQuery(slct);
		while (dt.rs.next()) 
		{
			name=dt.rs.getString("vTestName");
			price=dt.rs.getString("fTestPrice");
			pid=dt.rs.getString("iPhleboId");
			mid=dt.rs.getString("iMainTestId");
		}
	%>
	<div class="banner-area responsive-auto-height text-small" style="overflow:auto;height:545px;"> 
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/28.jpg);">
			<div class="box-table" >
				<div class="box-cell" >
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:5px 0px 20px 0px;">
									<div class="info">
										<div class="heading">
											<h2>Test Details </h2>
										</div>
										<h4>Name : <% out.println(name); %></h4>
										<%
											slct="select * from maintest_tbl where iMainTestId="+mid;
											dt.rs = dt.st.executeQuery(slct);
											while (dt.rs.next()) {
												out.println("<h4>MainTest : " + dt.rs.getString("vMainTestName")+ "</h4>");
												
											}
										%>
										<h4>Price : <% out.println(price); %></h4>
										<%
											slct="select * from phlebotomist_tbl where iPhleboId="+pid;
											dt.rs = dt.st.executeQuery(slct);
											while (dt.rs.next()) {
												out.println("<h4>Related Phlebotomist : <a href=\"PhlebotomistDetails.jsp?id=" +pid +"\">" );
												out.println(dt.rs.getString("vPhleboName")+ "</a></h4>");
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