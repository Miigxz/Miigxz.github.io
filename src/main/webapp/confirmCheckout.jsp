<%@ page import="com.CBS.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CBS.dao.ProductDao"%>
<%@ page import="com.CBS.connection.DBCon"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DBCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
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
		<div class="container">
		<div class = "checkout">
			<h2><b>User Information</b></h2><br>
			<div class="checkInput">
				<label><b>Name:</b></label><br>
				<input type="text" value="<%= auth.getFirstname() %> <%= auth.getLastname() %>" name="checkName" readonly>
				<label><b>Contact Number:</b></label><br>
				<input type="text" value = "0<%= auth.getContactnum() %>" name="checkNum" readonly> 
				<label><b>Address:</b></label><br>
				<input type="text" value="<%= auth.getAddress() %>" name="checkAdd" readonly> 
			</div>
			
			<form action = "newContactNumber" method = "post">
				<div class = "checkInput">
					<label for = "uname"><b>New Contact Number</b></label> 
					<input type = "text" placeholder = " " name = "newContactNum" pattern = "[0-9]{11}" name = "contactnumber" title="must contain 11 numbers (e.g. 0912345789)">
				</div>
				<div class = "checkBtn">
					<button type = "submit">Change Contact Number</button>
				</div>
			</form>
			
			<form action = "newAddress" method = "post">
				<div class = "checkInput">
					<label for = "uname"><b>Change Address</b></label> <input type = "text" placeholder = " " name = "newAddress">
				</div>
				<div class = "checkBtn">
					<button type = "submit">Change Address</button>
				</div>
			</form>
			<div class = "checkBtn">
				<p>&nbsp;</p>
				<a href = "cart.jsp" ><button>Go Back to Cart Page</button></a>
			</div>
			
		</div>
	</div>
	</div>
	
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
	</script>
</body>
</html>