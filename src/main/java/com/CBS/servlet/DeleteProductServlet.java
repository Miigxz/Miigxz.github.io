package com.CBS.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.CBS.connection.DBCon;
import com.CBS.dao.CrudDao;
import com.CBS.dao.CrudDao;
import com.CBS.model.Product;

/**
 * Servlet implementation class DeleteProductServlet
 */
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			String id = request.getParameter("id");
			if (id != null) {
				CrudDao crud = new CrudDao(DBCon.getConnection());
				crud.deleteProduct(Integer.parseInt(id));
			}
			response.sendRedirect("ProductList.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
