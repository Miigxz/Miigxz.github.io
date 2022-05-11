<img src="images/logoCuevas.png" alt="Cuevas Bakeshop Logo" class="centerLogo">
	<!-- The form -->
	
	<!---  Navigation  -->
  <!-- Centered link -->
	<%if (auth != null) {
	%> <h5>Hello, <%= auth.getUsername() %></h5> <%
	} %>
  <div class="navbar">
    <a href="index.jsp"><i class="bi bi-house-fill"></i>Home</a>
  	<a href="viewProducts.jsp"><i class="bi bi-binoculars-fill"></i>View Products</a>
  	  
  <% if (auth != null)  {
	 	if (auth.getUsertype().equals("customer")){%>
	 		<a href="cart.jsp"><i class="bi bi-basket-fill"></i>Cart <span class = "badge badge-danger" >${cart_list.size()}</span></a>
	  		<a href="location.jsp"><i class="bi bi-geo-alt-fill"></i>Locations</a>
	  		<a href="aboutUs.jsp"><i class="bi bi-person-badge-fill"></i>About Us</a>
	  		<a href="Logout"><i class="bi bi-box-arrow-left"></i>Logout</a>
	 	<%} else if (auth.getUsertype().equals("admin")) { %>
	 		<a href="ProductList.jsp"><i class="bi bi-egg-fill"></i>Manage Products </a>
	  		<a href="orders.jsp"><i class = "bi bi-basket"></i>Orders</a>
	  		<a href="createAdminAccount.jsp"><i class="bi bi-person-plus-fill"></i>Create Admin Account</a>
	  		<a href="Logout"><i class="bi bi-box-arrow-left"></i>Logout</a>
	 	<%}
	 } else {%>
		<a href="location.jsp"><i class="bi bi-geo-alt-fill"></i>Locations</a>
  		<a href="aboutUs.jsp"><i class="bi bi-person-badge-fill"></i>About Us</a>
  		<a href="login.jsp" ><i class="bi bi-box-arrow-in-right"></i>Login</a>
	<% }%>
  </div>
