<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null){
		request.setAttribute("auth", auth);
	}
	
	ProductDao pd = new ProductDao(DBCon.getConnection());
	List<Product> products = pd.getAllProducts();	
	
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
<!---  End Navigation  -->
<!--- Home Section --->
	<div class="login">
		<form action="NewPassword" method="post">
			<div class="loginInput">
				<label for="pword"><b>New Password</b></label> <input type="text"
					placeholder="Enter New Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
				<p>&nbsp;</p>
				<label for="pword"><b>Re-Password</b></label> <input type="text"
					placeholder="Confirm New Password" name="confpassword" required>
				<p>&nbsp;</p>
			</div>
			<div class="loginBtn">
				<button type="submit">Reset</button>
			</div>
		</form>
	</div>
<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>