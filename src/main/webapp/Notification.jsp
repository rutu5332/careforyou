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
    <title>Notification</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
	 <%
		if(session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
	%> 

<%
	Data dt=new Data();
	dt.st=dt.cn.createStatement();
	String uid="15";
	if(session.getAttribute("uid") != null)
		uid=session.getAttribute("uid").toString();	
	String select="select * from notification_tbl where vNotificationTo like 'user' && iId="+uid +" order by iNotificationId desc" ;
	dt.rs=dt.st.executeQuery(select);
%>

	<div class="features-area default-padding bg-gray">
		<div class="container">
			<div class="appoinment">
				<div class="cart-box">
					<div class="heading">
						<h2>Notifications</h2>
					</div>
					<div class="row">
						
						<%
							while(dt.rs.next())
							{
								if(dt.rs.getString("eStatus").equals("A"))
								{
									out.println("<a href=\"NotificationDetails.jsp?id="+dt.rs.getString("iNotificationId")+"\">");
								}
								else
								{
									out.println("<a href=\"NotificationDetails.jsp?id="+dt.rs.getString("iNotificationId")+"\" style=\"color:grey;\">");
								}
								out.println("<div class=\"col-md-11 check-box left-margin\">");
								out.println(dt.rs.getString("vNotificationDetails") + "<div class=\"pull-right\">");
								out.println(dt.rs.getString("dNotificationDate")+"</div></div></a>");
							}
						%>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>

<jsp:include page="footer.jsp"></jsp:include>
    
</html>