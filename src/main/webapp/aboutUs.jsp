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

<div class="indexbody">
	<div class="container">
	<div class="background">
		<center><h2 style="font-weight: bold;">OUR STORY</h2></center>
		<br>
		<h5 style="font-weight: bold;">A Family Legacy </h5>
		<p> Metring Cuevas, the owner of Cuevas Bakeshop, started out as a pandesal vendor, helping out his older brother run his bakery in Tondo. Instead of learning in the classroom, Metring Cuevas spent his childhood roaming the streets of Manila to sell bread. His unwavering  dream of having his own bakery was what brought the former rice farmer from a sleepy town in Batangas to the busy streets of Tondo, Manila.</p>
		<br>
		<h5 style="font-weight: bold;">On the Road to Fulfilling His DREAM</h5>
		<p>As Cuevas grew in the baking business, he inched closer to his dream of putting up his own bakery when he eventually met his would-be wife, who was also a pandesal vendor herself. Through a loan borrowed from his brother, they were able to buy one oven and flour and they took a leap of faith and opened his first bakery in Leon Guinto, Manila. The business risk immediately paid off as customers flocked to his small bakeshop. Their business sales grew because they made sure that the products they offer are all delicious.</p>
		<br>
		<h5 style="font-weight: bold;">The Birth of the 28 Branches</h5>
		<p>A second bakery later was opened in Pedro Gil, signaling the start of the Cuevas Bakery's expansion across the country. Today, Cuevas Bakeshop has 28 branches and is raking in millions of pesos in sales per year. Cuevas Bakeshop is now known for its freshly baked breads, cakes, cookies and special desserts. </p>
		<br>
		<h5 style="font-weight: bold;">The Success of the Cuevas Bakery</h5>
		<p>Cuevas claimed that his success as a baker was not by chance but was a result of the hard work he invested even before he started his own business. He also said that, "Work is really very hard in bakeshops and is not the work for lazy persons. You have to be awake all the time because breads are very delicate to handle." Cuevas also claimed that despite his success,  he considered his true achievement that he was able to send all his children to school and was able to build a house for his family. He said that they never lived a luxurious life but were contented in living a simple life. He was contented and happy that he was able to send all his children to school and were able to eat delicious food.</p>
		<br>
		<h5 style="font-weight: bold;">The Legacy Lives On    </h5>
		<p>Until his death in March 2016, Cuevas was hands-on in his baking while passing on what he had learned to his children. According to Cuevas' son Vhio, "Whatever occupation their father  had before, he taught his children the hard work and never allowed them to become lazy." And the rest is history for Cuevas Bakeshop. Now, it continues to create good memories as the family business and traditions linger on.</p>
	</div>
</div>
</div>
<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>