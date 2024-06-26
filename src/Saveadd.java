

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Saveadd")
public class Saveadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Saveadd() {
        super();
        
    }
    String name;
    String phone;
    String add;
    String city;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		try 
		{
			name = request.getParameter("name");
			phone = request.getParameter("number");
			add = request.getParameter("add");
			city = request.getParameter("city");
			HttpSession x = request.getSession(false);
			String mail = (String) x.getAttribute("mail");
			String query = "INSERT INTO `address`(`name`, `phone`, `add`, `city`, `mail`, `pyst`)VALUES (?,?,?,?,?,?)";
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/clinch2";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, name);
			stmt.setString(2, phone);
			stmt.setString(3, add);
			stmt.setString(4, city);
			stmt.setString(5, mail);
			stmt.setString(6, "false");
			int n = stmt.executeUpdate();
			if(n!=0)
			{
				response.sendRedirect("payment.jsp");
			}
			else
			{
				out.println("<h1 style='color:red;'>Error</h1>");
			}
		} 
		catch (Exception e) 
		{	
			e.printStackTrace();
		}
	}

}
