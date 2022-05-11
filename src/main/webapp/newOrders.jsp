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
	List<Order> orders = od.oldUserOrders();

	double sum = 0;
	
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
<div class = "container">
	<div class="background">
		<div class = "card-header my-3">All Orders</div>
		<table class = "table">
			<thead>
				<tr>
					<th scope = "col">order id</th>
					<th scope = "col">Date</th>
					<th scope = "col">Product Name</th>
					<th scope = "col">Quantity</th>
					<th scope = "col">Price</th>
				</tr>
			</thead>
			<tbody>
			<%
			if (!orders.isEmpty()) {
				for (Order o:orders){%>
					<tr>
						<th><%= o.getOrderId() %></th>
						<th><%= o.getDate() %></th>
						<th><%= o.getName() %></th>
						<th><%= o.getQuantity() %></th>
						<th><%= dcf.format(o.getPrice()) %></th>
						<% sum = sum + o.getPrice();%>
					<tr>
				<%}
			}
			%>
			<h4>Total Price: <%= dcf.format(sum)%></h4>
			</tbody>
		</table>
	</div>
</div>
<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>