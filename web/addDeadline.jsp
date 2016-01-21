<%-- 
    Document   : adminView
    Created on : Jan 21, 2016, 11:17:28 AM
    Author     : Yasiru
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Deadlines</title>
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
            int year = Calendar.getInstance().get(Calendar.YEAR);
            statement=connection.prepareStatement("Select deadline from deadline where year = ?");
            statement.setInt(1, year);            
            ResultSet result = statement.executeQuery();
            String currentDate = null;
            if(result.next()){
                DateFormat df = new SimpleDateFormat("MM/dd/yyyy");                
                currentDate = df.format(result.getDate("deadline"));
            }else{
                currentDate = "No Deadline Set";
            }
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
                        <a class="page-scroll" href="index.htm">Log out</a>
                    </li>                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
        <div style="margin-top: 100px">
            
        
        <h1 style="margin-left: 30px;margin-bottom: 30px">Add Deadline</h1>    
        
        <form class="form-horizontal" role="form" method="post" action="ViewApplications.jsp">    
        <div class="form-group">
            <label class="control-label col-md-2" >Current Deadline:</label>
                <div class="col-md-4">
                    <div style="margin-top: 0px; padding-top: 0px;" class="form-group ex_input">
                        <input type="text" name="username" value="<%=currentDate%>"class="form-control input-sm" id="usr" disabled>
                    </div>
                </div>
        </div>
                   
        <div class="form-group">
            <div class='input-group date' id='datetimepicker' style="width: 350px; margin-left: 200px">
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker').datetimepicker();                
            });
            
            $('#datetimepicker').data("DateTimePicker").FUNCTION()
        </script>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button  type="submit" class="btn btn-default">Submit</button>
            </div>
        </div>
        
    
        <input type="hidden" name="appId"  > 
    
        </div>
        
    </form>    
        
    </body>
</html>

