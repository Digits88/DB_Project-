<%-- 
    Document   : loadApplications
    Created on : Dec 23, 2015, 7:27:12 PM
    Author     : Yasiru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("username", request.getParameter("username"));
        	Connection connection = DB_Connection.getDBConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("select * from user_account where account_id=? and password=?");
            try {

                statement.setString(1, request.getParameter("username"));
                statement.setString(2, request.getParameter("password"));
                ResultSet result = statement.executeQuery();
                if (result.next()) {
                    response.sendRedirect("PhrixusSolutionADDNEWSCHOOL.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception ex) {
                System.out.println("Statement Error");
            }
        %>
    </body>
</html>
