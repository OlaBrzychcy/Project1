
<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%> 
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String product = request.getParameter("Products_name");
String price = request.getParameter("Price");
String ID_Types = request.getParameter("ID_Types");
String ID_Warehouses = request.getParameter("ID_Warehouses");
String ID_Orders = request.getParameter("ID_Orders");

String driver = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/BAZA1";
String dbuser = "admin";
String dbpassword = "admin";
Connection theConnection = null;
PreparedStatement theStatement = null;
Statement st=null;
ResultSet resultSet=null;
int k=1;
try{  
    Class.forName(driver);
    theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
    st=theConnection.createStatement();
    resultSet = st.executeQuery("select count(*) from Products");
    while (resultSet.next()) {
	   	k=k+resultSet.getInt(1);
	   	 }
  
    String insertTableSQL = "INSERT INTO PRODUCTS"
    		+ "(ID_Products,Product_name,Price,ID_Types,ID_Warehouses,ID_Orders) VALUES"
    		+ "(?,?,?,?,?,?)";
    theStatement = theConnection.prepareStatement(insertTableSQL);
    theStatement.setString(1, ""+k);
    
    theStatement.setString(2,product);
    theStatement.setString(3, price);
    theStatement.setString(4, ID_Types);
    theStatement.setString(5, ID_Warehouses);
    theStatement.setString(6, ID_Orders);
    
    
    // execute insert SQL stetement
   theStatement.executeUpdate();
    
    	 
   
	   
   
}

catch(Exception e){
    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
    
} 
response.sendRedirect("query2.jsp");
%>

</body>
</html>