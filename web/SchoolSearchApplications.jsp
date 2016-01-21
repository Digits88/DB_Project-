<%-- 
    Document   : SchoolSearchApplications
    Created on : Jan 19, 2016, 4:51:04 PM
    Author     : Yasiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>View Applications</title>
    </head>
    <body background="Images/banner1.jpg">
        
        

<div class="container">
        <h1>Search Applications</h1>
        <%
          String sessionUser=(String)session.getAttribute("userid");
        %>
            
        
        <form class="form-horizontal" role="form" method="post" action="#">    
        
          <div class="col-xs-3">
  <label for="year">Enter Year</label>
  <input class="form-control" id="year" type="text">
</div>        
           
         
            
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button  type="submit" class="btn btn-default">Submit</button>
            </div>
        </div>
        
        
        
    </form>
    
</div>

</body>
</html>

