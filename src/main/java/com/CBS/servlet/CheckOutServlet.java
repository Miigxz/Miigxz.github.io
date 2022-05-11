package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.plaf.metal.OceanTheme;

import com.CBS.connection.DBCon;
import com.CBS.dao.OrderDao;
import com.CBS.dao.ProductDao;
import com.CBS.model.Cart;
import com.CBS.model.Order;
import com.CBS.model.User;


public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			ArrayList<Cart> cart_list =  (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			boolean res = true;
			if (cart_list != null && auth != null) {
				ProductDao pd = new ProductDao(DBCon.getConnection());
	
				for(Cart c: cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setuFirstname(auth.getFirstname());
					order.setuLastname(auth.getLastname());
					order.setuContact(auth.getContactnum());
					order.setuAddress(auth.getAddress());
					order.setStock(c.getStock());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					if (c.getQuantity() <= c.getStock()) {
						pd.updateProductStock(c.getId(), c.getQuantity(), c.getStock());
						
						OrderDao orderDao = new OrderDao(DBCon.getConnection());
						boolean result = orderDao.insertOrder(order);
						
						if (!result) break;
					} else {
						res = false;	
						String message = "Order invalid, stock insufficient";
						request.setAttribute("message", message);
						RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
						dispatcher.forward(request, response);
					}
				}		
				if (res) {
					cart_list.clear();
				}
				
				String message1 = "Order was successfully checked out, please wait for the confirmation of the store";
				request.setAttribute("message1", message1);
				RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
				dispatcher.forward(request, response);
				
			}  else {
				if (auth == null) response.sendRedirect("login.jsp");
					response.sendRedirect("cart.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
