<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null){
		request.setAttribute("auth", auth);
	}
	
	ProductDao pd = new ProductDao(DBCon.getConnection());
	List<Product> products = pd.getAvailableProducts();
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html lang = "en">
<head>
<%@include file = "includes/header.jsp"%>

<title>Cuevas Bakeshop</title>
</head>
<body>
<%@include file = "includes/navbar.jsp"%>
<form action="Search" method = "get" class="searchBar"  style="margin:auto;max-width:300px;float:right !important;">
		<input type="text" placeholder="Search..." name="search">
		<button type="submit"><i class="bi bi-search"></i></button>
</form>

<!---  End Navigation  -->
<!--- Home Section --->
<div class = "container">
	<div class = "row">
	<%
			for(Product p:products){ %>
				<div id = "prod" class="card" style="width: 18rem;">
  					<img src="images/<%= p.getImage() %>" class="card-img-top" alt="...">
  					<div class="card-body">
					    <% if (auth == null || auth.getUsertype().equals("admin")) {%>
						    <h5 class="card-title"><%= p.getName() %></h5>
						    <h6 class = "price">Price: Php <%= p.getPrice() %></h6>
						    <div class = "mt-3 d-flex justify-content-between">
				    	<%} else { %>
				    		<h5 class="card-title"><%= p.getName() %></h5>
						    <h6 class = "price">Price: Php <%= p.getPrice() %></h6>
						    <h6 class>Stock Quantity: <%= p.getStock() %></h6>
						    <div class = "mt-3 d-flex justify-content-between">
				    		<a href="AddToCart?id=<%= p.getId() %>" class="btn btn-primary">Add to cart</a>
				    		<a href="OrderNow?quantity=1&id=<%=p.getId()%>&stock=<%= p.getStock() %>" class="btn btn-primary">Buy Now</a>
				    	<%} %>
	    				</div>
  					</div>
				</div>
			
			<%} 
	%>
	</div>
</div>
<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>