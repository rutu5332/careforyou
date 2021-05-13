package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import Storage.Data;
import javax.servlet.http.Part;
import java.io.File;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
				maxFileSize = 1024 * 1024 * 10 ,
				maxRequestSize = 1024 * 1024 * 50 )

public class UploadUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			Part part = request.getPart("fnm");
			String filename = extractFileName(part);
			
	 		String savepath ;
	 		savepath="C:\\eclipse-workspace\\careforyou\\src\\main\\webapp\\assets\\img\\user"+ File.separator + filename;
			part.write(savepath + File.separator);
			
			HttpSession session=request.getSession(false);
			
			try {
				
				//int id=Integer.parseInt(session.getAttribute("uid").toString());
				int id=0;
				
				if(session.getAttribute("uid") != null)
					id=Integer.parseInt(session.getAttribute("uid").toString());
				
				Data dt=new Data();
				dt.st=dt.cn.createStatement();
				//System.out.println(filename);
				String update = "Update signup_tbl set vImage='"+filename+"' where iSignupId=" + id;
				dt.st.executeUpdate(update);
				session.setAttribute("img", filename);
				System.out.println("Image Uploaded Sucessfully...");
				response.sendRedirect("profile.jsp");
				
			} catch (Exception ex) {
				out.println(ex);
			}
		}
		catch (Exception ex) {
			String msg="please select photo first";
			System.out.println(msg);
			response.sendRedirect("profile.jsp?msg="+msg);
		}
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
