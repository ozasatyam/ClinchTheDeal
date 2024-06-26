<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		
<html>
<head>
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
</style>
</head>

<body>
<%@ include file="header.jsp" %>
<%
	if(s.getAttribute("message")!=null)
	{
		out.println("<center><p style='color:red;'>"+session.getAttribute("message")+"</p></center>");
		session.removeAttribute("message");
	}
%>
<form action="createa.jsp">
<input type="submit" class="rcorners1" value="+ Auction" style="float: right;">
</form>
<%@ include file="footer.jsp"%>
</body>
</html>