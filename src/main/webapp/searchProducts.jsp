<%@ page import="com.CBS.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CBS.dao.ProductDao"%>
<%@ page import="com.CBS.dao.OrderDao"%>
<%@ page import="com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="includes/header.jsp"%>

<title>Cuevas Bakeshop</title>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<form action="Search" method="post" class="searchBar"
		style="margin: auto; max-width: 300px; float: right !important;">
		<input type="text" placeholder="Search..." name="search">
		<button type="submit">
			<i class="bi bi-search"></i>
		</button>
	</form>

	<!---  End Navigation  -->
	<!--- Home Section --->
	<div class="col-sm-9">
		<div class="row">
			<c:forEach items="${listP}" var="o">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="card">
						<img class="card-img-top" src="images/${o.image}"
							alt="Card image cap">
						<div class="card-body">
							<%
							if (auth == null || auth.getUsertype().equals("admin")) {
							%>
							<h5 class="card-title">${o.name}</h5>
							<h6 class="price">Price: Php ${o.price}</h6>
							<div class="mt-3 d-flex justify-content-between">
								<%
								} else {
								%>
								<h5 class="card-title">${o.name}</h5>
								<h6 class="price">Price: Php ${o.price}</h6>
								<div class="mt-3 d-flex justify-content-between">
									<a href="AddToCart?id=${o.id}" class="btn btn-primary">Add
										to cart</a> <a href="OrderNow?quantity=1&id= ${o.id}"
										class="btn btn-primary">Buy Now</a>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>