<%@page import="java.util.ArrayList"%>
<%@ page import="com.CBS.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null){
		response.sendRedirect("index.jsp");
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
		<div class="login">
		<form action="Login" method="post">
			<div class="loginInput">
				<label for="uname"><b>Username</b></label><br> 
				<input type="text" placeholder=" " name="username" required>
				<label for="pword"><b>Password</b></label><br> 
				<input type="password"placeholder=" " name="password" required>
			</div>
			<h6 style = "color:	red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${message}</h6>
			<h6 style = "color:	green;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${message1}</h6>
			<div class="loginRemember">
				<label>
				<input type = "checkbox" name = "remember"> Remember Me
				</label>
			</div>
			
			<div class="loginBtn">
				<button type="submit">Login</button>
			</div>
			<div class="loginReg">
				<p></p>
				No account yet?  <a href="register.jsp">here</a>
			</div>
			<div class="loginReg">
				<a href="resetPassword.jsp">Forgot password?</a>
			</div>
		</form>
	</div>
	</div>
	
	<!---  End Home Section  -->
	<%@include file="includes/footer.jsp"%>
</script>
</body>
</html>