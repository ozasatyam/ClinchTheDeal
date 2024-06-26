<%@page import="com.sun.beans.util.Cache"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
   <%@ include file="header.jsp" %>
    <%  HttpSession s1 = request.getSession(false);
     if(s1==null || s1.getAttribute("fname")==null )
	{
		out.println("<script type=\"text/javascript\">");
	    out.println("alert('Please Login First!');");
	    out.println("location='r_index.jsp'");
	    out.println("</script>");
	
	}else{
              String email = s.getAttribute("mail").toString();%>
  			
     <%
String eid = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/clinch";
String userid = "root";
String password = "";
String description="";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
boolean redirect=false;

%>
   
   
    
    <div class="row">
    <div class="panel panel-default widget">
        <div class="panel-heading">
           
            <h3 class="panel-title text-center"  >
                User's Bid </h3>
        </div>
        <div class="panel-body">
        
            <ul class="list-group">
            
             <%

					 try{
						 connection = DriverManager.getConnection(connectionUrl, userid, password);
						 statement=connection.createStatement();
						 String sql ="SELECT * FROM `user_info`,`rev_seller`,`rev_auc_info` WHERE rev_auc_info.mail='"+email+"' and user_info.mail=rev_seller.mail and rev_seller.auc_id=rev_auc_info.auc_id order by user_bid";
						 resultSet = statement.executeQuery(sql);
						 
						 if(!resultSet.next()){ 
							out.print("No Bid Found");
						 }
						 else{%>
						 <form action="checkout" method="post">

                <li class="list-group-item">
                    <div class="row">
                        
                         <div class="col-xs-10 col-md-12">
                            <div>
                                <a href="#"><%=resultSet.getString("fname") %> <%=resultSet.getString("lname") %></a>
                                  
                                <div class="mic-info">
                                     <b>Bid:</b><%=resultSet.getString("user_bid")%>Rs 
                                </div>
                            </div><br>
                            <div class="comment-text">
                              <b>Description:</b><%=resultSet.getString("description")%>
                            </div><br>
                            <div class="comment-text">
                              <b>Condition:</b> <%=resultSet.getString("condition") %>
                            </div>
                            <div class="action">
							
                                  <a href='images/upload/<%=resultSet.getString("photo") %>' download><button type="button" class="btn btn-primary btn-sm" title="Downalod User Uploaded images"><span >Download Images</span></button></a>
                               
							<button type="submit" class="btn btn-danger btn-sm " title="Go..">
							
									
                                    <span >Buy</span>
                                </button>
                              <input type="hidden" name="mail" value='<%=resultSet.getString(7)%>'>
                              <input type="hidden" name="id" value='<%=resultSet.getString("auc_id")%>'> 
							
                            </div>
                        </div>
                    </div>
                </li></form><%
						 while(resultSet.next()){ 	
				 %> <form action="checkout" method="post">
				 <li class="list-group-item">
                    <div class="row">
                            <div class="col-xs-10 col-md-12">
                            <div>
                                <a href="#"><%=resultSet.getString("fname") %> <%=resultSet.getString("lname") %></a>                               
                                <div class="mic-info">
                                     <b>Bid:</b><%=resultSet.getString("user_bid")%>Rs 
                                </div>
                            </div><br>
                            <div class="comment-text">
                              <b>Description:</b><%=resultSet.getString("description")%>
                            </div><br>
                            <div class="comment-text">
                              <b>Condition:</b> <%=resultSet.getString("condition") %>  
                                                 </div>
                             <div class="action">
							
                                   <a href='images/upload/<%=resultSet.getString("photo") %>' download><button type="button" class="btn btn-primary btn-sm" title="Downalod User Uploaded images"><span >Download Images</span></button></a>
                               
									<button type="Submit" class="btn btn-danger btn-sm " value="" title="Go..">
									
                                    <span >Buy</span>
                                </button>
                                <input type="hidden" name="mail" value='<%=resultSet.getString(7)%>'>
                              <input type="hidden" name="id" value='<%=resultSet.getString("auc_id")%>'> 
							
                            </div>
                        </div>
                    </div>
                </li>
                </form>
                <% } %>
            </ul>
            <a href="#" class="btn btn-primary btn-sm btn-block" role="button"><span class="glyphicon glyphicon-refresh"></span> More</a>
        <%}}catch(Exception e){out.print(e);}%>
        </div>
    </div>
</div>

</body>
</html><% }%>