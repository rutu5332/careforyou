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
    <title>Edit Profile</title>
    
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
		String name="",id="0",email="",phno="",gen="",dob="";
		if(session.getAttribute("uid") != null)
			id=session.getAttribute("uid").toString();	 
		
		int uid=Integer.parseInt(id);
		/* System.out.println("id : "+uid); */
		try{
			Data dt=new Data();
			dt.st=dt.cn.createStatement();
			String select="select * from signup_tbl where iSignupId="+uid;
			dt.rs=dt.st.executeQuery(select);
			
			while(dt.rs.next())
			{
				name=dt.rs.getString("vUserName");
				gen=dt.rs.getString("vGender");
				//dob=dt.rs.getString("vUserAge");
				phno=dt.rs.getString("vMobile");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>
	
	
	<div class="banner-area responsive-auto-height text-small" style="height:545px;">
        <div class="item shadow dark text-light bg-fixed" style="background-image: url(assets/img/banner/10.jpg);">
            <div class="box-table">
                <div class="box-cell">
                    <div class="container">
                        <div class="row">
                            <div class="content double-items">

                                <div class="col-md-6 col-sm-6">
                                    <!-- <h1 data-animation="animated slideInRight">Best care for your <span> Good health</span></h1> -->
                                </div>

                                <!-- Start Login Form -->
                                <div class="col-md-6 col-sm-6 appoinment">
                                    <div class="appoinment-box">
                                        <div class="heading">
                                            <h2>Edit</h2>
                                        </div>
                                        <form action="EditSub.jsp" method="post" name="edit">
                                        	<div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:20px;">Name :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="name" name="name" value="<% out.println(name); %>" type="text">
                                                         <span style="color: red" id="errorname"></span>
                                                    </div>
                                                </div>
                                             </div>
                                             
                                             <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:20px;">Gender :</div></div>
												<div class="col-md-8">
													<div class="form-group">
														<select id="gender" name="gender">
															<option value="<%out.println(gen);%>"><%out.println(gen);%></option>
															<option value="Male">Male</option>
															<option value="Female">Female</option>
															<option value="Other">Other</option>
														</select> <span style="color: red" id="errorgen"></span>
													</div>

												</div>
											</div>
                                             
                                            <div class="row">
                                            	<div class="col-md-3"><div style="padding-top:10px;font-size:20px;">Mobile :</div></div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <input class="form-control" id="phone" name="phone" value="<% out.println(phno); %>" type="text">
                                                         <span  style="color: red" id="errormobile"></span>
                                                    </div>
                                                </div>
                                             </div>
                                                
                                              <div class="row">
                                                <div class="col-md-12">
                                                    <button type="submit" name="submit" id="editsub">
                                                        Submit  <i class="fa fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <script src="assets/js/Editjs.js"></script>
                                </div>
                                <!-- End Login Form -->
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
	<script src="assets/js/Editjs.js"></script>
    
</body>

</html>