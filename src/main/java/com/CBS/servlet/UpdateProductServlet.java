package com.CBS.servlet;

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
import com.CBS.model.Product;

/**
 * Servlet implementation class UpdateProductServlet
 */
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String image = request.getParameter("image");
 
        Product newProd = new Product();
        newProd.setId(id);
        newProd.setName(name);
        newProd.setPrice(price);
        newProd.setStock(stock);
        newProd.setImage(image);
        
        try {
        	CrudDao crud = new CrudDao (DBCon.getConnection());
            if (crud.updateProduct(newProd)) {
            	response.sendRedirect("ProductList.jsp");
            } else {
            	response.sendRedirect("ProductList.jsp");
            }
            
        } catch (Exception e) {
        	e.printStackTrace();
			// TODO: handle exception
		}
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
