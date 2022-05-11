package com.CBS.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.oracle.wls.shaded.org.apache.xalan.lib.Redirect;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 100)
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServletOutputStream os;
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			String folderName = "images";
			String uploadPath = new File ("src/main/webapp/" + folderName).getAbsolutePath();
			File dir = new File (uploadPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			Part filePart = request.getPart("file");
			String fileName = filePart.getSubmittedFileName();
			String path = folderName + File.separator + fileName;
			InputStream is = filePart.getInputStream();
			Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
			
			String message = "Image was added successfully";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProductList.jsp"); 
			dispatcher.forward(request,response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		
//		String filePart1 = "../webapp/images";
//		File file = new File(filePart1);
//		String Path = file.getPath();
//		System.out.println(Path);
		
		
		/*
		 * Part filePart = request.getPart("file"); String fileName =
		 * filePart.getSubmittedFileName(); for (Part part : request.getParts()) {
		 * part.write(Path + fileName); } String message =
		 * "Image was added successfully"; request.setAttribute("message", message);
		 * RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("ProductList.jsp"); dispatcher.forward(request,
		 * response);
		 */
	}
}
