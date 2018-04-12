<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body bgcolor="#D8CEF6">
<center>
<form action="LoginManager"method="post"></form>
 <form  name ="queryForm6" action="query5.jsp" method="post">
        <button name  = "query"  type="submit" value="Submit" name="bt"> <h2>Add new product</h2></button></form></br>

<form  name ="queryForm7" action="query6.jsp" method="post">
        <button name  = "query"  type="submit" value="Submit" name="bt"> <h2>Add new order</h2></button></form></br>


<form name="queryForm" action="UsersServlet" method="post">
 
       
       
        <form name ="queryForm3" action ="UsersServlet" method = "post">
        <button name ="query" type ="submit"
         value="select * from Users "><h2>Show all Users</h2></button>
         </form></br>
       
         <form name ="queryForm5" action ="ProductsServlet" method = "post">
        <button  name ="query" type ="submit"
         value="select * from products"><h2>Show all Products</h2></button>
         </form></br>
         <form  name ="queryForm1" action="OrdersServlet" method="post">
        <button name  = "query"  type="submit" value="select * from Orders"> <h2>Show all Orders</h2></button></form></br>
         <form  name ="queryForm4" action="InvoicesServlet" method="post">
        <button name  = "query"  type="submit" value="select * from Invoices"> <h2>Show all Invoices</h2></button></form></br>
       <form  name ="queryForm6" action="WarehousesServlet" method="post">
        <button name  = "query"  type="submit" value="select * from Warehouses"> <h2>Show all Warehouses</h2></button></form></br>
    </form></center>
</body>
</html>