

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

import org.apache.jasper.tagplugins.jstl.core.Out;


@WebServlet("/Bid")
public class Bid extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Bid() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out = response.getWriter();
			String p = request.getParameter("price");
			HttpSession s11 = request.getSession(false);
			String m = s11.getAttribute("mail").toString();
			Class.forName("com.mysql.jdbc.Driver");
			String id = s11.getAttribute("id").toString();
			HttpSession qq = request.getSession();
			qq.setAttribute("up", p);
			String url = "jdbc:mysql://localhost:3306/clinch";
			String q = "UPDATE `fwd_detail` SET `uprice`='"+p+"' WHERE auc_id='"+id+"';";
			Connection  con = DriverManager.getConnection(url,"root","");
			PreparedStatement stmt = con.prepareStatement(q);
			int n = stmt.executeUpdate();
			if(n!=0) {
				response.sendRedirect("bidding.jsp");
			}
			else {
				out.println("SOmething went wrong");
			}
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
