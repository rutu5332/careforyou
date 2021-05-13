package com.lab;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Storage.Data;


public class LoginLab extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Data dt = new Data();

		
		try {
			dt.st = dt.cn.createStatement();
			String sql_menu = "select * from lab_tbl";
			dt.rs = dt.st.executeQuery(sql_menu);

			String id, psw;
			boolean flag = false;

			id = request.getParameter("Email");
			psw = request.getParameter("Password");
			
			while (dt.rs.next()) 
			{
				String lid=dt.rs.getString("iLabId");
				String eid = dt.rs.getString("vLabEmail");
				String img=dt.rs.getString("vImage");
				String lab_name = dt.rs.getString("vLabName");
				String psw1 = dt.rs.getString("vLabPassword");
				//String img=dt.rs.getString("vFileName");
				//out.println(eid);
				//out.println(psw1);
				if (eid.equals(id) && psw1.equals(psw)) {
					flag = true;
					System.out.println("loginlab");
					HttpSession session=request.getSession(true);
					session.setAttribute("labid", lid);
					session.setAttribute("lab", lab_name);
					session.setAttribute("type", "lab");
					session.setAttribute("email", eid);
					session.setAttribute("img", img);
					System.out.println("Lab Id :: "+lid);
					response.sendRedirect("Lab/index.jsp");
					
				}
			}
			if (flag != true) {
				String msg = "Invalid Username Or Password";
				response.sendRedirect("LoginLab.jsp?msg="+msg);
				//System.out.println(msg);
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
