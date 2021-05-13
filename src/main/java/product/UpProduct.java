package product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Storage.Data;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10 ,
maxRequestSize = 1024 * 1024 * 50 )

/**
 * Servlet implementation class AddProduct
 */
public class UpProduct extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String iid=request.getParameter("iProductId");
		 
  	  	int uid=Integer.parseInt(iid);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		Part part = request.getPart("image");
		
		String filename = extractFileName(part);
		
		
		String savepath = "C:\\eclipse-workspace\\careforu\\src\\main\\webapp\\assets\\img\\products" + File.separator + filename;
		
		//String savepath=request.getServletContext().getRealPath("/")+ "src\\main\\webapp\\images\\" + filename;
		
		
		 //File filesavedir = new File(savepath);

		part.write(savepath + File.separator);
		

		try 
		{
			String name,mfg,sp,units,measur,highlight,details,stock,brand,ing,code,type,status;
			
			name=request.getParameter("name");
			
			details=request.getParameter("details");
			stock=request.getParameter("stock");
		
			brand=request.getParameter("brand");
			ing=request.getParameter("ing");
			
			code=request.getParameter("code");
			type=request.getParameter("type");
			mfg=request.getParameter("mfg");
			sp=request.getParameter("sp");
			units=request.getParameter("units");
			measur=request.getParameter("measur");
			highlight=request.getParameter("highlight");
			status=request.getParameter("status");
			
			Data dt=new Data();
			
			dt.st=dt.cn.createStatement();
			
			
			String sql_up="update product_tbl SET vProductName='"+name+"',vProductDetails='"+details+"',iProductStock='"+stock+"',vProductBrand='"+brand+"',vProductImage='"+filename+"',vProductIngredients='"+ing+"',vProductCode='"+code+"',iProductCategory='"+type+"',dMfgPrice='"+mfg+"',dSellPrice='"+sp+"',iUnits='"+units+"',iMeasurement='"+measur+"',vHighlight='"+highlight+"' ,eStatus='"+status+"' WHERE iProductId='"+uid+"' ";
		//	String insert="insert into product_tbl(vProductName,vProductDetails,iProductStock,vProductBrand,vProductImage,vProductIngredients,vProductCode,iProductCategory,dMfgPrice,dSellPrice,iUnits,iMeasurement,vHighlight,eStatus) values('"+name+"','"+details+"','"+stock+"','"+brand+"','"+filename+"','"+ing+"','"+code+"','"+type+"','"+mfg+"','"+sp+"','"+units+"','"+measur+"','"+highlight+"','"+status+"')";
			dt.st.executeUpdate(sql_up);
		
		//	response.sendRedirect("../main/webapp/book/demos.creative-tim.com/material-dashboard-pro/examples/tables/DoctorData.jsp");
			response.sendRedirect("book/demos.creative-tim.com/material-dashboard-pro/examples/tables/ProductData.jsp");
			
			
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


