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
    <title>Details</title>
    
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
		String apid=request.getParameter("aid");
		//System.out.println("Appoint id :: "+apid);
		String tpid=request.getParameter("tid");
		//System.out.println("Test Appoint id :: "+tpid);
		String oid=request.getParameter("oid");
		String pid="",did="",date="",time="",type="",dis="",fees="",tid="",mid="",tnm="",reports="";
		Data dt=new Data();
		String select;
		dt.st=dt.cn.createStatement();
	%>
	<div class="banner-area responsive-auto-height text-small" style="overflow:auto;height: auto;">
		<div class="item shadow dark text-light bg-fixed"
			style="background-image: url(assets/img/banner/5.jpg);">
			<div class="box-table">
				<div class="box-cell">
					<div class="container">
						<div class="row">
							<div class="content double-items">
								<div class="col-md-8 appoinment appoinment-box" style="margin:5px 0px 20px 0px;">
									<div class="info">
										<%
											if(apid != null)
											{
												out.println("<div class=\"heading\">");
												out.println("<h2>Doctor Appointment Details </h2></div>");
												select="select * from docappointment_tbl where iAppointId="+apid;
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
											if(tpid != null)
											{
												out.println("<div class=\"heading\">");
												out.println("<h2>Lab Appointment Details </h2></div>");
												select="select * from testappointment_tbl where iTappointId="+tpid;
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
												if(! reports.equalsIgnoreCase("none"))
												{
													out.println("<h4>Report : <u><a style=\"color:blue;\" ");
													out.println("href=\"assets/img/reports/"+reports+"\">OPEN");
													out.println("</a></u></h4>");
												}
												else
												{
													out.println("<h4>Report : Yet to come </h4>");
												}
											}
											if(oid != null)
											{
												String prd2="",qty2="",pay="",name="",price="",brand="",img="";
												out.println("<div class=\"heading\">");
												out.println("<h2>Order Details </h2></div>");
												select="select * from order_tbl where iOrderId="+oid;
												dt.rs=dt.st.executeQuery(select);
												while(dt.rs.next())
												{
													prd2=dt.rs.getString("iProductId");
													qty2=dt.rs.getString("iQuantity");
													pay=dt.rs.getString("dPayment");
												}
												String prids[]=prd2.split("/");
												String qids[]=qty2.split("/");
												for(int k=0;k<prids.length;k++)
												{
													select="select * from product_tbl where iProductId="+prids[k];
													dt.rs=dt.st.executeQuery(select);
													//System.out.println(prids[k]);
													while(dt.rs.next())
													{
														name=dt.rs.getString("vProductName");
								         		 		price=dt.rs.getString("dSellPrice");
								         		 		brand=dt.rs.getString("vProductBrand");
								         		 		img=dt.rs.getString("vProductImage");
														out.println("<div class=\"appoinment-box\" style=\"margin-bottom:10px;\">");
														out.println("<div class=\"row\" > <div class=\"col-md-4\" style=\"background:white;\"><a href=\"Product.jsp?id="+prids[k]+"\"> ");
														out.println("<center> <img src=\"assets/img/products/"+img+"\" alt=\"Thumb\" style=\"height:150px;\"></a> ");
														out.println("</center></div><div class=\"col-md-6\"><h2>"+name+"</h2><h4>by : "+brand+"</h4>");
														out.println("<h4>Rs."+price+"</h4></div><div class=\"col-md-2\"><h4>X"+qids[k]+"</h4>");
														double sub = Math.round(Double.parseDouble(price) * 100.00 * Double.parseDouble(qids[k]) ) / 100.00;
														out.println("<label style=\"font-size:20px;\">Sub Total:</label><h4>"+sub+"</h4></div></div></div>");
													}
												}
												out.println("<h2 class=\"pull-right\">Total : "+pay+"</h2>");
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