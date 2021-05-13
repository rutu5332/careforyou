<!DOCTYPE html>
<%@page import="Storage.Data"%>
<%@page import="java.util.function.Function"%>
<html lang="en">
<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="care for you">

    <!-- ========== Page Title ========== -->
    <title>Sign Up</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
<div class="se-pre-con"></div>
	
	<%
		if(session.getAttribute("user") != null)
			response.sendRedirect("index.jsp");
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="banner-area responsive-auto-height text-small">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/4.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-7 col-sm-6">
                                    <h1 data-animation="animated slideInRight">Best care for your <span> Good health</span></h1>
                                    <p data-animation="animated slideInUp">
                                        The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects.
                                    </p>
                                   <!--  <a data-animation="animated slideInUp" class="btn btn-light border btn-md" href="#">View Details</a> -->
                                </div>

                                <!-- Start Appoinment Form -->
                                
                                <div class="col-md-5 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Sign Up </h2>
                                            <h5 style="color:red"><br>* Required</h5>
                                        </div>
                                        
                                       
                                        <form action="Signupsubmit.jsp" method="post" name="form1">
                                            <span style="color:red">
                                            		<%
                            							String msg;
                            							msg=request.getParameter("msg");
					                            		if(msg!=null)
					                            		{
					                            			out.println("<center>"+"<font color=red size=3>"+"Email or mobile is already registred."+"</font>"+"</center>");
					                            		}
					                          		  %></span>
                                            <div class="row">
                                            	 <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="UserName" name="UserName" placeholder="Full name *" type="text">
                                                     <span id="errorname" style="color:red"></span>
                                                    </div>
                                               	 </div>
                                               	 
                                               	<% /* <div class="row">
                                            	 <div class="col-md-12">
                                                    <div class="form-group">
                                                     <input class="form-control" id="UserName" name="UserName" placeholder="Full name *" type="date">
                                                     <span id="errordate" style="color:red"></span>
                                                    </div>
                                               	 </div>*/
                                             %>
                                             	<div class="col-md-12">
	                                             		<table>
	                                             				<tr>
	                                             				<td >&nbsp;<input   name="r1" id="r1" type="radio" value="male" style="height:20px;width:20px;verticle-align:middle;"></td>
	                                             				<td>&nbsp;Male</td>
	                                             				<td>&nbsp;&nbsp;<input   name="r1" id="r1" value="female" type="radio" style="height:20px;width:20px;"></td>
	                                             				<td>&nbsp;Female &nbsp;*</td>
	                                             				<td><span id="errorgen" style="color:red"></span></td>
	                                             				</tr>
	                                             		</table>
	                                             		
	                                         			   
                                             	</div>
                                                
                                                 <div class="col-md-12">
                                                    <div class="form-group">
                                                    
                                                        <textarea class="form-control" placeholder="Enter Address *" id="Address" name="Address" cols="10" rows="2"></textarea>
                                                         <span id="erroradd" style="color:red"></span>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input class="form-control" id="Mobile" name="Mobile" placeholder="Mobile Number *" type="text">
                                                          <span id="errormobile" style="color:red"></span>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input class="form-control" id="Email" name="Email" placeholder="Email *" type="email">
                                                    </div>
                                                      <span id="errormail" style="color:red"></span>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                     <input class="form-control" id="Password" name="Password" placeholder="Password *" type="password">
                                                      <span id="pswerror" style="color:red"></span>
                                                    </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                     <input class="form-control" id="cpsw" name="cpsw" placeholder="Confirm Password *" type="password">
                                                      <span id="errorcpsw" style="color:red"></span>
                                                    </div>
                                                </div>
                                               
                                               <div class="col-md-12">
                                                    <button type="submit" name="submit1" id="submit1">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
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
    
    
</body>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="assets/js/Signupjs.js"></script>
    
</html>