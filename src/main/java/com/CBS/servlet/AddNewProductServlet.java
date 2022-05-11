package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.CBS.connection.DBCon;
import com.CBS.dao.CrudDao;
import com.CBS.dao.CrudDao;
import com.CBS.dao.ProductDao;
import com.CBS.model.Product;

/**
 * Servlet implementation class AddNewProductServlet
 */
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddNewProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		double price = Double.parseDouble(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String image = request.getParameter("image");
		
		Product newProd = new Product();
		newProd.setName(name);
		newProd.setPrice(price);
		newProd.setStock(stock);
		newProd.setImage(image);
		
		try {
			CrudDao crud = new CrudDao (DBCon.getConnection());
			if (crud.insertProduct(newProd)) {
				String message = "Product Added Successfully";
				request.setAttribute("message", message);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProductList.jsp");
				dispatcher.forward(request, response);
			} else {
				String message1 = "Product was not added to the website";
				request.setAttribute("message1", message1);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProductList.jsp");
				dispatcher.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
