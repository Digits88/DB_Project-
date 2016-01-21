<%-- 
    Document   : ViewApplication
    Created on : Dec 23, 2015, 4:54:21 PM
    Author     : Yasiru
--%>

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
        <title>Search Applications</title>
    </head>
    <body style="background-color: #8c6f75">
     
        
        <%
          String sessionUser=(String)session.getAttribute("userid");
        %>
        
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <h6 style="text-align:right; padding-top: 0px; margin-top: 0px; margin-bottom: 0px;  color:#ffffff;text-transform:none">Logged in as <%=sessionUser%></h6>
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
                        <a class="page-scroll" href="index.htm">Log out</a>
                    </li>                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

<div class="container" style="padding-top: 100px;margin-top:100px" >
        
        
        <h1>Search Applications</h1>    
        
        <form class="form-horizontal" role="form" method="post" action="ViewApplications.jsp">    
        <div class="form-group">
            <label class="control-label col-md-2" >Search Category:</label>
                <div class="col-md-4">
                    <select  required id="parentselect" class="form-control" name="parentselect" onchange="showUser(this.value)" >
                        <option value="" >-- Please Select --</option>
                        <option value="0">School</option>
                        <option value="1">Student Name</option>
                        
                    </select>
                </div>
        </div>
                   
        <div class="form-group">
            <label class="control-label col-md-2">Search Item:</label>
            <div id="keysearch" class="col-md-4">
                <select required id="childselect" class="form-control" name="childselect" >
                    <option value="" >-- Please Select --</option>   
                </select>
            </div>
        </div>
        
           
         <script>
            function showUser(str) {
            var xhttp;    

            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (xhttp.readyState == 4 && xhttp.status == 200) {
                document.getElementById("childselect").innerHTML = xhttp.responseText;
              }
            };
            xhttp.open("GET", "getuser.jsp?q="+str, true);
            xhttp.send();
            }       
        </script>        
            
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button  type="submit" class="btn btn-default">Submit</button>
            </div>
        </div>
        
        
        
    </form>
    
</div>

</body>
</html>
