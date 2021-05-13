<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Storage.Data" %>
    <%@page import="server.Mail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String aid=request.getParameter("fid");
	String uid=request.getParameter("uid");
	String pid=request.getParameter("pid");
	//System.out.println(aid);
	String update,insert,select,txt,name="";
	if(session.getAttribute("doctor") != null)
		name=session.getAttribute("doctor").toString();
	Data dt=new Data();
	dt.st=dt.cn.createStatement();
	if(id.equals("0"))
	{
		update="update docappointment_tbl set eStatus='I' where iAppointId="+aid;
		dt.st.executeUpdate(update);
		System.out.println("Rejected");
		insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
		insert+="values('user',"+uid+","+aid+",'docappointment_tbl','Sorry,Your Doctor Appointment is Rejected','"+java.time.LocalDate.now().toString()+"')"; 
		dt.st.executeUpdate(insert);
		select="select vEmail from signup_tbl where iSignupId ="+uid;
		dt.rs=dt.st.executeQuery(select);
		txt="We are sorry inform you that your doctor appointment with <b>patient id "+pid;
		txt+="</b>of <b>Dr."+name+"</b> is rejected due to some emergy or inconvinience. <br><br> We are regret to inform about it.";
		txt+="<br>We hope you will get more facilities from our side.Explore our website for more facilities.<br><br>";
		txt+="<b>Thank you.</b>";
		while(dt.rs.next())
		{
			Mail m=new Mail(dt.rs.getString("vEmail"),"Sorry ,Your Doctor Appointment is Rejected",txt);
		}
	}
	else if(id.equals("1"))
	{
		update="update docappointment_tbl set eStatus='A' where iAppointId="+aid;
		dt.st.executeUpdate(update);
		insert="insert into notification_tbl(vNotificationTo,iId,iFacilityId,vFacilityTable,vNotificationDetails,dNotificationDate) ";
		insert+="values('user',"+uid+","+aid+",'docappointment_tbl','Your Doctor Appointment is Accepted','"+java.time.LocalDate.now().toString()+"')"; 
		dt.st.executeUpdate(insert);
		select="select vEmail from signup_tbl where iSignupId ="+uid;
		dt.rs=dt.st.executeQuery(select);
		txt="We are here to inform you that your doctor appointment with <b>patient id "+pid;
		txt+="</b>of <b>Dr."+name+"</b> is accepted. <br>Please be on time (for clinic visit).";
		txt+="<br>We hope you will get more facilities from our side. Explore our website for more facilities.<br><br>";
		txt+="<b>Thank you.</b>";
		while(dt.rs.next())
		{
			Mail m=new Mail(dt.rs.getString("vEmail"),"Your Doctor Appointment is Accepted",txt);
		}
	}
	response.sendRedirect("Notification.jsp");
%>
</body>
</html>