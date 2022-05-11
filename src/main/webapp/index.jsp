<%@ page import="com.CBS.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CBS.dao.ProductDao"%>
<%@ page import="com.CBS.dao.OrderDao"%>
<%@ page import="com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<!---  End Navigation  -->
	<!--- Home Section --->
	<div class="indexbody">
		<div class="container text-center my-3">
		<div class="row mx-auto my-auto justify-content-center">
			<div id="recipeCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_01.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_20.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_11.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_03.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_10.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="images/product_17.png" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev bg-transparent w-aut"
					href="#recipeCarousel" role="button" data-bs-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span>
				</a> <a class="carousel-control-next bg-transparent w-aut"
					href="#recipeCarousel" role="button" data-bs-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span>
				</a>
			</div>
		</div>
	</div>
	</div>
	
	<!---  End Home Section  -->
	<script type="text/javascript">
	let items = document.querySelectorAll('.carousel .carousel-item')
	
	items.forEach((el) => {
	    const minPerSlide = 4
	    let next = el.nextElementSibling
	    for (var i=1; i<minPerSlide; i++) {
	        if (!next) {
	            // wrap carousel by using first child
	        	next = items[0]
	      	}
	        let cloneChild = next.cloneNode(true)
	        el.appendChild(cloneChild.children[0])
	        next = next.nextElementSibling
	    }
	})
	</script>
	<%@include file="includes/footer.jsp"%>
</body>
</html>