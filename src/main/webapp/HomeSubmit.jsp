<%@page import="Storage.Data" %>
<%@page import="server.Mail" %>
<%
    
	    String fnm="",lnm="",docadd="",phno="",age="",time="",gender="",email="",diseases="",docid,date,com,add="";
		String id="",sub,txt;
		String dname,demail="";
		String uemail="",uid="",fees="";
		
		if(session.getAttribute("email") != null)
		{
			uemail=session.getAttribute("email").toString(); 
			uid=session.getAttribute("uid").toString();
		}
		id=request.getParameter("pid").trim();
		time=request.getParameter("time").trim();
		diseases=request.getParameter("diseases").trim();
		docid=request.getParameter("docid").trim();
		date=request.getParameter("date").trim();
		fees=request.getParameter("fees").trim();
		com=request.getParameter("comments").trim();
		add=request.getParameter("address").trim();
		try
		{
		    Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String insert;
			String select="select * from patient_tbl where iPatientId="+id;
			dt.rs=dt.st.executeQuery(select);
			while(dt.rs.next())
			{
				fnm=dt.rs.getString("vFname");
				lnm=dt.rs.getString("vLname");
				gender=dt.rs.getString("vGender");
				email=dt.rs.getString("vEmail");
				age=dt.rs.getString("iAge");
				phno=dt.rs.getString("vPhoneNo");
			}
			
			String update="update patient_tbl set vAddress='"+add+"' where iPatientId="+id;
			dt.st.executeUpdate(update);
			
			insert="insert into docappointment_tbl(dAppointDate,tAppointTime,vAppointType,iDoctorId,iPatientId,iSignupId,vDisease,iPayment) values('" + date + "','" + time + "','Home'," + docid + "," + id + "," + uid + ",'" + diseases + "',"+ fees+")"; 
			//insert ="insert into docappointment_tbl (dAppointDate,tAppointTime,vAppointType,iDoctorId,iPatientId,iSignupId) values('" + date + "','"+time+"','Home'," + docid + "," + id + "," + uid + ")";
			dt.st.executeUpdate(insert);
			
			String aid="";
			select="select * from docappointment_tbl";
			dt.rs=dt.st.executeQuery(select);
			while(dt.rs.next())
			{
				aid=dt.rs.getString("iAppointId");
			}
			
			insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
			insert+="values('user',"+uid+","+aid+",'docappointment_tbl','Thanks for Booking Doctor Appointment','"+java.time.LocalDate.now().toString()+"')"; 
			dt.st.executeUpdate(insert);
			
			insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
			insert+="values('doctor',"+docid+","+aid+",'docappointment_tbl','Booked Appointment','"+java.time.LocalDate.now().toString()+"')"; 
			
			dt.st.executeUpdate(insert);
			
	
			select="select * from doctorinfo_tbl where iDoctorId="+docid;
			dt.rs=dt.st.executeQuery(select);
			dname="";
			while(dt.rs.next())
			{
				dname=dt.rs.getString("vFirstName");
				dname += " "+dt.rs.getString("vLastName");
				demail = dt.rs.getString("vEmail");
			}
			
			sub="Book Appointment";
			txt="<h3>Thank you for Booking Appointment.</h3><br>";
			txt += "<center><br><h2>Patient Details</h2>";
			txt += "<font color=black size=3>";
			txt += "<h2>Your Patient-Id :: p-"+id+"</h2><font color=red size=2>You can use it for further Refrence</font><br><br>";
			txt += "<table border=1 cellpadding=10 cellspacing=0><tr>";
			txt += "<td>Name </td><td>"+fnm + " "+lnm;	
			txt += "</td></tr><tr><td>Phone </td><td>"+phno;
			txt += "</td></tr><tr><td>Time </td><td>"+time;
			txt += "</td></tr><tr><td>Date </td><td>"+date;
			txt += "</td></tr><tr><td>Doctor name </td><td>"+dname;
			txt += "</td></tr><tr><td>Disease  </td><td>"+diseases;
			txt += "</td></tr></table></font></center>"; 
			txt += "<br><font color=red size=2>*By any chance in any emergency doctor may cancle your appointment.";
			txt += "For any emergency we will let you know.</font>";
			
			Mail m=new Mail(uemail,sub,txt);
			m=new Mail(email,sub,txt);
			
			txt="<h3>A patient booked Appoinment for you\n\n</h3>";
			txt += "<center><br><h2>Patient Details</h2>";
			txt += "<font color=black size=3>";
			txt += "<table border=1 cellpadding=10 cellspacing=0><tr>";
			txt += "<td>Name </td><td>"+fnm + " "+lnm;	
			txt += "</td></tr><tr><td>Phone </td><td>"+phno;
			txt += "</td></tr><tr><td>Email </td><td>"+email;
			txt += "</td></tr><tr><td>Gender </td><td>"+gender;
			txt += "</td></tr><tr><td>Age </td><td>"+age;
			txt += "</td></tr><tr><td>Date </td><td>"+date;
			txt += "</td></tr><tr><td>Time </td><td>"+time;
			txt += "</td></tr><tr><td>type </td><td>Home Visit";
			txt += "</td></tr><tr><td>Address </td><td>"+add;
			txt += "</td></tr><tr><td>Disease  </td><td>"+diseases;
			txt += "</td></tr><tr><td>About Problem </td><td>"+com;
			txt += "</td></tr></table></font></center>";
			
			m=new Mail(demail,sub,txt);
			
			response.sendRedirect("index.jsp");
			
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
    %>