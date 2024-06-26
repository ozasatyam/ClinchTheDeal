

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String fname;
	String pass;
	String mail;
	String lname;
	String mob;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		try 
		{
			fname = request.getParameter("fname");
			pass = request.getParameter("pwd");
			mail = request.getParameter("mail");
			lname = request.getParameter("lname");
			mob = request.getParameter("mobile");
			String query = "INSERT INTO `user_info`(`fname`, `lname`, `mail`, `mobile`, `password`) VALUES (?,?,?,?,?)";
		
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/clinch";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, fname);
			stmt.setString(2, lname);
			stmt.setString(3, mail);
			stmt.setString(4, mob);
			stmt.setString(5, pass);
			int n = stmt.executeUpdate();
			if(n!=0)
			{
				//HttpSession session=request.getSession();  
		        //session.setAttribute("mail",mail);
				response.sendRedirect("target.jsp");
			}
			else
			{
				out.println("creating new user is failed");
			}
		} 
		catch (Exception e) 
		{	
			
			e.printStackTrace();
			out.print(e);
		}
	
	}

}
