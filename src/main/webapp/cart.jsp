<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page import = "java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null && auth.getUsertype().equals("customer")){
		request.setAttribute("auth", auth);
	} else {
		response.sendRedirect("login.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DBCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		session.setAttribute("cart_list", cart_list);
		session.setAttribute("total", total);
	}
	
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
	<div class="background">
		<table class = "table table-loght">
			<thead>
				<tr>
				<th scope = "col"> Name </th>
					<th scope = "col"> Price </th>
					<th scope = "col"> Buy Now </th>
					<th scope = "col"> Available Stock </th>
					<th scope = "col"> Cancel </th>
				</tr>
			</thead>
			<tbody>
			<%if (cart_list != null) {
				for (Cart c:cartProduct){ %>
					<tr>
					<td><%= c.getName() %></td>
					
					<td>Php <%= dcf.format(c.getPrice()) %></td>
					<td>
						<form action = "OrderNow" method = "post" class ="form-inline" >
							<input type = "hidden" name = "id" value = "<%= c.getId() %>" class = "form-input">
							<div class = "form-group d-flex justify-content-between w-50">
								<a class = "btn btn-sm btn-decrement" href = "QuantityIncDec?action=dec&id=<%=c.getId() %>"><i class="bi bi-dash-square"></i></a>
								<input type = "text" name = "quantity" class = "form-control w-70" value = "<%= c.getQuantity() %>" readonly">
								<a class = "btn btn-sm btn-increment" href = "QuantityIncDec?action=inc&id=<%=c.getId()%>"><i class="bi bi-plus-square"></i></a>
								<button type="submit" class = "btn btn-primary btn-sm">Buy</button>
							</div>
							
						</form>
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= c.getStock() %></td>
					<td><a class = "btn btn-sm btn-danger" href = "RemoveFromCart?id=<%= c.getId() %>">Remove</a></td>
				</tr>
				<%}
			}
			%>
			</tbody>
		</table>
		<h6 style = "color:	red;">${message}</h6>
		<h6 style = "color:	green;">${message1}</h6>
		<div class = "d-flex py-3">
				<p>&nbsp;</p>
				<h3>Total Price: Php ${(total>0)?dcf.format(total):0}</h3>
				<a class = "mx-3 btn btn-primary" href = "CheckOut">Check out</a>
		</div>
				<br>
				<h6>Before you check out, please check your details <a href = "confirmCheckout.jsp" style="text-decoration: underline; font-weight: bold;">here </a> </h6>
	</div>
</div>
</div>

<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>