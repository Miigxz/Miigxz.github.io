<%@ page import = "com.CBS.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.CBS.dao.ProductDao"%>
<%@ page import = "com.CBS.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null && auth.getUsertype().equals("admin")){
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
<center>
        <h1>Products Management</h1>
    </center>
    <div align="center">
        <c:if test="${product != null}">
            <form action="UpdateProduct" method="post">
        </c:if>
        <c:if test="${product == null}">
            <form action="AddNewProduct" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${product != null}">
                    </c:if>
                    <c:if test="${product == null}">
                    </c:if>
                </h2>
            </caption>
                <%-- <c:if test="${product == null}"> --%>
            <tr>
            	<th>ID: </th>
            		<td>
                    	<input type="text" name="id" size="45" value="${product.id}" readonly/>
                    </td>
            </tr>        
            	<%-- </c:if>  --%>
            <tr>
                <th>Name: </th>
                <td>
                    <input type="text" name="name" size="45" value="${product.name}"/>
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                    <input type="text" name="price" size="45" value="${product.price}"/>
                </td>
            </tr>
            <tr>
                <th>Stock: </th>
                <td>
                    <input type="text" name="stock" size="45" value="${product.stock}"/>
                </td>
            </tr>
            <tr>
            <tr>
                <th>Image: </th>
                <td>
                    <input type="text" name="image" size="45" value="${product.image}"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                </td>
            </tr>
        </table>
        </form>
    </div>
<!---  End Home Section  -->
<%@include file = "includes/footer.jsp"%>
</body>
</html>