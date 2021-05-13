<%@page import="Storage.Data"%>

<html lang="en">

<head>
<!-- ========== Meta Tags ========== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Care for you">

<!-- ========== Page Title ========== -->
<title>Checkout</title>

<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="assets\img\favicon.png"
	type="image/x-icon">

<!-- ========== Google Fonts ========== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,500,600,700,800"
	rel="stylesheet">
	
	<script src="assets/js/Checkout.js"></script>

</head>

<body>

	<!-- Preloader Start -->
	<div class="se-pre-con"></div>
	<!-- Preloader Ends -->

	<jsp:include page="header.jsp"></jsp:include>

	 <%
	 String user="";
	 
		if (session.getAttribute("user") == null)
			response.sendRedirect("Login.jsp");
		else
		{
			user=session.getAttribute("uid").toString();
			
		}
	%> 

	<%
		String cart="",qty="";
	double total=0.0;
		
		if (session.getAttribute("cart") != null)
		{
			cart=session.getAttribute("cart").toString();
			qty=session.getAttribute("quantity").toString();
		
			
		}
		Data dt=new Data();
    	dt.st=dt.cn.createStatement();
	%>

	<!-- Start Checkout
    ============================================= -->
	<div class="features-area default-padding bg-gray">
		<div class="container">
			<div class="appoinment">
				<div class="cart-box">
					<div class="heading">
						<h2>Checkout</h2>
					</div>
										
					<div class="row">
						<div class="col-md-6 check-box left-margin" >
						<h3>Shipping to:</h3>
						<%
						
						String sql_menu = "select * from signup_tbl where iSignupId  ='"+user+"' ";
						
						dt.rs=dt.st.executeQuery(sql_menu);
						
						
						try
						{
							String mno="",user_name="",add="";
							
							while(dt.rs.next())
							{
									 mno=dt.rs.getString("vMobile");
									 user_name=dt.rs.getString("vUserName");
									 add=dt.rs.getString("vAddress");
								
							}
							
							out.println(user_name);%><br>
							<% out.println(mno); %><br>
							<% out.println(add); %><br>
							<form method="post" name="upadd" id="upadd" action="ChangeAdd.jsp">
							<div id="mydiv" style="display:none">
							<textarea  placeholder="Enter New Address" name="newadd" id="newadd" rows="2" cols="28" style=" border-bottom:dotted; border:none;" required></textarea>
							
							<span id="error" style="color:red"></span>
							<br>
							<input type="submit" name="change" id="change" value="Submit Address" class="btn btn-theme border btn-md"><br><br>
							</div>
							</form>
							<% 
							
							 
						}

						
						catch(Exception ex)
						{
							out.println(ex);
						}
						
						%>
						
							
							<button onclick="myfn()" class="btn btn-theme border btn-md">Change Address</button>
						
						
						</div>
						<div class="col-md-4 check-box left-margin">
							<h3>Payment Method:</h3>
							cod<br>
							
						</div>	
					</div>
				
				<!-- 	<div class="row">
						<div class="col-md-5 check-box left-margin" >
							<h3>Coupon Code:</h3>
						</div>
						
					</div>
				 -->
					<div class="row">
						<div class="col-md-10 check-box left-margin">
							<h3>Order Details:</h3>
							<%
								double pr,qt;
							int qt2;
								String cartitems[]=cart.split("/");
								String qitems[]=qty.split("/"); 
								for(int i=0;i<cartitems.length;i++)
								{
									String select = "select * from product_tbl where iProductId="+cartitems[i];
				         		 	dt.rs=dt.st.executeQuery(select);
				         		 	String name="",price="",brand="",img="";
				         		 	
				         		 	while(dt.rs.next())
				         		 	{
				         		 		name=dt.rs.getString("vProductName");
				         		 		price=dt.rs.getString("dSellPrice");
				         		 		brand=dt.rs.getString("vProductBrand");
				         		 		img=dt.rs.getString("vProductImage");
				         		 	}
				         		 pr=Double.parseDouble(price);
				         		 qt=Double.parseDouble(qitems[i]);
				         		 qt2=Integer.parseInt(qitems[i]);
				         		session.setAttribute("qt2",qt2);
				         		
				         		 total=pr*qt;
									out.println("<div class=\"col-md-7 check-box\" style=\"margin-left:40px;\" > ");
									out.println("<div class=\"col-md-5\">");
									out.println("<img src=\"assets/img/products/"+img+"\" alt=\"Thumb\" ");
									out.println("class=\"image-size\">");
									out.println("</div><div class=\"col-md-7\">Product : "+name+"</div>");
									out.println("<div class=\"col-md-7\">Brand : "+brand+"</div>");
									out.println("<div class=\"col-md-7\">UnitPrice : "+price+"</div>");
									out.println("<div class=\"col-md-7\">Quantity : "+qitems[i]+"</div> ");
									out.print("<div class=\"col-md-7\">Total : "+total+"</div> ");
									out.println("</div>");
				
							}
							session.setAttribute("total",total);
							
							%>
						</div>
					</div>
					
					<div class="row">
						<a class="btn btn-theme border btn-md pull-right" href="Order.jsp">Place Order</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>



</body>

<script>

function myfn()
{
	var x=document.getElementById("mydiv");
		if(x.style.display === "none")
		{
			x.style.display = "block";
		}
		else
		{
			x.style.display = "none";		
		}
		
	
}

</script>

</html>