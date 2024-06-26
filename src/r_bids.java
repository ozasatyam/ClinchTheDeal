

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/r_bids")
@MultipartConfig(maxFileSize=169999999)
public class r_bids extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "F:\\pro\\onedrive-d\\imgs";
       
    String condition;
    String description;
	String city;
	String price;
	String doc;
	String name = null;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
	/*	condition = request.getParameter("condition");
		PrintWriter out = response.getWriter();
		city = request.getParameter("city");
		doc = request.getParameter("doc");
		price = request.getParameter("price");*/
/*		out.print("city"+city);*/
			
			HttpSession s = request.getSession(false);
				String email = s.getAttribute("mail").toString();
		        if(ServletFileUpload.isMultipartContent(request)){
		                List<FileItem> multiparts = new ServletFileUpload(
		                                         new DiskFileItemFactory()).parseRequest(request);
	
		                for(FileItem item : multiparts){
		                    if(!item.isFormField()){
		                         name = new File(item.getName()).getName();
		                         item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
		                    }
		                    else
		                    {
		                    	 String items = item.getFieldName();
		                    	 
		                    	     if(items.equals("description"))
		                    	     {
		                    	    	
		                    	    	 description = item.getString();
		                    	    	 out.print(description);
		                    	     }
		                    	     if(items.equals("city"))
		                    	     {
		                    	    	 city = item.getString();
		                    	     }
		                    	     if(items.equals("price"))
		                    	     {
		                    	    	 price = item.getString();
		                    	     }
		                    	     if(items.equals("condition"))
		                    	     {
		                    	    	 condition = item.getString();
		                    	     }	  
		                    }
		                }
		               request.setAttribute("message", name);
		               
		        }
				else
				{
		            request.setAttribute("message",
		                                 "Sorry this Servlet only handles file upload request");
	
		        }
				
				out.println("city="+description+"price="+price);
		        
		        
			 String query = "INSERT INTO `rev_seller`(`auc_id`, `mail`, `description`,  `photo`, `user_bid`, `city`,`condition`) VALUES (?,?,?,?,?,?,?)" ; 

			  Class.forName("com.mysql.jdbc.Driver");
			  String url = "jdbc:mysql://localhost:3306/clinch"; 
			  Connection con = DriverManager.getConnection(url,"root","");
			  PreparedStatement stmt = con.prepareStatement(query); 
			  stmt.setLong(1, 1); 
			  stmt.setString(2, email);
			  stmt.setString(3, description); 
			  stmt.setString(4, name);
			 stmt.setString(6, city); 
			 stmt.setString(5, price);
			 stmt.setString(7, condition);
			 int n =stmt.executeUpdate();
			 if(n!=0) { out.println("<script type=\"text/javascript\">");
			 out.println("alert('Detail Entered successfully');");
			 out.println("</script>"); response.sendRedirect("r_bid.jsp"); }
			 else {
			  out.println("creating new auction is failed"); } 
	} 
	catch (Exception e) 
	{	
		e.printStackTrace();
	}
	}

}
