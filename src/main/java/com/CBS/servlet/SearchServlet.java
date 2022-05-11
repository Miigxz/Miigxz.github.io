package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.CBS.connection.DBCon;
import com.CBS.dao.ProductDao;
import com.CBS.model.Product;

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String txtSearch = request.getParameter("search");
		
		try {
			ProductDao productDao = new ProductDao(DBCon.getConnection());
			List<Product> products = productDao.getSearchProduct(txtSearch);
			System.out.print(productDao.getSearchProduct(txtSearch));
			request.setAttribute("listP", products);
			
			request.getRequestDispatcher("searchProducts.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
