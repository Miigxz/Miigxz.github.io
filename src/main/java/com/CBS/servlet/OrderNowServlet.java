package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.CBS.connection.DBCon;
import com.CBS.dao.OrderDao;
import com.CBS.dao.ProductDao;
import com.CBS.model.Cart;
import com.CBS.model.Order;
import com.CBS.model.Product;
import com.CBS.model.User;


public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); 
			User auth = (User) request.getSession().getAttribute("auth");
			
			if (auth != null) {
				String ProductId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if (productQuantity <= 0) {
					productQuantity = 1;
				}

				Order orderModel = new Order();
				ProductDao pd = new ProductDao(DBCon.getConnection());
				Product prod = pd.getSingleProduct(Integer.parseInt(ProductId));
				orderModel.setName(prod.getName());
				orderModel.setPrice(prod.getPrice());
				orderModel.setStock(prod.getStock());

				orderModel.setId(Integer.parseInt(ProductId));
				orderModel.setUid(auth.getId());
				orderModel.setuFirstname(auth.getFirstname());
				orderModel.setuLastname(auth.getLastname());
				orderModel.setuContact(auth.getContactnum());
				orderModel.setuAddress(auth.getAddress());
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));
				
				pd.updateProductStock(orderModel.getId(), orderModel.getQuantity(), orderModel.getStock());
			
				OrderDao orderDao = new OrderDao(DBCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
					
				if(result) {
						
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if(cart_list != null) {
						for (Cart c:cart_list) {
							if(c.getId() == Integer.parseInt(ProductId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
					}	
					
					String message1 = "Order was successfully checked out, please wait for the confirmation of the store";
					request.setAttribute("message1", message1);
					RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
					dispatcher.forward(request, response);
					
					}else {
						out.print("order failed");
					}
				
			}else {
				response.sendRedirect("login.jsp");
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
