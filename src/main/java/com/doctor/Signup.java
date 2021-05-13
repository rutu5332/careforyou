package com.doctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import javax.servlet.http.Part;
import java.io.File;
import Storage.Data;


  @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
		  maxFileSize = 1024 * 1024 * 10 ,
		  maxRequestSize = 1024 * 1024 * 50 )

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Part part = request.getPart("image");
		Part part2 = request.getPart("license");
		String filename = extractFileName(part);
		String filename2 = extractFileName(part2);
		
 		String savepath = "C:\\eclipse-workspace\\careforu\\src\\main\\webapp\\assets\\img\\doctors" + File.separator + filename;
 		String savepath2 = "C:\\eclipse-workspace\\careforu\\src\\main\\webapp\\assets\\img\\doctors" + File.separator + filename2;
		//String savepath=request.getServletContext().getRealPath("/")+ "src\\main\\webapp\\images\\" + filename;
		
		
		 //File filesavedir = new File(savepath);

		part.write(savepath + File.separator);
		part2.write(savepath2 + File.separator);

		try 
		{
			String fname,lname,psw,mno,gen,address,email,bday,deg,exp,type,fees,doc_name,did="";
			
			fname=request.getParameter("fname");
			lname=request.getParameter("lname");
			address=request.getParameter("Address");
			gen=request.getParameter("r1");
			doc_name=fname + " "+lname;			
			email=request.getParameter("Email");
			psw=request.getParameter("Password");
			fees=request.getParameter("fees");
			mno=request.getParameter("Mobile");
			bday=request.getParameter("birthdate");
			deg=request.getParameter("degree");
			exp=request.getParameter("Exp");
			type=request.getParameter("type");
			
			Data dt=new Data();
			
			dt.st=dt.cn.createStatement();
		
			String insert="insert into doctorinfo_tbl(vFirstName,vLastName,vGender,vClinicAdd,vMobile,vPassword,vEmail,vFileName,dBirthdate,vLicense,vDegree,iExperience,iWorkType,iFees) values('"+fname+"','"+lname+"','"+gen+"','"+address+"','"+mno+"','"+psw+"','"+email+"','"+filename+"','"+bday+"','"+filename2+"','"+deg+"','"+exp+"','"+type+"',"+ fees+ ")";
			// String insert="insert into tbl_reg(Name,Gender,Date,Mno,Email,Psw) values('"+name+"','"+gen+"','"+date+"',"+Long.parseLong(mno) +",'" + eid + "','" + psw + "')";
			dt.st.executeUpdate(insert);
			
			String select="select iDoctorId from doctorinfo_tbl";
			dt.rs=dt.st.executeQuery(select);
			while(dt.rs.next())
			{
				did=dt.rs.getString("iDoctorId");
			}
			
			System.out.println("logindc");
			HttpSession session=request.getSession(true);
			session.setAttribute("docid", did);
			session.setAttribute("doctor", doc_name);
			session.setAttribute("type", "doctor");
			session.setAttribute("email", email);
			session.setAttribute("img", filename);
			System.out.println("Doctor Id :: "+did);
		
			response.sendRedirect("doctors/Time.jsp");
			
		} 
		catch (Exception ex)
		{
			out.println(ex);
		}
	}
	
	private String extractFileName(Part part) throws IOException, NullPointerException
	{
		try 
		{
			String contentDisp = part.getHeader("content-disposition");
			//System.out.println(contentDisp);   // output :: form-data; name="fl"; filename="logo.png"
			String[] items = contentDisp.split(";");
			for (String s : items)
			{
				if (s.trim().startsWith("filename")) 
				{
					//System.out.println("file :: " + s.substring(s.indexOf("=") + 2, s.length() - 1));  // output :: file :: logo.png
					return s.substring(s.indexOf("=") + 2, s.length() - 1);
				}
			}
			return "";
		} catch (Exception e)
		{
			System.out.println(e);
		}
		return "";
	}

}
