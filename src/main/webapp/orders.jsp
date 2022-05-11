<%@page import="com.CBS.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page import = "java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	
	if (auth != null && auth.getUsertype().equals("admin")){
		request.setAttribute("auth", auth);
	} else {
		response.sendRedirect("login.jsp");
	}
	
	OrderDao od = new OrderDao(DBCon.getConnection());
	List<Order> orders = od.userOrders();

	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
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
	<div class = "container">
	<div class = "background">
		<a href = "newOrders.jsp" class = "btn btn-primary">Past Orders</a>
		<div class = "card-header my-3">All Orders</div>
		<table class = "table">
			<thead>
				<tr>
					<th scope = "col">Date</th>
					<th scope = "col">Customer name</th>
					<th scope = "col">Contact number</th>
					<th scope = "col">Address</th>
					<th scope = "col">Name</th>
					<th scope = "col">Quantity</th>
					<th scope = "col">Price</th>
					<th scope = "col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actions</th>
				</tr>
			</thead>
			<tbody>
			<%
			if (!orders.isEmpty()) {
				for (Order o:orders){%>
					<tr>
						<th><%= o.getDate() %></th>
						<th><%= o.getuFirstname()%> <%= o.getuLastname() %></th>
						<th><%= o.getuContact() %></th>
						<th><%= o.getuAddress() %>
						<th><%= o.getName() %></th>
						<th><%= o.getQuantity() %></th>
						<th><%= dcf.format(o.getPrice()) %></th>
						<th><a class = "btn btn-primary" href = "ConfirmOrder?id=<%= o.getOrderId() %>"> Confirm Order </a>
						<th><a class = "btn bn-sm btn-danger" href = "CancelOrder?id=<%= o.getOrderId() %>"> Cancel </a></th>
					<tr>
				<%} 
			}
			%>
			</tbody>
		</table>
	</div>
</div>
</div>

<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>