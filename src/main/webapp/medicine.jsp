<!DOCTYPE html>
<%@page import="Storage.Data" %>
<html lang="en">

<head>
    <!-- ========== Meta Tags ========== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Care for you">

    <!-- ========== Page Title ========== -->
    <title>Products</title>

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
   <%
   		String pid=request.getParameter("id");
   		String catnames[]={"","Baby care","Joint Pain" ,"Cold and Fever","Diabetes care" 
		   			,"Oral care","weight care","covid-19","Personal care","Women Care"};
   	 String url="assets/img/category/banner"+pid+".jpg";
   %>
   
    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" 
    		style="background-image: url(<%out.println(url);%>);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1><%out.println(catnames[Integer.parseInt(pid)]); %></h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
   
   <!-- Start Product
    ============================================= -->
   
   <div class="product-area bg-gray default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="product-items text-center">
                
                	<%
                		
                		Data dt=new Data();
	                	dt.st=dt.cn.createStatement();
	         			String select = "select * from product_tbl where iProductCategory="+pid + "&& eStatus like 'A'";
	         		 	dt.rs=dt.st.executeQuery(select);
	         		 	String name="",id="",price="",brand="",img="";
	         		 	String cart="0",wlst="0",clr="";
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
	         		 	while(dt.rs.next())
	         		 	{
	         		 		id=dt.rs.getString("iProductId");
	         		 		name=dt.rs.getString("vProductName");
	         		 		price=dt.rs.getString("dSellPrice");
	         		 		brand=dt.rs.getString("vProductBrand");
	         		 		img=dt.rs.getString("vProductImage");
	         		 		//System.out.println(id);
	         		 		out.println("<div class=\"col-md-3 col-sm-4 equal-height\" style=\"width:33.33%;\" >");
	         		 		out.println("<div class=\"item\">");
	         		 		out.println("<div class=\"thumb\" >");
	         		 		out.println("<img style=\"height:300px;\" src=\"assets/img/products/"+img+"\" alt=\"Thumb\">");
	         		 		out.println(" <div class=\"social\">");
	         		 		out.println("<ul><li class=\"option\">");
	         		 		link="Wishlist_Add.jsp?id="+id;
	         		 		nm="Add to Wishlist";
	         		 		clr="color:white";
	         		 		if(wlst.indexOf(id) != -1)
	         		 		{
	         		 			link="Wishlist_Remove.jsp?id="+id;
	         		 			nm="Remove from Wishlist";
	         		 			clr="color:red;";
	         		 		}
	         		 		out.println("<div class=\"display-text\">"+nm+"</div>");
	         		 		out.println("<a href="+link+"><i class=\"fa fa-heart\" style=\""+clr+"\"></i></a></li>");
	         		 		link="Product.jsp?id="+id;
	         		 		out.println("<li class=\"option\"><a href=\""+link+"\" ><i class=\"fa fa-eye\"></i></a>");
	         		 		out.println("<div class=\"display-text\">view</div></li>");
	         		 		link="Cart_Add.jsp?id="+id;
	         		 		nm="add to cart";
	         		 		sym="fa fa-shopping-cart";
	         		 		if(cart.indexOf(id) != -1)
	         		 		{
	         		 			link="Cart.jsp";
	         		 			nm="Go to cart";
	         		 			sym="fas fa-arrow-right";
	         		 		}
	         		 		out.println("<li class=\"option\"><a href="+link+"><i class=\""+sym+"\"></i></a>");
	         		 		out.println("<div class=\"display-text\">"+nm+"</div></li></ul></div></div>");
	         		 		out.println("<div class=\"info\">");
	         		 		out.println("<h4>"+name+"</h4>");
	         		 		out.println("<h5> Rs. "+price+"</h5>");
	         		 		
	         		 		out.println("<a href="+link+"> <button class=\"btn btn-theme border btn-md\">");
	         		 		out.println(nm+"</button></a></div>");
	         		 		out.println("</div>");
	         		 		out.println("</div>");
	         		 	}
                	%> 
                    
                </div>
            </div>
        </div>
    </div>
    
    <!-- End Product -->
    
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>