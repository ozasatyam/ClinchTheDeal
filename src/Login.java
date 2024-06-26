

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String uname;
	String pass;
	String mail;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			mail = request.getParameter("mail");
			pass = request.getParameter("pwd");
			String query = "select * from user_info where mail=? and password=?;";
			PrintWriter out = response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/clinch";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, mail);
			stmt.setString(2, pass);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				String s = rs.getObject(1).toString();
				String sq = rs.getObject(3).toString();
				String p = rs.getObject(5).toString();
				HttpSession session=request.getSession(); 
				//session.setAttribute("in", 0);
		        session.setAttribute("fname",s);  
		        session.setAttribute("mail", sq);
		        session.setAttribute("pwd", p);
				response.sendRedirect("r_index.jsp");
		        out.println("Correct");
			}
			else
			{
				out.println("Username or Password is incorrect");
			}
		} 
		catch (Exception e) 
		{	
			e.printStackTrace();
		}
	
		
	}

}
