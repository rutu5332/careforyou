<!DOCTYPE html>
<%@page import="Storage.Data" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Care for you">

    <!-- ========== Page Title ========== -->
    <title>Product Veiw</title>

    <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>

    <!-- Preloader Start -->
    <div class="se-pre-con"></div>
    <!-- Preloader Ends -->

   <jsp:include page="header.jsp"></jsp:include>
   
    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/19.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Product Details</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
    
    <%
    	String id=request.getParameter("id");
    	//System.out.println(id);
    	String name="",brand="",price="",details="",ind="",img="",mes="",code="",cat="",mprice="",units="";
    	String highlights="";
    	int cid=0;
    	Data dt= new Data();
    	dt.st=dt.cn.createStatement();
    	String select="select * from product_tbl where iProductid = "+id ;
    	dt.rs=dt.st.executeQuery(select);
    	while(dt.rs.next())
    	{
    		name=dt.rs.getString("vProductName");
    		brand=dt.rs.getString("vProductBrand");
    		price=dt.rs.getString("dSellPrice");
    		mprice=dt.rs.getString("dMfgPrice");
    		img=dt.rs.getString("vProductImage");
    		details=dt.rs.getString("vProductDetails");
    		ind=dt.rs.getString("vProductIngredients");
    		mes=dt.rs.getString("iMeasurement");
    		code=dt.rs.getString("vProductCode");
    		units=dt.rs.getString("iUnits");
    		highlights=dt.rs.getString("vHighlight");
    		cid=Integer.parseInt(dt.rs.getString("iProductCategory"));
    	}
    	
    	switch(Integer.parseInt(mes))
    	{
    		case 1:
    			mes="Units";
    			break;
    		case 2:
    			mes="ml";
    			break;
    		case 3:
    			mes="gram";
    			break;
    	}
    	
    	String cart="0",wlst="0";
		if(session.getAttribute("cart") == null)
			cart="0";
		else
			cart=session.getAttribute("cart").toString();
		if(cart.length() == 0)
			cart="0";
		if(session.getAttribute("wishlist") == null)
			wlst="0";
		else
			wlst=session.getAttribute("wishlist").toString();
		if(wlst.length() == 0)
			wlst="0";
		String link,nm,sym;
		String catnames[]={"","Baby care","Joint Pain" ,"Cold and Fever","Diabetes care" 
	   			,"Oral care","weight care","covid-19","Personal care","Women Care"};
    %>
   
   <!-- Start Product Details
    ============================================= -->
    <div class="doctor-details-area default-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div>
                        <img src="assets/img/products/<%out.println(img); %>" alt="Thumb">
                    </div>
                    <div>
                    	<br>
                    	<label class="price" ><%out.println("&#8377;"+price); %></label>
                    	<label style="font-size:20px;"><%out.println("&nbsp; <strike>&#8377;"+mprice+"</strike>");%></label>
                    	<br><br>
                    	
                    	<%
	                    	link="Wishlist_Add.jsp?id="+id;
	         		 		nm="Add to Wishlist ";
	         		 		if(wlst.indexOf(id) != -1)
	         		 		{
	         		 			link="Wishlist_Remove.jsp?id="+id;
	         		 			nm="Remove ";
	         		 		}
                    	%>
                    	<a class="btn btn-theme border btn-md" style="margin-bottom:10px;" href="<%out.println(link);%>">
                    		<%out.print(nm); %><i class="fa fa-heart"></i></a>
                    	
                    	<% 
                    		link="Cart_Add.jsp?id="+id;
	         		 		nm="add to cart ";
	         		 		sym="fa fa-shopping-cart";
	         		 		if(cart.indexOf(id) != -1)
	         		 		{
	         		 			link="Cart.jsp";
	         		 			nm="Go to cart";
	         		 			sym="fas fa-arrow-right";
	         		 		}
	         		 	%>
                    	<a class="btn btn-theme border btn-md" href="<%out.println(link); %> ">
                    		<%out.print(nm); %> <i class="<%out.print(sym); %>"></i></a>
                    </div>
                </div>
                <div class="col-md-8">
                    <div>
                        <h2><% out.println(name);%></h2>
                        <h5>Manufactured by : <%out.println(brand); %></h5>
      					<h4 class="product-info">Unit :<%out.println(units + " " + mes); %> </h4>
      					<h4>Category : <%out.println(catnames[cid]); %></h4>
                    	<!-- <h4 class="product-info">Power : 300mg</h4>   -->               
      
                        <!-- <a class="btn btn-theme border btn-md" href="#">Make Appoinment</a> -->
                         <!-- Tab Nav -->
                        <ul class="nav nav-pills">
                            <li class="active">
                                <a data-toggle="tab" href="#tab1" aria-expanded="true">
                                    Description
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab2" aria-expanded="false">
                                    Ingredients
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab3" aria-expanded="false">
                                    Highlights
                                </a>
                            </li>
                        </ul>
                        <!-- End Tab Nav -->
                        <!-- Start Tab Content -->
                        <div class="tab-content tab-content-info">
                            <!-- Single Item -->
                            <div id="tab1" class="tab-pane fade active in">
                                <div class="info title">
                                   <% out.println(details); %> 
                                </div>
                            </div>
                            <!-- End Single Item -->

                            <!-- Single Item -->
                            <div id="tab2" class="tab-pane fade">
                                <div class="info title">
                                   <%out.println(ind); %> 
                                </div>
                            </div>
                            <!-- End Single Item -->

                            <!-- Single Item -->
                            <div id="tab3" class="tab-pane fade">
                                <div class="info title">
                                   <%out.println(highlights); %> 
                                    
                                </div>
                            </div>
                            <!-- End Single Item -->

                        </div>
                        <!-- End Tab Content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Details -->
    
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>