<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Check</title> 
        </head> 

<body> 
        <%
        String username = request.getParameter("User_name");
        String password = request.getParameter("Password");
        String ID_User_Type = request.getParameter("ID_User_Type");
        String driver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/BAZA1";
        String dbuser = "admin";
        String dbpassword = "admin";
        Connection theConnection = null;
        PreparedStatement theStatement = null;
		//String type=null;

            try{  
                Class.forName(driver);
                theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword);  
                theStatement = theConnection.prepareStatement("select * from USERS where User_name=? and Password=? and ID_User_Type=?");
                theStatement.setString(1,request.getParameter("User_name"));
                theStatement.setString(2,request.getParameter("Password"));
                theStatement.setString(3,request.getParameter("ID_User_Type"));
                ResultSet theResult = theStatement.executeQuery();
                //type=theResult.getString("ID_User_Type");
                if((theResult.next())){
                	System.out.println(theResult.getString(4));
                    System.out.println("Success");
                    if("1".equalsIgnoreCase(theResult.getString(4).trim())){
                    response.sendRedirect("query2.jsp");
                    }
                    else if("2".equalsIgnoreCase(theResult.getString(4).trim())){
                        response.sendRedirect("query3.jsp");
                        }
                    else if("3".equalsIgnoreCase(theResult.getString(4).trim())){
                        response.sendRedirect("query4.jsp");
                        }
                  	
                }
              
                else{
                    System.out.println("Failed");
                	response.sendRedirect("LoginForm.jsp");
                }
            }
                catch(Exception e){
                    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                } 
        %>
</body>
</html>