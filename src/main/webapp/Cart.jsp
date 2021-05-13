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
    <title>Cart</title>
    
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
    <div class="breadcrumb-area shadow dark bg-fixed text-light" style="background-image: url(assets/img/banner/18.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Cart</h1>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumb -->
	
	<!-- Start Cart 
    ============================================= -->
    <form  name="pinsubmit" action="pincodesubmit.jsp" method="post">
	<div class="features-area default-padding bg-gray">
		<div class="container">
			
				<div class="appoinment">
					<div class="cart-box">
						<div class="heading">
							<h2>CART</h2>
						</div>
						<div class="cart">
							<table > 
								<tr>
									<th>Product</th>
									<th>Name</th>
									<th>Unit Price</th>
									<th>Quantity</th>
									<th>SubTotal</th>
									<th>Remove</th>
								</tr>
								<%
									String cart="0",qty="0";
									int check=0;
									double total=0;
									if(session.getAttribute("cart") == null)
										cart="0";
									else
									{
										cart=session.getAttribute("cart").toString();
										qty=session.getAttribute("quantity").toString();
									}
									
									if(cart.equals("0") || cart.length() == 0)
									{
										out.println("<tr><td colspan=6>----- No items in cart ------</td></tr>");
									}
									else
									{
										String citems[]=cart.split("/");
										String qitems[]=qty.split("/");
										try{
											Data dt=new Data();
						                	dt.st=dt.cn.createStatement();
											for(int i=0;i<citems.length ; i++)
											{
												String select = "select * from product_tbl where iProductId="+citems[i];
							         		 	dt.rs=dt.st.executeQuery(select);
							         		 	String name="",id="",price="",brand="",img="",stock="";
							         		 	while(dt.rs.next())
							         		 	{
							         		 		name=dt.rs.getString("vProductName");
							         		 		price=dt.rs.getString("dSellPrice");
							         		 		brand=dt.rs.getString("vProductBrand");
							         		 		img=dt.rs.getString("vProductImage");
							         		 		stock=dt.rs.getString("iProductStock");
							         		 	}
							         		 	total +=Math.round( Double.parseDouble(price) * Integer.parseInt(qitems[i])*100.00)/100.00;
												out.println("<tr id=\"itm\"><td style=\"width:30%;\"><a href=\"Product.jsp?id="+citems[i]+"\">");
												out.println("<img src=\"assets/img/products/"+img+"\" alt=\"Thumb\"></a></td>");
												out.println("<td>"+name+"</td>");
												out.println("<input type=\"hidden\" id=\"proid\" value=\""+citems[i]+"\">");
												out.println("<td id=\"price\">"+price+"</td>");
												out.println("<td class=\"qty\"><input type=\"number\" min=1 max="+stock+" value="+qitems[i]+" id=\"quantity\"></td>");
												double sub = Math.round(Double.parseDouble(price) * 100.00 * Double.parseDouble(qitems[i]) ) / 100.00;
												out.println("<td id=\"sub\">"+ sub +"</td>");
												out.println("<td><a href=\"Cart_Remove.jsp?id="+citems[i]+"\"><i class=\"fa fa-trash\"></i></a></td></tr>");
												if(request.getParameter("quant") != null)
												{
													String arr[]=(request.getParameter("quant").toString().trim()).split("/");
													for(int j=0;j<citems.length;j++)
													{
														if(arr[1].equals(citems[j]))
														{
															qitems[j]=arr[0];
														}
													} 
												}
												
											}
											qty="";
											for(int i=0;i<qitems.length ; i++)
											{
												qty+=qitems[i]+"/";
											}
											//System.out.println(qty);
											session.setAttribute("quantity",qty); 
											if(session.getAttribute("uid") != null )
											{
												String update,id;
												id=session.getAttribute("uid").toString();
												dt.st=dt.st=dt.cn.createStatement();
												update="update cart_tbl set vProducts='"+cart+"', vQuantity='"+ qty +"' where iSignupId="+id;
												dt.st.executeUpdate(update);
											}
											out.println("<tr class=\"total\"><td colspan=4></td><th>total</th>");
											out.println("<td style=\"font-weight:600;\" id=\"total\">" + total + "</td></tr>");
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
								
								<input type="text"  id="pcode" name="pcode" class="btn-md" style="border : 2px solid #0cb8b6; font-family: 'Poppins',sans-serif; font-size: 14px; line-height: 25px; " placeholder="Enter Pincode">
								<input type="submit" name="submit" id="submit" class="btn btn-theme border btn-md" value="Check availability">
								<br><span id="error" style="color:red;padding-left:278px;"></span> <span> <%
								 	String msg = " ";
								 	int count = 0;
								 	String pos = "Sorry ..We are not here";
								 	msg = request.getParameter("msg");
								
								 	if (pos.equals(msg)) {
								 		count = 1;
								 	} else {
								 		count = 0;
								 	}
								 	if (msg != null) {
								 		check = 1;
								 		out.println("<center>" + "<font color=red size=3>" + msg + "</font>" + "</center>");
								 	}
								 %>

							</span>


							<%
								if (cart.equals("0") || cart.length() == 0 || count != 0 || check == 0) {
							%>
							<a class="btn btn-theme border btn-md pull-right"
								style="color: red; cursor: not-allowed;"> Checkout</a>
							<%
								} else {
							%>
							<a class="btn btn-theme border btn-md pull-right"
								href="Checkout.jsp"> Checkout</a>
							<%
								}
							%>
							
							<br>
							
							</div>
						</div>
					</div>
				</div>
			
		</div>
	</div>
</form>
<script src="assets/js/cart.js"></script>
	<!-- End Cart -->
   
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>