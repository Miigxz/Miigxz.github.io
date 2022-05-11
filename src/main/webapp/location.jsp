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
	<div id="location">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="gallery">
						<a href = "https://www.google.com/maps/place/Cuevas/@14.575686,120.9854905,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397c98787bfc7e9:0x3bc56ff57a5a2fce!8m2!3d14.5756503!4d120.9876976!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
							<img src="images/location_01.png" width = "200px" height = "200px" class = "img-responsive zoom"/>
                		</a>
                		<br>
                		<div class="location-description">
                			<p>800 Pedro Gil St, Malate, Manila</p>
                		</div>
                	</div>
                	<div class="gallery">
                		<a href = "https://www.google.com/maps/place/Cuevas+Bake+Shop/@14.6552143,121.009606,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397b6f2cf63f729:0x10f321c27e4634ee!8m2!3d14.6562726!4d121.0112672!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src="images/location_02.png" width = "200px" height = "200px" class = "img-responsive zoom" />
                		</a>
                		<br>
                		<div class="location-description">
                			<p>181 Kaingin Rd, Quezon City</p>
                		</div>
                	</div>
                	<div class="gallery">
                		<a href ="https://www.google.com/maps/place/E.+Cuevas+Bakery/@14.5717173,121.0005846,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397c99ba3419345:0x20b88dfe110dd87e!8m2!3d14.5728561!4d121.0025337!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src="images/location_03.png" width = "200px" height = "200px" class = "img-responsive zoom"/>
                		</a>
                		<br>
                		<div class="location-description">
                			<p>1601 A Francisco St, Manila</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href ="https://www.google.com/maps/place/Cuevas+Bakeshop/@14.6629215,120.9943564,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397b69b7690a1b3:0xb1d66f876ec139c6!8m2!3d14.6628482!4d120.9943977!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src="images/location_04.png" width = "200px" height = "200px" class = "img-responsive zoom"/>
                		</a>
                		<br>
                		<div class="location-description">
                			<p>180 Malolos Ave, Caloocan</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href ="https://www.google.com/maps/place/Cuevas+Bakery+Karuhatan+Rd/@14.6889722,120.9739036,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397b408afe852f7:0x759d4694e2e798ed!8m2!3d14.6897676!4d120.975529!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src="images/location_05.png" width = "200px" height = "200px" class = "img-responsive zoom"/>
                		</a>
                		<br>
                		<div class="location-description">
                		<p>1 Ignacio Doon, Valenzuela</p>
						</div>
                	</div>
                </div>
                
                <div class="row">
                	<div class="gallery">
                		<a href ="https://www.google.com/maps/place/Cuevas+Bakery/@14.5738419,121.0056868,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397c9999c178cf5:0x1d4372b9c12133f4!8m2!3d14.574274!4d121.006525!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src="images/location_06.png" width = "200px" height = "200px" class = "img-responsive zoom"/>
                		</a>
                		<br>
                		<div class="location-description">
                			<p>1831 Florentino Torres, Manila</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href = "https://www.google.com/maps/place/Cuevas+Bakeshop/@14.7653629,121.0733809,15z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397affc215a5a9f:0x4222640703d7dfc1!8m2!3d14.7663398!4d121.0732899!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src = "images/location_07.png" width = "200px" height = "200px" class = "img-responsive zoom" />
                		</a>
                		<br>
                		<div class="location-description">
                			<p>1242 Saint Joseph Avenue, Caloocan</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href = "https://www.google.com/maps/place/Cuevas+Bakery/@14.57852,120.9903622,15z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397c98921d0b7ed:0x5a9dd782d51a6b3b!8m2!3d14.5808275!4d120.9920027!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src = "images/location_08.png" width = "200px" height = "200px" class = "img-responsive zoom" />
                		</a>
                		<br>
                		<div class="location-description">
                			<p>Angel Linao St, Paco, Manila</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href = "https://www.google.com/maps/place/Cuevas+Bread+Store/@14.7093142,120.9599295,18z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397b391f57b1955:0x8d8cf66671fd4ad7!8m2!3d14.7093771!4d120.9599353!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src = "images/location_09.png" width = "200px" height = "200px" class = "img-responsive zoom" />
                		</a>
                		<br>
                		<div class="location-description">
                			<p>MacArthur Highway, Valenzuela</p>
						</div>
                	</div>
                	<div class="gallery">
                		<a href = "https://www.google.com/maps/place/Cuevas+Bakery+Karuhatan+Rd/@14.6895348,120.9750682,17z/data=!4m9!1m2!2m1!1scuevas+bakeshop!3m5!1s0x3397b408afe852f7:0x759d4694e2e798ed!8m2!3d14.6897676!4d120.975529!15sCg9jdWV2YXMgYmFrZXNob3BaESIPY3VldmFzIGJha2VzaG9wkgEGYmFrZXJ5" target="_blank" rel="noreferrer noopener">
                			<img src = "images/location_10.png" width = "200px" height = "200px" class = "img-responsive zoom" />
                		</a>
                		<br>
                		<div class="location-description">
                		<p>1 Ignacio Doon St, Valenzuela</p>
						</div>
                	</div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>