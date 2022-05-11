<%@ page import="com.CBS.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CBS.dao.ProductDao"%>
<%@ page import="com.CBS.connection.DBCon"%>
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
		<div class="login">
		<form action="ForgotPassword" method="post">
			<div class="loginInput">
				<label for="uname"><b>Email</b></label> <input type="email"
					placeholder=" " name="email" required>
				<p>&nbsp;</p>
			</div>
			<div class="loginBtn">
				<button type="submit">Reset your Password</button>
			</div>
			<div class="LoginBtn">
				<center>
					<a href="login.jsp">Go back to Login</a>
				</center>
			</div>
		</form>
	</div>
	</div>
	
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>