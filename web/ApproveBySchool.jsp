<%-- 
    Document   : ApproveBySchool
    Created on : Jan 21, 2016, 12:35:32 AM
    Author     : Yasiru
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
        <h1>Hello World!</h1>
        
        <%
            
            String user=(String)session.getAttribute("userid");
            String app_id=request.getParameter("newid");
            
            
            %>
        
            <h1><%=app_id%></h1> 
        
    </body>
</html>
