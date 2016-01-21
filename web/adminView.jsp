<%-- 
    Document   : adminView
    Created on : Jan 21, 2016, 11:17:28 AM
    Author     : Yasiru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% if(session.getAttribute("userid")==null){
        response.sendRedirect("index.htm"); 
    }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/agency.css" rel="stylesheet">
	
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    

    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>List of Applications</title>
    </head>
    <body style="background-color: #8c6f75">
        
        
        
        <form id="myForm" class="form-horizontal" role="form" method="post" action="school_View_Full_Application.jsp">
       <%
           //int category=Integer.parseInt(request.getParameter("year"));
           String userid=(String)session.getAttribute("userid");
           String user=(String)session.getAttribute("nameOfUser");
            Connection connection = DB_Connection.getDBConnection().getConnection();
            
            //int key=Integer.parseInt(request.getParameter("q"));
            PreparedStatement statement =null;            
            
            statement=connection.prepareStatement("Select application.application_id,application.date,application.student_id,application_school.status,school.school_id,school.name,application_school.location_marks,application_school.sibling_marks from application inner join application_school on application.application_id=application_school.application_id inner join school on school.school_id=application_school.school_id ");            
            
            
            ResultSet result = statement.executeQuery();
            
        %>
        
        <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="btn btn-primary btn-sm page-scroll" href="#page-top">
					<img src="img/home.png" alt = "Home" style="width:40px; height:40px;">
				</a>                
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>                    
                    <li>
                        <a class="page-scroll" href="addNewSchool.jsp">Add School</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="adminView.jsp">Applications</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="User_setting_Password.jsp">Settings</a>
                    </li> 
                    <li>
                        <a class="page-scroll" href="index.htm" onclick="<%session.setAttribute("userid", null);%>">Log out</a>
                    </li>                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
        <div style="padding-top: 100px;margin-top: 100px">
            <h1>View Applications</h1>
        
        <table name="" class="table table-hover">
        <thead>
        <tr>
            <th>Application ID</th>
            <th>Date</th>
            <!--th>Status</th-->
            <th>Student ID</th>
            <th>Sibling Marks</th>
            <th>Location Marks</th>
            <th>Status</th>
            <!--th>View Link</th-->
        </tr>
        </thead>
        <tbody>
        
        <% while(result.next()){ %>
        <tr>
            <td>
                <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
                
                <button value="<%= result.getString(1) %>" name="full_view" type="submit" class="btn btn-default" onclick="button1()" > <%= result.getString(1) %> </button>
                
            </div>
            </td>
            
            <td><%= result.getDate(2) %></td>
            <td><%= result.getString(3) %></td>
            <td><%= result.getInt(7) %></td>
            <td><%= result.getInt(8) %></td>
            <td><%= result.getInt(4) %></td>
            
            
        </tr>
        <% } %>
        </tbody>
    </table>
     
        
    
        <input type="hidden" name="appId"  > 
    
        </div>
        
    </form>    
        
    </body>
</html>

