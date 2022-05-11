package com.CBS.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import com.CBS.connection.DBCon;
import com.CBS.dao.ProductDao;
import com.CBS.model.Cart;
import com.CBS.model.Product;

public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");	
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			try {
				ProductDao pd = new ProductDao(DBCon.getConnection());
				Product prod = pd.getSingleProduct(id);
				cm.setName(prod.getName());
				cm.setPrice(prod.getPrice());
				cm.setStock(prod.getStock());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			cm.setQuantity(1);
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("viewProducts.jsp");
				System.out.println("session created and added the list");
			} else {
				cartList = cart_list;
				boolean exist = false;
				
//				cartList.contains(cm);
				for (Cart c: cartList) {
					if (c.getId() == id) {
						exist = true;
						response.sendRedirect("cart.jsp");
					}
				}
				if (!exist) {
					cartList.add(cm);
					response.sendRedirect("viewProducts.jsp");
				}
			}
			
		}		
	}
}
