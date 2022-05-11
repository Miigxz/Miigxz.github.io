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
	<div class="login">
		<form action="ValidateOtp" method="post">
			<div class="loginInput">
				<center><label for="uname"><b>OTP</b></label> <input type="text"
					placeholder="Enter OTP" name="otp" title="get the OTP from your email" required > </center>
				<p>&nbsp;</p>
			</div>
			<div class="loginBtn">
				<button type="submit">Reset Password</button>
			</div>
		</form>
	</div>
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
</body>
</html>