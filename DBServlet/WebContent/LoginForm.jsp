  <%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Login Form</title> 
    </head> 
    <body bgcolor="#D8CEF6"> 
        <h1>Login Page</h1> 
        <fieldset>
           <center>
      <legend><h2>Sign in Details</h2> </legend>
        <form action="LoginCheck.jsp" method="post"> 

            <br/>Username:<input type="text" name="User_name"/> 
            <br/>Password:<input type="password" name="Password"/> 
            <br/>
            <tr>
              <td>User type</td>
            <td>
                <select name="ID_User_Type">
                    <option value="1">admin</option>
                    <option value="2">warehouseman</option>
                    <option value="3">salesman</option>
                </select>
            </td>
            </tr>
            <tr>
                <td>
            <br/><input type="submit" value="Submit" name="bt"/> 
                </td>
            </tr>
        </form> 
    </center> 
                </fieldset>
        </body> 
        </html>