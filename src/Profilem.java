

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


@WebServlet("/Profilem")
public class Profilem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Profilem() {
        super();
        // TODO Auto-generated constructor stub
    }
    String old;
	String newp;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		old = request.getParameter("opwd");
		newp = request.getParameter("npwd");
		HttpSession session=request.getSession(false);
		try 
		{
		String m = session.getAttribute("mail").toString();
		String op = session.getAttribute("pwd").toString();
		if(op.equals(old))
		{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/clinch2";
		Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("UPDATE `user_info` SET `password`=? where mail=?");
			ps.setString(1, newp);
			ps.setString(2, m);
			int n = ps.executeUpdate();
			if(n!=0)
			{
				out.println("Password has been changed!!");
			}
			else {
				out.println("Something strange!");
			}
		}
		
		else {
			out.print("Old password doesn't matched");
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		}

}
