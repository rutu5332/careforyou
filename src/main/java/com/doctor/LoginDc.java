package com.doctor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Storage.Data;

public class LoginDc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Data dt = new Data();

		
		try {
			dt.st = dt.cn.createStatement();

			String sql_menu = "select * from doctorinfo_tbl";
			dt.rs = dt.st.executeQuery(sql_menu);

			String id, psw;
			boolean flag = false;

			id = request.getParameter("Email");
			psw = request.getParameter("Password");
			
			while (dt.rs.next()) 
			{
				String did=dt.rs.getString("iDoctorId");
				String eid = dt.rs.getString("vEmail");
				String img=dt.rs.getString("vFileName");
				String doc_name = dt.rs.getString("vFirstName") + " "+dt.rs.getString("vLastName");
				String psw1 = dt.rs.getString("vPassword");
				//String img=dt.rs.getString("vFileName");
				out.println(eid);
				out.println(psw1);
				if (eid.equals(id) && psw1.equals(psw)) {
					flag = true;
					System.out.println("logindc");
					HttpSession session=request.getSession(true);
					session.setAttribute("docid", did);
					session.setAttribute("doctor", doc_name);
					session.setAttribute("type", "doctor");
					session.setAttribute("email", eid);
					session.setAttribute("img", img);
					System.out.println("Docter Id :: "+did);
					response.sendRedirect("Doctor/index.jsp");
					
				}
			}
			if (flag != true) {
				String msg = "Invalid Username Or Password";
				response.sendRedirect("LoginDoctor.jsp?msg");
				System.out.println(msg);
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
