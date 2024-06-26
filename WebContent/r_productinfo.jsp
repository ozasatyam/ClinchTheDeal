<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if(request.getParameter("id") != null && !request.getParameter("id").equals(""))         {     
    String postVar = request.getParameter("id"); 
} else {
    response.sendRedirect("r_index.jsp");     
}
	String id = request.getParameter("userid");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/clinch";
	String database = "test";
	String userid = "root";
	String password = "";
	String description="";
	 String m;
	 m= request.getParameter("id");
	try
	{
		Class.forName(driver);
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		
<%@page import="java.sql.*"%><html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinch The DEal</title>
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
<%@ include file="header.jsp" %>
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
			<%
				try
   				{
					
					
					 
					 {
					 connection = DriverManager.getConnection(connectionUrl, userid, password);
					 statement=connection.createStatement();
					 String sql ="select * from rev_auc_info where auc_id='"+m+"';";
					 resultSet = statement.executeQuery(sql);
					 while(resultSet.next())
					 { 
						 
							%>
    						<tr>
      							<td scope="col" style="width: 200px!important">
      								<b>
      									<span>seller's Mail :</span>
      								</b>
      							</td>
      							<td scope="row">
      								<%=resultSet.getString("mail")%>
      							</td>
    						</tr>
    						<tr>
      							<td scope="col" style="width: 185px!important">
      								<b>
      									<span>Item Name :</span>
      								</b>
      							</td>
      							<td scope="row">
      								<%=resultSet.getString("item_name")%>
      							</td>
    						</tr>
    						<tr>
      							<td scope="col" style="width: 185px!important">
      								<b>
      									<span>Description :</span>
      								</b>
      							</td>
      							<td scope="row">
      								<%description=resultSet.getString("description");if(description.length()<200){out.print(description);}else{out.print(description.substring(0,200).concat(" ...."));}%>
      							</td>
    						</tr>
    						<tr>
      							<td scope="col" style="width: 185px!important">
      								<b>
      									<span>Initial Price :</span>
      								</b>
      							</td>
      							<td scope="row"><%=resultSet.getString("init_price")%></td>
    						</tr>
    						<tr>
      							<td scope="col" style="width: 185px!important">
      								<b>
      									<span>Last Date :</span>
      								</b>
      							</td>
      							<td scope="row"><%=resultSet.getString("date")%> </td>
    						</tr>
    						
				<% }}}
   					catch(Exception e){out.print(e);} %>
</table>		<a class="button2" href="r_bid.jsp?id=<%=m%>">Bid Now </a>
						</div></div></div></div>

</body>
</html>