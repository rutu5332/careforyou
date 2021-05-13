
package upadmin;


import java.io.IOException;
//import java.src.main.resources.Storage.data;
import Storage.Data;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.Part;
import java.io.File;
import java.util.Date;


 
  @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
		  maxFileSize = 1024 * 1024 * 10 ,
		  maxRequestSize = 1024 * 1024 * 50 )

/**
 * Servlet implementation class UploadServlet
 */
public class updoctor extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		String iid=request.getParameter("iDoctoId");
		 
  	  	int uid=Integer.parseInt(iid);
		
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
			String fname,lname,psw,mno,gen,address,email,bday,deg,exp,type;
			
			fname=request.getParameter("fname");
			lname=request.getParameter("lname");
			address=request.getParameter("Address");
			gen=request.getParameter("r1");
		
			email=request.getParameter("email");
			psw=request.getParameter("password");
		
			mno=request.getParameter("Mobile");
			bday=request.getParameter("birthdate");
			deg=request.getParameter("degree");
			exp=request.getParameter("Exp");
			type=request.getParameter("type");
			
		
			
			
			Data dt=new Data();
			
			dt.st=dt.cn.createStatement();
			
			
			Date d=new SimpleDateFormat("mm/dd/yyyy").parse(bday); 
            SimpleDateFormat s1=new SimpleDateFormat("yyyy-mm-dd");
            
            String bday2=s1.format(d);
            
           
			
		
			String sql_up="update doctorinfo_tbl SET vFirstName='"+fname+"',vLastName='"+lname+"',vGender='"+gen+"',vClinicAdd='"+address+"',vMobile='"+mno+"',vPassword='"+psw+"',vEmail='"+email+"',vFileName='"+filename+"',dBirthdate='"+bday2+"',vLicense='"+filename2+"',vDegree='"+deg+"',iExperience='"+exp+"',iWorkType='"+type+"' WHERE iDoctorId='"+uid+"' ";
			// String insert="insert into tbl_reg(Name,Gender,Date,Mno,Email,Psw) values('"+name+"','"+gen+"','"+date+"',"+Long.parseLong(mno) +",'" + eid + "','" + psw + "')";
			dt.st.executeUpdate(sql_up);
		
		//	response.sendRedirect("../main/webapp/book/demos.creative-tim.com/material-dashboard-pro/examples/tables/DoctorData.jsp");
			response.sendRedirect("book/demos.creative-tim.com/material-dashboard-pro/examples/tables/DoctorData.jsp");
			
			
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
