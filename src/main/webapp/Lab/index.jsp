<%@page import="Storage.Data" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Pathology Lab</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

 
 </head>

<body>
 	<%
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
    		
	%>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
    <%-- 
    <%
		if(session.getAttribute("labid") == null)
			response.sendRedirect("../LoginLab.jsp");
    		
	%> --%>
    
    <jsp:include page="headerlab.jsp"></jsp:include>

   
    <!-- Start Banner 
    ============================================= -->
    <div class="banner-area text-dark">
        <div id="bootcarousel" class="carousel slide animate_text" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner heading-uppercase text-dark">
                <div class="item active bg-cover" style="background-image: url(assets/img/banner/lab5.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInLeft">Best Test At Affordable Price </h1>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/lab7.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="content">
                                            <h1 data-animation="animated slideInDown">Specialits are well Equipped</h1>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/banner/lab6.jpg);">
                    <div class="box-table">
                        <div class="box-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-4 text-right">
                                        <div class="content">
                                            <h1 data-animation="animated slideInRight">Fully Automated and Some of the Specialities are Integrated</h1>
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Wrapper for slides -->

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#bootcarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#bootcarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!-- End Banner -->
    
    <!-- Start 
    ============================================= -->
    <div class="doctor-area bg-gray carousel-shadow default-padding">
        <div class="container">
        	<div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="site-heading text-center">
                        <h2>Reports <span>To be Send</span></h2>
                         <p>Here are some patient whose reports are yet to be send.</p>
                    </div>
                   
                </div>
            </div>
            <%
            	String select;
            	Data dt=new Data();
            	dt.st=dt.cn.createStatement();
            	select="select * from testappointment_tbl t inner join patient_tbl p on t.iPatientId = p.iPatientId ";
            	select += "where vReports like 'none' ";
            	dt.rs=dt.st.executeQuery(select);
            %>
            <div class="row lab-box">
            	<div class="lab">
         	
           	<%
            		
            while(dt.rs.next())
            {
            	out.println("<form action=\"../UploadReport\" method=\"post\" enctype=\"multipart/form-data\">");
            	out.println("<table>");
            	out.println("<tr><td style=\"width:15%;\">"+dt.rs.getString("vFname")+" "+dt.rs.getString("vLname")+"</td>");
            	out.println("<td>"+dt.rs.getString("dAppointDate")+"</td>");
            	out.println("<td>"+dt.rs.getString("tAppointTime")+"</td>");
            	out.println("<td id=\"status\"><input type=\"file\" id=\"report\" name=\"report\" style=\"width:100%;\">");
            	out.println("<input type=\"hidden\" id=\"tid\" name=\"tid\" value=\""+dt.rs.getString("iTappointId")+"\">");
            	out.println("<input type=\"hidden\" id=\"uid\" name=\"uid\" value=\""+dt.rs.getString("iSignupId")+"\">");
            	out.println("<input type=\"hidden\" id=\"email\" name=\"email\" value=\""+dt.rs.getString("vEmail")+"\"></td>");
            	out.println("<td id=\"buton\"><button type=\"submit\" id=\"Upload\" class=\"btn btn-theme border btn-md\">");
            	out.println("Send</button></td></tr></table></form>");
            			//out.println("</tr>");
            }
            %>
            		
            	</div>
            </div>
        </div>
        
    </div>
    
    <!-- End  -->
    
    <!-- <script type="text/javascript">
    	function up(value) {
    		//alert(this.parentElement);
    		/*alert(this.tagName);
    		var id="status"+value;
    		alert('status'+value);
    		alert(id);
    		document.getElementById(id).innerHTML="Sending..."; */
    		//document.getElementById('buton'+value).innerHTML="Sending....."; 
    		//return true;
    		//alert("dadfa");
    		var id="status"+value;
    		var txt=document.getElementById(id).innerHTML;
    		alert(txt);
    		document.getElementById(id).innerHTML += "Sending....."; 
    		//document.getElementById('buton').innerHTML="Sending....."; 
		} 	
    </script>  -->
    
    <div class="doctor-area bg-gray carousel-shadow default-padding">
       <div class="site-heading text-center lab-box">
                <h2>Do you want to add Test? <a href="AddTest.jsp">ADD</a></h2>
         </div>
     </div>
   
    
   <jsp:include page="footer.jsp"></jsp:include>

  <script src="assets/js/Upload.js"></script> 

</body>

</html>