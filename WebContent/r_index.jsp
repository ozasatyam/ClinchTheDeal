<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ include file="header.jsp" %>
    <%
	if(s.getAttribute("message")!=null)
	{
		out.println("<center><p style='color:red;'>"+session.getAttribute("message")+"</p></center>");
		session.removeAttribute("message");
	}
%>
    <%
String eid = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/clinch";
String database = "test";
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

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.rcorners1 {
  border-radius: 25px;
  background: #1accfd;
  padding: 12px; 
  width: 110px;
  height: 50px; 
}

.link { cursor: pointer;color:black; } /* CSS link color (red) */
.link:hover { color: #337ab7; } /* CSS link hover (green) */
</style>
</head>
<body>


	<div class="side-bar col-md-3">
				<div class="search-hotel">
					<h3 class="agileits-sear-head">Search Here..</h3>
					<form action="#" method="post">
						<input type="search" placeholder="Product name..." name="search" required="">
						<input type="submit" value=" ">
					</form>
				</div> </div>
<div class="agileinfo-ads-display col-md-9">
				<div class="wrapper">
	 <div class="product-sec1">
	 <div class="table-responsive">    
				 <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">TENDER DESCRIPTION</th>
      <th scope="col">Maximum Price</th>
      
      <th scope="col">DUE DATE</th> 
    </tr>
  </thead>
   <%
					 try{
						 connection = DriverManager.getConnection(connectionUrl, userid, password);
						 statement=connection.createStatement();
						 String sql ="select * from rev_auc_info where status='continue'";
						 resultSet = statement.executeQuery(sql);
						 while(resultSet.next()){ 
						%>
  <tbody>
    <tr>
      <td scope="row"><a href="r_productinfo.jsp?id=<%=resultSet.getString("auc_id")%> " class="link"><h4> <%=resultSet.getString("auc_id")%>  <%=resultSet.getString("item_name")%>:</h4>  <%description=resultSet.getString("description");if(description.length()<200){out.print(description);}else{out.print(description.substring(0,200).concat(" ...."));}%> </th>
     </a> <td class="text-secondary"><%=resultSet.getString("init_price")%> </td>
      
      <td class="text-secondary"><%=resultSet.getString("date")%> </td>
    </tr><% }}catch(Exception e){out.print(e);} %>
    
  </tbody>
</table>		
						</div></div></div></div>
						

</body>
</html>