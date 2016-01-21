<%-- 
    Document   : getuser
    Created on : Jan 7, 2016, 9:32:17 AM
    Author     : Yasiru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String sessionUser=(String)session.getAttribute("userid");
            //System.out.println("This is the existing user ID:"+sessionUser);
            Connection connection = DB_Connection.getDBConnection().getConnection();
            int key=Integer.parseInt(request.getParameter("q"));
            PreparedStatement statement =null;
            if(key==0){
                //System.out.println("zero");
                statement= connection.prepareStatement("select distinct school.name from school inner join application_school on application_school.school_id=school.school_id inner join application on application.application_id=application_school.application_id and application.user_account_id='sandeepa@gmail.com';");
            }
            else if(key==1){
                System.out.println("one");
                statement= connection.prepareStatement("select distinct full_name from student inner join application on application.student_id=student.student_id and application.user_account_id='"+sessionUser+"'");
            }
            
            ResultSet result = statement.executeQuery();
            %>
        
        <div class="form-group">
            <label class="control-label col-md-2">Search Item:</label>
            <div class="col-md-4">
                <select  class="form-control" name="childselect"  >
                    
                    <% while(result.next()){ %>
                    <option ><%= result.getString(1) %></option>
                    <% } %>
            </div>
        </div>
       
    </body>
</html>
