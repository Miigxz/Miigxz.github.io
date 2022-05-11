package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.CBS.connection.DBCon;
import com.CBS.dao.OrderDao;
import com.CBS.dao.ProductDao;
import com.CBS.model.Order;
import com.CBS.model.User;
import com.CBS.model.cOrder;

/**
 * Servlet implementation class ConfirmOrderServlet
 */
public class ConfirmOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			
			String Oid = request.getParameter("id");
			OrderDao od = new OrderDao(DBCon.getConnection());
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AccountsDB", "root", "admin");
			PreparedStatement pst = con.prepareStatement("SELECT * FROM Orders WHERE order_id = ?");
			pst.setInt(1, Integer.parseInt(Oid));
			ResultSet rs = pst.executeQuery();
				
			rs.next();
			
			Order order = new Order();
			order.setName(rs.getString("order_id"));
			order.setUid(rs.getInt("user_id"));
			int Pid = rs.getInt("product_id");
			order.setQuantity(rs.getInt("order_quantity"));
			order.setDate(rs.getString("order_date"));
			
			con.close();
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AccountsDB", "root", "admin");
			pst = con.prepareStatement("INSERT INTO oldOrders (order_id, product_id, user_id, order_quantity, order_date) VALUES (?,?,?,?,?)");
			
			pst.setInt(1, Integer.parseInt(Oid));
			pst.setInt(2, (Pid));
			pst.setInt(3, order.getUid());
			pst.setInt(4, order.getQuantity());
			pst.setString(5, order.getDate());
			pst.executeUpdate();
			con.close();
			
			od.deleteOrder(Oid);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
			response.sendRedirect("orders.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
