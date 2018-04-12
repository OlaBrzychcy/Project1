<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%> 
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new order</title>
</head>
<body>

 <%
 
 String driver = "com.mysql.jdbc.Driver";
 String dbURL = "jdbc:mysql://localhost:3306/BAZA1";
 String dbuser = "admin";
 String dbpassword = "admin";
 Connection theConnection = null;
 PreparedStatement theStatement = null;
 Statement st=null;
 ResultSet resultSet=null;
 int k=0;
 String date;
 GregorianCalendar date1 = new GregorianCalendar();
 int day,month,year;
	
 try{  
	    Class.forName(driver);
	    theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
	    st=theConnection.createStatement();
	    resultSet = st.executeQuery("select count(*) from Orders");
	    while (resultSet.next()) {
	   	k=k+resultSet.getInt(1);
	   	 }
	    
	    day = date1.get(Calendar.DAY_OF_MONTH);
        month = date1.get(Calendar.MONTH)+1;
        year = date1.get(Calendar.YEAR);
	    date=""+day+"."+month+"."+year+"";
	    System.out.println(month);
	    String insertTableSQL = "INSERT INTO ORDERS"
	    		+ "(ID_Orders,Date) VALUES"
	    		+ "(?,?)";
	    theStatement = theConnection.prepareStatement(insertTableSQL);
	    theStatement.setString(1,""+k);
	    theStatement.setString(2,date);
	    
	    
	    // execute insert SQL stetement
	   theStatement.executeUpdate();
	    
	    	 
	   
		   
	    //theStatement = theConnection.prepareStatement("insert into Products(ID_Products,Product_name,Price,ID_Types,ID_Warehouse,ID_Orders) Values ("+product_id+","+product+","+price+","+ID_Types+","+ID_Warehouses+","+ID_Orders+")");
	    //theStatement.executeQuery();

	}
	catch(Exception e){
	    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
	    
	} 
	response.sendRedirect("query4.jsp");
	
 
 %>


</body>
</html>