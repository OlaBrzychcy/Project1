<%@page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new product</title>
</head>
<body bgcolor="#D8CEF6">
	<h1>Add new product</h1>
	<fieldset>
		<center>

			<form action="query5check.jsp" method="post">
			<%

String k= request.getParameter("query");
String driver = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/BAZA1";
String dbuser = "admin";
String dbpassword = "admin";

Connection theConnection2 = null;
Connection theConnection3 = null;
Connection theConnection4 = null;
PreparedStatement theStatement = null;

Statement st2=null;
Statement st3=null;
Statement st4=null;

ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
ArrayList<String> lista=new ArrayList<String>();
ArrayList<String> lista2=new ArrayList<String>();
ArrayList<String> lista3=new ArrayList<String>();
try{  
    Class.forName(driver);
    
    theConnection2=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
    st2=theConnection2.createStatement();
    rs2=st2.executeQuery("SELECT * from TYPES");
    theConnection3=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
    st3=theConnection3.createStatement();
    rs3=st3.executeQuery("SELECT * from WAREHOUSES");
    theConnection4=DriverManager.getConnection(dbURL,dbuser,dbpassword); 
    st4=theConnection4.createStatement();
    rs4=st4.executeQuery("SELECT * from ORDERS");
  
	while(rs2.next()){
		lista.add(rs2.getString(2));
	}
	while(rs3.next()){
		lista2.add(rs3.getString(2));
	}
	while(rs4.next()){
		lista3.add(rs4.getString(1));
	}


}

catch(Exception e){
 System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
 
} %>

				<br />Product name:<input type="text" name="Products_name" /> <br />Price:<input
					type="text" name="Price" /> <br />
				<tr>
					<td>Type</td>
					<td><select name="ID_Types">
								<%
					for (int i=0;i<lista.size();i++){
						%><option value=<%=i+1 %>><%=lista.get(i) %></option><%
					}
					%>

					</select></td>
				</tr>
				<tr>
					<td>Warehouse</td>
					<td><select name="ID_Warehouses">
								<%
					for (int i=0;i<lista2.size();i++){
						%><option value=<%=i+1 %>><%=lista2.get(i) %></option><%
					}
					%>

					</select></td>
				</tr>
				<tr>
					<td>Order</td>
					<td><select name="ID_Orders">
							<option value="0">-</option>
						

						<%
					for (int i=1;i<lista3.size();i++){
						%><option value=<%=i %>>Order <%=lista3.get(i) %></option><%
					}
					%>
                    
					</select></td>
				</tr>
				<tr>
					<td><br />
					<input type="submit" value="Submit" name="bt" /></td>
				</tr>
			</form>
		</center>
	</fieldset>
</body>
</html>