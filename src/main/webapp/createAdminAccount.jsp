<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null && auth.getUsertype().equals("admin")){
		request.setAttribute("auth", auth);
	} else {
		response.sendRedirect("login.jsp");
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
<div class="indexbody">
	<div class="modal-bg">
		<div class="modalPriv">
			<h2>Privacy Notice </h2>
			<p>The Cuevas Bakeshop understands its obligations under Republic Act No. 10173 (Act), generally known as the Data Privacy Act of 2012, with respect to the information they collect, record, 
			organize, update, utilize, consolidate, or destroy from customers. Personal information collected on this website is entered and maintained in the company's authorized information and 
			communications system, which is only accessible by Cuevas Bakeshop's authorized personnel. To ensure the protection of customers' personal data, the Cuevas Bakeshop has implemented 
			adequate organizational, technical, and physical security measures.
			</p>
			<button class="modalPriv-btn">I understand</button>
		</div>
</div>
<script>
		var modalbtn = document.querySelector('.modalPriv-btn');
		var modalbq = document.querySelector('.modal-bg');
		
		modalbtn.addEventListener("click",function(){
			modalbq.classList.add("modal-bg-active");
		})
	
</script>
<div class="register">
		<form action = "RegisterAdmin" method="post">
			<div class="registerInput">
				<label for = "uname"><b>Username</b></label><br>
				<input type = "text" placeholder = " " name = "username" required>
				<label for = "pword"><b>Password</b></label><br>
				<input type = "password" placeholder = " " name = "password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
				<label for = "pword"><b>Re-enter Password</b></label><br>
				<input type = "password" placeholder = "" name = "repassword">
				<label for = "email"><b>Email</b></label><br>
				<input type = "email" placeholder = " " name = "email" required>
				<label for = "fname"><b>First name</b></label><br>
				<input type = "text" placeholder = " " name = "firstname" required>
				<label for = "lname"><b>Last name</b></label><br>
				<input type = "text" placeholder = " " name = "lastname" required>
				<label for = "cnum"><b>Contact number</b></label><br>
				<input type = "tel" placeholder = "+63 " pattern = "[0-9]{11}" name = "contactnumber" title="must contain 11 numbers (e.g. 0912345789)" required>
				<label for = "address"><b>Address</b></label><br>
				<input type = "text" placeholder = " " name = "address" required>
			</div>
			<h6 style = "color:	red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${RegError}</h6>
			<div class="registerBtn">
				<button type = "submit" > Register </button>
			</div>
		</form>
	</div>
</div>

<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>