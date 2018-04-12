
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
String ID_Products = request.getParameter("ID_Products");
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


try{  
    Class.forName(driver);
    theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
    st=theConnection.createStatement();
   	System.out.println(ID_Products);
    String updateTableSQL = "UPDATE PRODUCTS SET ID_Products='"+ID_Products+"',Product_name='"+product+"',Price='"+price+"',ID_Types='"+ID_Types+"',ID_Warehouses='"+ID_Warehouses+"',ID_Orders='"+ID_Orders+"' WHERE ID_Products='"+ID_Products+"'";
    		
   // theStatement = theConnection.prepareStatement(updateTableSQL);
  
    /*
    theStatement.setString(1,product);
    theStatement.setString(2, price);
    theStatement.setString(3, ID_Types);
    theStatement.setString(4, ID_Warehouses);
    theStatement.setString(5, ID_Orders);*/
    
    
    // execute insert SQL stetement
   st.executeUpdate(updateTableSQL);
    
    	 
   
	   
   
}

catch(Exception e){
    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
    
} 
response.sendRedirect("query3.jsp");
%>

</body>
</html>