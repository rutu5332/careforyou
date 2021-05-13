package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import Storage.Data;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Data dt = new Data();

		String pg;
		try {
			dt.st = dt.cn.createStatement();

			String sql_menu = "select * from signup_tbl";
			dt.rs = dt.st.executeQuery(sql_menu);

			String id, psw;
			boolean flag = false;

			id = request.getParameter("Email");
			psw = request.getParameter("Password");
			pg=request.getParameter("page");
			
			while (dt.rs.next()) {
				String uid=dt.rs.getString("iSignupId");
				String eid = dt.rs.getString("vEmail");
				String user_name = dt.rs.getString("vUserName");
				String psw1 = dt.rs.getString("vPassword");
				String img=dt.rs.getString("vImage");
				out.println(eid);
				out.println(psw1);
				if (eid.equals(id) && psw1.equals(psw)) {
					flag = true;
					System.out.println(pg);
					HttpSession session=request.getSession(true);
					session.setAttribute("uid", uid);
					session.setAttribute("user", user_name);
					session.setAttribute("type", "user");
					session.setAttribute("email", eid);
					session.setAttribute("img", img);
					//System.out.println("Id :: "+uid);
					response.sendRedirect(pg);
				}
			}
			if (flag != true) {
				String msg = "Invalid Username Or Password";
				response.sendRedirect("Login.jsp?msg");
				System.out.println(msg);
			}

		}

		catch (Exception ex) {
			out.println(ex);
		}

	}

}
