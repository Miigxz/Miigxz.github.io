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
	%>
<!DOCTYPE html>
<html lang = "en">
<head>
<%@include file = "includes/header.jsp"%>
<title>Cuevas Bakeshop</title>
<style>
	form {
		width: 100%;
		position: relative;
		display: block;
		margin: 20px auto;
	}
</style>
</head>
<body>
<%@include file = "includes/navbar.jsp"%>
<!---  End Navigation  -->
<!--- Home Section --->
<div class="indexbody">
	<div class = "container">
	<div class = "background">
			<h1>Products Management</h1>
			<center>
			<h2>
			 	<a href="ProductForm.jsp" class="btn btn-primary">Add New Product</a>      
			</h2>
			</center>
		    <div align="center">
		        <table border="1" cellpadding="5">
		            <tr>
		                <th>ID</th>
		                <th>Name</th>
		                <th>Price</th>
		                <th>Stock</th>
		                <th>Actions</th>
		            </tr>
		            <%
		            	if (!products.isEmpty()){
		            		for (Product p:products){ %>
		            		<tr>
		            		<% if (auth != null && auth.getUsertype().equals("admin")){ %>
		            			<td><%= p.getId() %> </td>
		            			<td><%= p.getName() %> </td>
		            			<td><%= p.getPrice() %> </td>
		            			<td><%= p.getStock() %> </td>
		            			<td><%= p.getImage() %> </td>
		            			<td>
		            				<a href="/Cuevas-BakeShop/EditProduct?id=<%= p.getId() %>" class="btn btn-primary">Edit</a>
		            				<a href="/Cuevas-BakeShop/DeleteProduct?id=<%= p.getId() %>" class="btn btn-primary">Delete</a>
		            			</td>
		            		<% } %>
		            	<% } %>
		            <% } %>
		        </table>
			</div>
			<div class="main">
		    	<form method="POST" action="UploadImage" enctype="multipart/form-data">
		        	<input type="file" name="file"/>
		        	<br>
		            <input type="submit" value="Upload"/>
		       	</form>
		   </div>
	</div>
</div>
</div>

<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>