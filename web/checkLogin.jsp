<%-- 
    Document   : checkLogin
    Created on : Nov 30, 2015, 11:11:38 PM
    Author     : Asus
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/horoscope.ico" type="image/x-icon"/>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String user = request.getParameter("username");            
              
            try {
            Connection connection = DB_Connection.getDBConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("select * from user_account where account_id=? and password=password(?)");
            

                statement.setString(1, request.getParameter("username"));
                statement.setString(2, request.getParameter("password"));
                ResultSet result = statement.executeQuery();
                if (result.next()) {
                    session.setAttribute("userid", user);
                    session.setAttribute("nameOfUser", result.getString("name"));
                    int accountType = result.getInt("account_type");
                    if(accountType == 0){
                        response.sendRedirect("adminHome.jsp");      
                    }else if(accountType == 1){
                        response.sendRedirect("schoolHome.jsp");      
                    }else{
                        response.sendRedirect("userHome.jsp");      
                    }
                                                      
                } else {
                    response.sendRedirect("index.htm");
                }
            } catch (Exception ex) {
                response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
            }
        %>
    </body>
</html>
