package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.CBS.connection.DBCon;
import com.CBS.dao.CrudDao;
import com.CBS.dao.CrudDao;
import com.CBS.dao.UserDao;
import com.CBS.model.Product;
import com.CBS.model.User;

public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			CrudDao crud = new CrudDao (DBCon.getConnection());
			Product eProd = crud.getProduct(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProductForm.jsp");
		    request.setAttribute("product", eProd);
		    dispatcher.forward(request, response);     
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
