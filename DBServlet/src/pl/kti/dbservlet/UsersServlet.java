package pl.kti.dbservlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UsersServlet() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    
        try {
        	out.println("<title>Users</title>");
        	out.println("<body style='background-color:#D8CEF6;'>");
	        Class.forName("com.mysql.jdbc.Driver");
			
	        String query = request.getParameter("query");
	        out.println("<h1>Users</h1>");
	        
	        if (query.length() > 6 && 
				( 
					query.substring(0, 6).equalsIgnoreCase("insert") || 
					query.substring(0, 6).equalsIgnoreCase("update") ||
					query.substring(0, 6).equalsIgnoreCase("delete") 
				)
			) {
				Statement stmt = DBManager.getConnection().createStatement();
				stmt.executeUpdate(query);
				out.println("insert or update or delete DONE");
			    stmt.close();
			} else if ((query.length() > 6) && (query.substring(0,6).equalsIgnoreCase("select"))){
				Statement stmt = DBManager.getConnection().createStatement();
				ResultSet queryResult = stmt.executeQuery(query);
				ResultSetMetaData meta = queryResult.getMetaData();
	        	int colCount = meta.getColumnCount();
				out.println("<table border=\"1\">");
				//header row:
				out.println("<tr>");
				for (int col=1; col <= colCount; col++) 
        	    {
					out.println("<th>");
					out.println(meta.getColumnLabel(col));
					out.println("</th>");
        	    }
		        while(queryResult.next()) {
		        	
		        	out.println("<tr>");
		        	for (int col=1; col <= colCount; col++) 
	        	    {
	        	        Object value = queryResult.getObject(col);
	        	        out.println("<td>");
	        	        if (value != null) 
	        	        {
	        	            out.println(value.toString());
	        	        }
	        	        out.println("</td>");
	        	    }
		        	Object value = queryResult.getObject(1);
		        	/*out.println("<td>");
		        	out.println( "< form action='AuctionsServlet' method='post'>");
		        	out.println( "<button name ='query'  value='select * from AUCTIONSONLINE where idm="+value+"' >SHOW USER'S AUCTIONS</button>");
		        	out.println("</td>");
		        	out.println("</form>");*/
		        	
		        	out.println("</tr>");
		        }
		        out.println("</table>");
				queryResult.close();
			    stmt.close();
			}
			else
			{
				Statement stmt = DBManager.getConnection().createStatement();
				stmt.execute(query);
				out.println("other command DONE");
			    stmt.close();
			}      
	        
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			if(out != null)
				out.close();
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
