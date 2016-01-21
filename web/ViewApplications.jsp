<%-- 
    Document   : loadSearchedApplications
    Created on : Dec 31, 2015, 6:52:08 PM
    Author     : Yasiru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    
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
        <title>JSP Page</title>
    </head>
    <body style="background-color: #8c6f75">
        
        
        
        
        
        <form id="myForm" class="form-horizontal" role="form" method="post" action="View_FullApplicationGuardianDetail.jsp">
       <%
           int category=Integer.parseInt(request.getParameter("parentselect"));
           String key=request.getParameter("childselect") ;
           String user=(String)session.getAttribute("userid");
           System.out.println(category);
           System.out.println(key);
            Connection connection = DB_Connection.getDBConnection().getConnection();
            
            //int key=Integer.parseInt(request.getParameter("q"));
            PreparedStatement statement =null;
            if(category==0){
               statement=connection.prepareStatement("select application_school.application_id,application.date,student.full_name,school.name,application_school.status,application_school.location_marks,application_school.sibling_marks from application_school inner join school on application_school.school_id=school.school_id inner join application on application.application_id=application_school.application_id inner join student on application.student_id=student.student_id and school.name='"+key+"' and user_account_id='"+user+"'"); 
            }
            else if(category==1){
               statement=connection.prepareStatement("select application_school.application_id,application.date,student.full_name,school.name,application_school.status,application_school.location_marks,application_school.sibling_marks from application_school inner join school on application_school.school_id=school.school_id inner join application on application.application_id=application_school.application_id inner join student on application.student_id=student.student_id and student.full_name='"+key+"' and user_account_id='"+user+"'"); 
            }
            ResultSet result = statement.executeQuery();
            
            %>
        
        
        <!--p>Hello, <!--%=user %></p-->
        
        <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <h6 style="text-align:right; padding-top: 0px; margin-top: 0px; margin-bottom: 0px;  color:#ffffff;text-transform:none">Logged in as <%=user%></h6>
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
                        <a class="page-scroll" href="Guardian.jsp">New Application</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="SearchApplications.jsp">Applications</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="User_setting_Password.jsp">Settings</a>
                    </li> 
                    <li>
                        <a class="page-scroll" href="index.htm" >Log out</a>
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
            <th>Student Name</th>
            <th>Requested School</th>
            <th>Sibling Marks</th>
            <th>Location Marks</th>
            <th>Status</th>
            <!--th>View Link</th-->
        </tr>
        </thead>
        <tbody>
        
        <% while(result.next()){ %>
        
        
        <%
            int status= result.getInt(5);
            String displayText=null;
            if(status==0){
                displayText="Not Approved By School Yet";
            }
            else if(status==1){
                displayText="Application Verified";
            }
            
            %>
        <tr>
            <td>
                <div class="form-group">
            <div class="col-sm-offset-2 col-sm-4">
                
                <button value="<%= result.getString(1) %>" name="full_view" type="submit" class="btn btn-default"  > <%= result.getString(1) %> </button>
                
            </div>
            </td>
            
            <td><%= result.getDate(2) %></td>
            <td><%= result.getString(3) %></td>
            <td><%= result.getString(4) %></td>
            <td><%= result.getInt(5) %></td>
            <td><%= result.getInt(5) %></td>
            <td><%=displayText%></td>
            
            
        </tr>
        <% } %>
        </tbody>
    </table>
     
        
    
        <input type="hidden" name="hiddenField"  > 
            
            </div>
            
       
     
    
        
    
    
    
    </form>    
        
    </body>
</html>
