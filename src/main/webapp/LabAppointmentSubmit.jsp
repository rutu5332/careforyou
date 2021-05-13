<%@page import="Storage.Data"%>
<%@page import="server.Mail"%>
<%
	String fnm = "", lnm = "", add = "", phno = "", age = "", time = "", gender = "", email = "", dat = "",
			id = "",labid="1";
	String uemail = "", uid = "";
	String tid = "", sub, txt, tnm = "", tprice = "";
	String lemail = "rutuchudasama.2000@gmail.com";

	if (session.getAttribute("email") != null) {
		uemail = session.getAttribute("email").toString();
		uid = session.getAttribute("uid").toString();
	}
	tid = request.getParameter("testid");
	dat = request.getParameter("date");
	fnm = request.getParameter("fname");
	lnm = request.getParameter("lname");
	add = request.getParameter("address");
	phno = request.getParameter("phone");
	age = request.getParameter("age");
	time = request.getParameter("time");
	gender = request.getParameter("gender");
	email = request.getParameter("email");
	//diseases=request.getParameter("diseases");
	try {
		Data dt = new Data();
		dt.st = dt.cn.createStatement();
		String insert = "insert into patient_tbl(vFname,vLname,vAddress,vPhoneNo,iAge,vGender,vEmail) values('"
				+ fnm + "','" + lnm + "','" + add + "'," + phno + "," + age + ",'" + gender + "','" + email
				+ "')";
		dt.st.executeUpdate(insert);

		String select = "select * from patient_tbl";
		dt.rs = dt.st.executeQuery(select);
		while (dt.rs.next()) {
			id = dt.rs.getString("iPatientId");
		}

		select = "select * from test_tbl where iTestId=" + tid;
		dt.rs = dt.st.executeQuery(select);
		while (dt.rs.next()) {
			tnm = dt.rs.getString("vTestName");
			tprice = dt.rs.getString("fTestPrice");
		}

		insert = "insert into testappointment_tbl(dAppointDate,tAppointTime,iTestId,iPatientId,iSignupId,iPayment) values('"
				+ dat + "','" + time + "', " + tid + "," + id + "," + uid + "," + tprice + ") ";
		dt.st.executeUpdate(insert);
		
		String aid="";
		select="select * from testappointment_tbl";
		dt.rs=dt.st.executeQuery(select);
		while(dt.rs.next())
		{
			aid=dt.rs.getString("iTappointId");
		}
		
		insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
		insert+="values('user',"+uid+","+aid+",'testappointment_tbl','Thanks for Booking Lab Appointment','"+java.time.LocalDate.now().toString()+"')"; 
		dt.st.executeUpdate(insert);
		
		insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
		insert+="values('lab',"+labid+","+aid+",'testappointment_tbl','Booked Appointment','"+java.time.LocalDate.now().toString()+"')"; 
		
		dt.st.executeUpdate(insert);

		sub = "Book Appointment";
		txt = "<h3>Thank you for Booking Appointment For test.</h3><br>";
		txt += "<center><br><h2>Patient Details</h2>";
		txt += "<font color=black size=3>";
		txt += "<h2>Your Patient-Id :: p-" + id
				+ "</h2><font color=red size=2>You can use it for further Refrence</font><br><br>";
		txt += "<table border=1 cellpadding=10 cellspacing=0><tr>";
		txt += "<td>Name </td><td>" + fnm + " " + lnm;
		txt += "</td></tr><tr><td>Phone </td><td>" + phno;
		txt += "</td></tr><tr><td>Date </td><td>" + dat;
		txt += "</td></tr><tr><td>Time </td><td>" + time;
		txt += "</td></tr><tr><td>Test name </td><td>" + tnm;
		txt += "</td></tr><tr><td>Price </td><td>Rs." + tprice;
		txt += "</td></tr></table></font></center>";

		Mail m = new Mail(uemail, sub, txt);
		if (!uemail.equals(email))
			m = new Mail(email, sub, txt);

		txt = "A patient booked Appoinment of you\n\n";
		txt += "<center><br><h2>Patient Details</h2>";
		txt += "<font color=black size=2>";
		txt += "<table border=1 cellpadding=10 cellspacing=0><tr>";
		txt += "<td>Name </td><td>" + fnm + " " + lnm;
		txt += "</td></tr><tr><td>Phone </td><td>" + phno;
		txt += "</td></tr><tr><td>Email </td><td>" + email;
		txt += "</td></tr><tr><td>Gender </td><td>" + gender;
		txt += "</td></tr><tr><td>Age </td><td>" + age;
		txt += "</td></tr><tr><td>Date </td><td>" + dat;
		txt += "</td></tr><tr><td>Time </td><td>" + time;
		txt += "</td></tr><tr><td>Test name </td><td>" + tnm;
		txt += "</td></tr></table></font></center>";

		m = new Mail(lemail, sub, txt);

		response.sendRedirect("index.jsp");
	} 
	catch (Exception e) {
		out.println(e.toString());
	}
%>