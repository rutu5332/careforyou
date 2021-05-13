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
    <title>WishList</title>
    
     <!-- ========== Favicon Icon ========== -->
    <link rel="shortcut icon" href="assets\img\favicon.png" type="image/x-icon">

    
    <!-- ========== Google Fonts ========== -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
    <!-- Start Breadcrumb 
    ============================================= -->
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/24.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>WishList</h1>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
	<!-- Start WishList
    ============================================= -->
	<div class="features-area default-padding bg-gray">
		<div class="container">
			
				<div class="appoinment">
					<div class="cart-box">
						<div class="heading">
							<h2>Wishlist</h2>
						</div>
						<div class="cart">
							<table> 
								<tr>
									<th>Product</th>
									<th>Name</th>
									<th>Unit Price</th>
									<th>Add to cart</th>
									<th>Remove</th>
								</tr>
								<%
									String wishlist="0";
									double total=0;
									if(session.getAttribute("wishlist") == null)
										wishlist="0";
									else
									{
										wishlist=session.getAttribute("wishlist").toString();
									}
									
									if(wishlist.equals("0") || wishlist.length() == 0)
									{
										out.println("<tr><td colspan=6>----- No items in wishlist ------</td></tr>");
									}
									else
									{
										String witems[]=wishlist.split("/");
										try{
											Data dt=new Data();
						                	dt.st=dt.cn.createStatement();
											for(int i=0;i<witems.length ; i++)
											{
												String select = "select * from product_tbl where iProductId="+witems[i];
							         		 	dt.rs=dt.st.executeQuery(select);
							         		 	String name="",id="",price="",brand="",img="";
							         		 	while(dt.rs.next())
							         		 	{
							         		 		name=dt.rs.getString("vProductName");
							         		 		price=dt.rs.getString("dSellPrice");
							         		 		brand=dt.rs.getString("vProductBrand");
							         		 		img=dt.rs.getString("vProductImage");
							         		 	}
												out.println("<tr id=\"itm\"><td style=\"width:30%;\"><a href=\"Product.jsp?id="+witems[i]+"\">");
												out.println("<img src=\"assets/img/products/"+img+"\" alt=\"Thumb\"></a></td>");
												out.println("<td>"+name+"</td>");
												out.println("<input type=\"hidden\" id=\"proid\" value=\""+witems[i]+"\">");
												out.println("<td id=\"price\">"+price+"</td>");
												out.println("<td><a href=\"Add_to_cart.jsp?id="+witems[i]+"\"><i class=\"fas fa-shopping-cart\"></i></a></td>");
												out.println("<td><a href=\"Wishlist_Remove.jsp?id="+witems[i]+"\"><i class=\"fa fa-trash\"></i></a></td></tr>");
												
											}
											
										  }
										  catch(Exception e){
												System.out.println(e);}
									}
								%>
								
							</table>
							<br>
							<div class="row">
								
								<a class="btn btn-theme border btn-md" href="Pharmacy.jsp">
									<i class="fa fa-reply"></i> add more products</a>
							
								<br>
							</div>
						</div>
					</div>
				</div>
			
		</div>
	</div>

	<!-- End WishList -->
   
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>