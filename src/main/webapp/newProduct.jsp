<%@page import="java.util.ArrayList"%>
<%@ page import="com.CBS.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null){
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
	<div class="login">
		<form action="#newProduct" method="post">
			<div class="loginInput">
				<label for="uname"><b>Name:</b></label> <input type="text"
					placeholder="Enter Product Name" name="productName" required>
				<p>&nbsp;</p>
				<label for="pword"><b>Price:</b></label> <input type="text"
					placeholder="Enter Product Price" name="productPrice" required>
				<p>&nbsp;</p>
				<label for="pword"><b>Stock:</b></label> <input type="text"
					placeholder="Enter Password" name="productStock" required>
				<p>&nbsp;</p>
				<label for="pword"><b>Image:</b></label> <input type="file"
					name="productImage" required>
				<p>&nbsp;</p>
			</div>
			<div class="loginBtn">
				<button type="submit">Add Product</button>
			</div>
		</form>
	</div>
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
</script>
</body>
</html>