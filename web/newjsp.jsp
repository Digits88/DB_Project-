<%-- 
    Document   : newjsp
    Created on : Jan 21, 2016, 12:22:57 AM
    Author     : Lahiru Sandeepa
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="servelet.SchoolServlet"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String studentName = null;       
            ArrayList<String> studentNames = new ArrayList();
                                    ArrayList<String> student_id = new ArrayList();  
            try {
            Connection connection = DB_Connection.getDBConnection().getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT student_id,full_name FROM student WHERE student_id = (SELECT student_id FROM application WHERE application_id = (SELECT application_id FROM application_school WHERE school_id  = (SELECT school_id FROM school WHERE email = 'rahula@gmail.com')))");
            
                ResultSet result = statement.executeQuery();
                while (result.next()) {
                    studentNames.add(result.getString("full_name"));
                    student_id.add(result.getString("student_id"));                                  
                }
            } catch (Exception ex) {
                response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
            }
        %>
                                <h1><%=studentNames.get(0)%></h1>
    </body>
</html>
