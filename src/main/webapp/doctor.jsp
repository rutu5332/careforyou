<%@page import="Storage.Data" %>
<%
		Data dt=new Data();	
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Doctors</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
    
    </head>

<body>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->

	<jsp:include page="header.jsp"></jsp:include>
	
	<%
		String did=request.getParameter("id");
		String depname[]={"","Primary Care","cardiologist","dermatologist","pediatrician","neurologist",
				"psychiatrist","gynecologist","urologist","radiologist","orthopedist","immunologist","dentist"};
		String url="assets/img/departments/banner"+did+".jpg";
	%>
	
 
    <!-- Start Breadcrumb 
    ============================================= -->
      <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(<%out.println(url);%>);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1><%out.println(depname[Integer.parseInt(did)]); %></h1>
                </div>
     
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->

    <!-- Start Doctors 
    ============================================= -->
    <div class="doctor-area bg-gray default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="doctor-items text-center">      
                  <%
                    dt.st=dt.cn.createStatement();
         			String sql_menu = "select * from doctorinfo_tbl where vDegree="+did;// + "&& eStatus like 'A'";
         		 	dt.rs=dt.st.executeQuery(sql_menu);
         		 	String flnm,fnm,lnm,id,degree;
         		 	while(dt.rs.next())
                	{
         		 		flnm=dt.rs.getString("vFileName");
         		 		fnm=dt.rs.getString("vFirstName");
         		 		id=dt.rs.getString("iDoctorId");
                		lnm=dt.rs.getString("vLastName");
                		degree = dt.rs.getString("vDegree");
                		String link="doctor-info.jsp?id="+ id ;
                		out.println("<a href=\""+ link +"\">");
                		out.println("<div class=\"col-md-4 col-sm-6 equal-height\">");      
                		out.println(" <div class=\"item\">");
                		out.println(" <div class=\"thumb\">");
                		out.println("<img style=\"height:300px; width:300px;\"src=\"assets/img/doctors/"+flnm +"\" alt=\"Thumb\">");
                		out.println("</div>");
                		out.println("<div class=\"info\">");
                		out.println("<h4> Dr. "+" "+fnm+" "+lnm+"</h4>");
                		//out.println("<form action=\"doctor-info.jsp\"> <input type=\"hidden\" name=\"email\" value=\""+email +"\"> </form>");
                		//System.out.println("<form> <input type=\"hidden\" name=\"email\" value=\""+email +"\"> </form>");
                		//out.println("<h5>"+degree+"</h5>");
                		out.println(" <div class=\"appoinment-btn\">");
                		out.println(" Make appoinment");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</div>");
                		out.println("</a>");
                	}
                    %>
                    
                    </div>
            </div>
        </div>
    </div> 
                                   
    <!-- End Doctors -->

  <jsp:include page="footer.jsp"></jsp:include>

   
</body>

</html>