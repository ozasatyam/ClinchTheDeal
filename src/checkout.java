

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statement statement = null;

   
	String mail;
	String auc_id;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			mail = request.getParameter("mail");
		auc_id = request.getParameter("id");
		
		out.println(auc_id);
		String query = "UPDATE `rev_auc_info` SET `winner` = '"+mail+"',status='completed' WHERE `auc_id` = "+auc_id;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/clinch";
		Connection con = DriverManager.getConnection(url,"root","");
		statement=con.createStatement();
		int s=statement.executeUpdate(query);
		if(s>0)
		{
			response.sendRedirect("checkout.jsp");
		}
		else{
			response.sendRedirect("checkout.jsp");
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
