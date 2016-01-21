<%-- 
    Document   : test
    Created on : Jan 13, 2016, 7:42:50 PM
    Author     : Yasiru
--%>

<%@page import="db.DB_Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
        <link href="css/stylesheet.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%response.setIntHeader("Refresh", 60);%>
        <%@include file="header.jsp"%>
        <br>
        <div>
            <center>
                <table>
                    <thead>
                        <tr>
                            <th>Application ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Student ID</th>
                            <th>Requested School</th>
                            <th>View Link</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <%!

                            Connection conn = null;
                            PreparedStatement statement = null;%>
                        <%
                            Connection connection = DB_Connection.getDBConnection().getConnection();
                            int category=Integer.parseInt(request.getParameter("parentselect"));
                            String key=request.getParameter("childselect") ;
                            String user=(String)session.getAttribute("userid");
                            String sql = "select application.application_id,application.date,application.status,student.full_name,school.name from application inner join school on application.requested_school_id=school.school_id inner join student on application.student_id=student.student_id and school.name='"+key+"' and user_account_id='"+user+"'";
                            PreparedStatement statement = conn.prepareStatement(sql);
                            ResultSet rs = statement.executeQuery();
                            while(rs.next()){
                        %>
                        
                        <tr>
                            <td><%=String.valueOf(rs.getInt(1))%></td>
                            <td><%=rs.getString(3)%></td>
                            <!-- enter date and time -->
                            
                            <td><%=rs.getString(10)%></td>
                            <td><%=String.valueOf(rs.getInt(12))%></td>
                            <td style="border: none;">
                                
                                
                            <td><%= rs.getString(1) %><td>
            <td><%= rs.getDate(2) %></td>
            <td><%= rs.getInt(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td>
                <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">View</button>
            </div>
        </div></td>    
                                <div>
                                    <form method="post" action="vehicleRequestForm.jsp">
                                        <input type="hidden" id="updateId" name="updateId" value="<%=String.valueOf(rs.getInt(1))%>"/> 
                                        <input type="submit" value="View..."/> 
                                    </form>
                                </div>
                            </td>
                            <td style="border: none;">
                                <div>
                                    <form method="post" action="deleteservlet">
                                        <input type="hidden" id="delId" name="delId" value="<%=String.valueOf(rs.getInt(1))%>"/> 
                                        <form action="/Config?pg=FIBiller&amp;cmd=delete">
                                            <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete?')"/> 
                                        </form>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
</html>

