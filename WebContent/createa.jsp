<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>

<%
					HttpSession s1 = request.getSession(false);
					if(s1!=null && s1.getAttribute("fname")!=null)
					{
					}
					else
					{
						HttpSession ssn = request.getSession(false);
						ssn.setAttribute("message", "Please Login");
						response.sendRedirect("r_index.jsp");
					}
					
%>
<%@ include file="header.jsp" %>
 
<!-- <h3 class="bars" style="margin-left: 20px;margin-top: 20px;">Auction details</h3>
<div style="border-style: solid;border-width: 1px;margin-left: 20px; margin-right: 450px"> 
<div class="input-group w3_w3layouts" style="margin-left: 70px; margin-top: 20px">
				<span class="input-group-addon" id="basic-addon1">Product Name</span>
				<input type="text" class="form-control" placeholder="Title of the item" aria-describedby="basic-addon1" style="width: 350px" ></input>
				<span class="input-group-addon" id="basic-addon1">Product Name</span>
				<input type="text" class="form-control" placeholder="Title of the item" aria-describedby="basic-addon1" style="width: 350px" ></input>
</div> -->
<div class="privacy">
		<div class="container">
<div class="checkout-left">
				<div class="address_form_agile">
					<h4>Requirement Details</h4>
					<form action="Create" method="post" class="creditly-card-form agileinfo_form">
						<div class="creditly-wrapper wthree, w3_agileits_wrapper">
							<div class="information-wrapper">
								<div class="first-row">
									<div class="controls">
										<input class="billing-address-name" type="text" name="title" placeholder="Item Title" required="">
									</div>
									<div class="w3_agileits_card_number_grids">
										
									<div class="w3_agileits_card_number_grids">
										<div class="w3_agileits_card_number_grid_left">
											<div class="controls">
												<input type="text" placeholder="Description of item" name="detail" required="">
											</div>
										</div>
										<div class="w3_agileits_card_number_grids">
										<div class="w3_agileits_card_number_grid_left">
											<div class="controls">
												<input type="number" placeholder="Maxmimum Price of item" name="price" required="">
											</div>
										</div>
										
										<div class="clear"> </div>
									</div>
									
									<div>
											<div class="controls">
												<input type="text" placeholder="Envent end date" id="datepicker" name="date" required="">
											</div>
										</div>
									<div>
											
										</div>
									
								</div>
								<button class="submit check_out">Submit</button>
							</div>
						</div>
						
					</form>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>