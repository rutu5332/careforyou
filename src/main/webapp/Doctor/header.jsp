<%@page import="Storage.Data" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">
    
    <!-- ========== Start Stylesheet ========== -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/flaticon-set.css" rel="stylesheet" />
    <link href="assets/css/magnific-popup.css" rel="stylesheet" />
    <link href="assets/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="assets/css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />
    <link href="assets/css/bootsnav.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet">
    <link href="assets/css/product.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet" />
    <link href="assets/css/project.css" type="text/css" rel="stylesheet" />
    <!-- ========== End Stylesheet ========== -->

   

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5/html5shiv.min.js"></script>
      <script src="assets/js/html5/respond.min.js"></script>
    <![endif]-->

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

	 <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->
	
    <!-- Start Header Top 
    ============================================= -->
    <div class="top-bar-area inline inc-border">
        <div class="container">
            <div class="row">
                <div class="col-md-8 address-info text-left">
                    <div class="info box">
                        <ul>
                            <li>
                                <a href="mailto:care4you2019@gmail.com"><i class="fas fa-envelope-open"></i> care4you2019@gmail.com</a>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>+91 8460102781
                            </li>
                        </ul>
                    </div>
                </div>
                <%
                			Data dt=new Data();	
                    		String link,btn,usr="",id="",qty="",wlist="";
                    		session=request.getSession();
                    		if(session.getAttribute("user") == null)
                    		{
                    			//link="Login.jsp";
                    			btn="<a href=\"#popup1\">Login</a>";
                    		}
                    		else
                    		{
                    			usr=session.getAttribute("user").toString();
                    			id=session.getAttribute("uid").toString();
                    			//link="profile.jsp";
                    			dt.st=dt.cn.createStatement();
                    			String cart,select;
                    			select="select * from cart_tbl where iSignupId = "+id; 
                    			dt.rs=dt.st.executeQuery(select);
                    			while(dt.rs.next())
                    			{
                    				cart=dt.rs.getString("vProducts");
                    				qty=dt.rs.getString("vQuantity");
                    				session.setAttribute("cart",cart);
                    				session.setAttribute("quantity",qty);
                    				//session.setAttribute("wishlist",wlist);
                    			}
                    			select="select * from wishlist_tbl where iSignupId = "+id; 
                    			dt.rs=dt.st.executeQuery(select);
                    			while(dt.rs.next())
                    			{
                    				wlist=dt.rs.getString("vProducts");
                    				session.setAttribute("wishlist",wlist);
                    			}
                    			btn="<a href=\"logout.jsp\">Log Out</a>";
                    		}
                    		
                    	%>
                
                <div class="col-md-4 bar-btn text-right b2">
                    <%out.println(btn);%>
                </div>
		
            </div>
        </div>
    </div>
    
    
    
    <!-- End Header Top -->

     <!-- Header 
    ============================================= -->
    <header id="home">

        <!-- Start Navigation -->
        <nav class="navbar navbar-default attr-border navbar-sticky bootsnav">

            <!-- Start Top Search -->
            <div class="container">
                <div class="row">
                    <div class="top-search">
                        <div class="input-group">
                            <form action="#">
                                <input type="text" name="text" class="form-control" placeholder="Search">
                                <button type="submit">
                                    <i class="fas fa-search"></i>
                                </button>  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Top Search -->

            <div class="container">

                <!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="dropdown active">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fas fa-shopping-cart"></i>
							</a>
								<ul class="dropdown-menu">
									<%
									String cart="0";
									if(session.getAttribute("cart") == null)
										cart="0";
									else
										cart=session.getAttribute("cart").toString();
									
									if(session.getAttribute("quantity") == null)
										qty="0";
									else
										qty=session.getAttribute("quantity").toString();
									
									if(cart.equals("0") || cart.length() == 0)
									{
										out.println("<li class=\"drpdwn-itm\">-- No items in cart -- </li>");
									}
									else
									{
										//System.out.println(cart);
										String citems[]=(cart.trim()).split("/");
										String qtys[]=(qty.trim()).split("/");
										try{
						                	out.println("<li class=\"drpdwn-itm drpdwn-heading\">CART</li>");
											for(int i=0;i<citems.length ; i++)
											{
												dt.st=dt.cn.createStatement();
												String select = "select * from product_tbl where iProductId="+citems[i];
							         		 	dt.rs=dt.st.executeQuery(select);
							         		 	String name="",price="",brand="",img="";							         		 	
							         		 	while(dt.rs.next())
							         		 	{
							         		 		name=dt.rs.getString("vProductName");
							         		 		price=dt.rs.getString("dProductPrice");
							         		 		img=dt.rs.getString("vProductImage");
							         		 	}
							         		 	out.println("<li class=\"drpdwn-itm\"><div class=\"row\">");
												out.println("<div class=\"col-md-5\"><img src=\"assets/img/products/"+img+"\" alt=\"Thumb\"></div>");
												out.println("<div class=\"col-md-3\">"+name+" <br>"+price+"</div>");
												out.println("<div class=\"col-md-2\"> x "+qtys[i]+"</div>");
												out.println("<div class=\"col-md-2 close-cart\" ><a href=\"Cart_Remove.jsp?id="+citems[i]+"\"><i class=\"fa fa-times\"></i></a></div></div></li>");
											}
										  }
											catch(Exception e){
												System.out.println(e);}
										
									}
								%>
									<li>
										<div class="col-md-6 btn btn-theme text-right" style="border:1px solid black;"><a href="Cart.jsp">view cart </a></div>
										<div class="col-md-6 btn btn-theme text-right" style="border:1px solid black;"><a href="#">checkout </a></div>
									 </li>
								</ul>
						</li>
						<li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-heart"></i></a>
							<ul class="dropdown-menu">
									<%
									String wlst="0";
									if(session.getAttribute("wishlist") == null)
										wlst="0";
									else
										wlst=session.getAttribute("wishlist").toString();
									
									if(wlst.equals("0") || wlst.length() == 0)
									{
										out.println("<li class=\"drpdwn-itm\">-- No items in wishlist -- </li>");
									}
									else
									{
										//System.out.println(wlst);
										String witems[]=(wlst.trim()).split("/");
										try{
						                	out.println("<li class=\"drpdwn-itm drpdwn-heading\">Wishlist</li>");
											for(int i=0;i<witems.length ; i++)
											{
												dt.st=dt.cn.createStatement();
												String select = "select * from product_tbl where iProductId="+witems[i];
							         		 	dt.rs=dt.st.executeQuery(select);
							         		 	String name="",price="",brand="",img="";							         		 	
							         		 	while(dt.rs.next())
							         		 	{
							         		 		name=dt.rs.getString("vProductName");
							         		 		price=dt.rs.getString("dProductPrice");
							         		 		img=dt.rs.getString("vProductImage");
							         		 	}
							         		 	out.println("<li class=\"drpdwn-itm\"><div class=\"row\">");
												out.println("<div class=\"col-md-5\"><img src=\"assets/img/products/"+img+"\" alt=\"Thumb\"></div>");
												out.println("<div class=\"col-md-5\">"+name+"<br>"+price+"</div>");
												out.println("<div class=\"col-md-2\" ><a href=\"Add_to_cart.jsp?id="+witems[i]+"\"><i class=\"fas fa-shopping-cart\"></i></a>" );
												out.println("<br><a href=\"Wishlist_Remove.jsp?id="+witems[i]+"\"><i class=\"fa fa-times\"></i></a></div></div></li>");
											}
										  }
											catch(Exception e){
												System.out.println(e);}
										
									}
								%>
									<li>
										<div class="col-md-12 btn btn-theme text-right" style="border:1px solid black;"><a href="#">view wishlist </a></div>
									 </li>
								</ul>
						</li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>

                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="index.jsp">
                        <img src="assets/img/logo.png" class="logo" alt="Logo">
                    </a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                   <ul class="nav navbar-nav navbar-right" data-in="#" data-out="#">
                     
                         <%
	                        dt.st=dt.cn.createStatement();
                 			String sql_menu = "select * from menu_tbl";
                 		 	dt.rs=dt.st.executeQuery(sql_menu);
                        	while(dt.rs.next())
                        	{
                        		String mnm=dt.rs.getString("menu_name");
                        		String site=dt.rs.getString("menu_link");
                        		int sub = Integer.parseInt(dt.rs.getString("menu_sub"));
                        		String stat=dt.rs.getString("menu_status");
                        		
                        		if(stat.equalsIgnoreCase("Active"))	
                        		{
	                        		if(sub==0)
										out.println("<li> <a href=\" " + site + "\">"+ mnm +"</a> </li>");
	                        		else
	                        		{
	                        			out.println("<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">" + mnm + "</a>");
	                        			out.println("<ul class=\"dropdown-menu\">");
	                        			String str=dt.rs.getString("menu_sublist");
	                        			String menu[]=str.split("/");
	                        			str=dt.rs.getString("menu_sublink");
	                        			String slink[]=str.split("/");
	                        			for(int i=0 ; i<sub ; i++)
	                        			{
	                        				out.println("<li><a href=\"" + slink[i] + "\">" + menu[i] + "</a></li>");
	                        			}
	                        			out.println("</ul></li>");
	                        		}
                        		}
                        	} 
                        %> 
                    </ul> 
                </div><!-- /.navbar-collapse -->
            </div>

            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <div class="widget">
                    <h4 class="title">Welcome  
                    	<%out.println(usr); %>
                    </h4>
                    <%
                    	String img;
                    	if(session.getAttribute("img") == null)
                    		img="u1.png";
                    	else
                    		img=session.getAttribute("img").toString();
                    %>
                    
                    <a href="profile.jsp"><img  style="height:175px;width:175px;border:5px solid #0cb8b6;border-radius:150px;" src="assets\img\user\<%out.println(img);%>" id="usr"></img></a>
                     
                </div>
                
                <!-- feedback --> 
               <div class="widget" >
                    <h4 class="title">Feedback</h4>
                    <form method="post" id="fdbckform" method=get action="feedbacksub.jsp" name="fdbckform" >
					
						<div class="form-group">
							<input class="form-control" id="eid" name="eid" placeholder="Email *" type="email">
								<span id="eiderr" style="color: red;"></span>
						</div>
						
						<div class="form-group">
							<textarea class="form-control" placeholder="Enter Feedback *" id="fd" name="fd" cols="40" rows="3"></textarea>
							<span id="fderr" style="color: red;"></span>
						</div>
						
						<div class="col-md-4">
							<button type="submit" name="fdbcksub" id="fdbcksub"
								class="btn btn-theme">
								Submit <i class="fa fa-paper-plane"></i>
							</button>
						</div>	
						
					</form>
                </div>
                <br><br>
                <div class="widget social">
                    <h4 class="title">Connect With Us</h4>
                    <ul class="link">
                        <li class="facebook"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li class="twitter"><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li class="pinterest"><a href="#"><i class="fab fa-pinterest"></i></a></li>
                        <li class="dribbble"><a href="#"><i class="fab fa-dribbble"></i></a></li>
                    </ul>
                </div>
            </div>
            <!-- End Side Menu -->
            
		    <div id="popup1" class="overlay">
				<div class="popup">
					<h2>Login As ?</h2>
					<a href="#" class="close-popup"><i class="fa fa-times"></i></a>
					<div class="content">
						<ul class="nav" data-in="#" data-out="#">
						   <li class="dropdown" style="text-align:center;"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">---Choose one--</a>
							 <ul class="dropdown-menu" >
								<li><a href="Login.jsp"> As User </a></li>
								<li><a href="LoginDoctor.jsp"> As Doctor </a></li>
								<li><a href="LoginPhlebotomist.jsp"> As Phlebotomist </a></li>
								<li><a href="LoginPharmacist.jsp"> As Pharmacist </a></li>
								<li><a href="LoginAdmin.jsp"> As Admin </a></li>
							 </ul>
						   </li>
						</ul>	
					</div>
				</div>
			</div>
		</nav>
        <!-- End Navigation -->

    </header>
           <!-- jQuery Frameworks-->
           
    <!--  ============================================= -->
    
    <script src="assets/js/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/equal-height.min.js"></script>
    <script src="assets/js/jquery.appear.js"></script>
    <script src="assets/js/jquery.easing.min.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/modernizr.custom.13711.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/isotope.pkgd.min.js"></script>
    <script src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="assets/js/count-to.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/bootsnav.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/feedbackjs.js"></script>
    <script src="assets/js/Loginjs.js"></script>
</body>



</html>