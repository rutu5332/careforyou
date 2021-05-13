package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.Part;
import java.io.File;


  @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
		  maxFileSize = 1024 * 1024 * 10 ,
		  maxRequestSize = 1024 * 1024 * 50 )

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		Part part = request.getPart("fnm");
		String filename = extractFileName(part);
 		String savepath = "C:\\eclipse-workspace\\rutu_proj\\src\\main\\webapp\\assets\\img\\user" + File.separator + filename;
		//String savepath=request.getServletContext().getRealPath("/")+ "src\\main\\webapp\\images\\" + filename;
		System.out.println("Path :: "+savepath);
		System.out.println("real path :: " +request.getServletContext().getRealPath("/"));
		 //File filesavedir = new File(savepath);

		part.write(savepath + File.separator);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tbl_register", "root", "root");
			PreparedStatement pst = cn.prepareStatement("insert into image_tbl(fname,lname,filename,path) values(?,?,?,?)");
			//pst.setInt(1, id);
			
			pst.setString(3, filename);
			pst.setString(4, savepath);
			pst.executeUpdate();
			out.println("<h1>Image Uploaded Sucessfully...</h1>");
			//response.encodeRedirectURL("index.jsp?filename");
			out.println("<a href='img.jsp'>Show</a>" );
		} catch (Exception ex) {
			out.println(ex);
		}

		// doGet(request, response);

	}

	private String extractFileName(Part part) throws IOException, NullPointerException {
		try {
			String contentDisp = part.getHeader("content-disposition");
			//System.out.println(contentDisp);   // output :: form-data; name="fl"; filename="logo.png"
			String[] items = contentDisp.split(";");
			for (String s : items) {
				if (s.trim().startsWith("filename")) {
					//System.out.println("file :: " + s.substring(s.indexOf("=") + 2, s.length() - 1));  // output :: file :: logo.png
					return s.substring(s.indexOf("=") + 2, s.length() - 1);
				}
			}
			return "";
		} catch (Exception e) {
			System.out.println(e);
		}
		return "";
	}

}
