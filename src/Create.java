

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Create() {
        super();
        // TODO Auto-generated constructor stub
    }

    		String title;
    		String detail;
    		String price;
    		
    		String date;
    	
    	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			HttpSession s = request.getSession(false);
			String email = s.getAttribute("mail").toString();
			title = request.getParameter("title");
			detail = request.getParameter("detail");
			date = request.getParameter("date");
			price = request.getParameter("price");
			String query = "INSERT INTO `rev_auc_info`( `mail`, `item_name`,  `description`, `date`, `status`,`init_price`) VALUES (?,?,?,?,?,?)";
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/clinch";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setString(1, email);
			stmt.setString(2, title);
			stmt.setString(3, detail);
		
			stmt.setString(4, date);
			stmt.setString(5, "continue");
			stmt.setString(6, price);
			
			
			int n = stmt.executeUpdate();
			if(n!=0)
			{
				//HttpSession session=request.getSession();  
		        //session.setAttribute("mail",mail);
				response.sendRedirect("r_index.jsp");
			}
			else
			{
				out.println("creating new auction is failed");
			}
		} 
		catch (Exception e) 
		{	
			e.printStackTrace();
		}
	}

}
