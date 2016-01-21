
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>Request Form</title>
    </head>
    <body>

    <center>
        <div style="width:1000px">
            <marquee style="color: #f90101; font-size: 16px">You have logged into Facility Management Division in <span style="color:#0f28e7">SLT</span>. Please make your request</marquee>
        </div>
    </center>
    <br>
    <div id="mystyle" class="myform">
        <form id="form" name="form" action="SchoolServlet" method="post"> 

            <td style="border: none;">
                <div class="wrapper">
                    <div class="content">
                        <div id="form_wrapper" class="form_wrapper" style="width: 750px">
                            <form class="register active" method="post"  action="SchoolServlet">
                                <h3>Request Form</h3>

                                <label>Request From<span class="small"> </span></label>
                                <input type="text" name="q11_schoolName" id="RFromId" required/>
                                <label>telephone<span class="small"></span></label>
                                <input type="text" name="q14_telephoneNo" id="LocationId" required/>

                                <label>Exact Location /Exchange Area<span class="small"></span></label>
                                <input type="text" name="q7_address[state]" id="LocationId" required/>


                                <label>Justification of the Request<span class="small"></span></label>
                                <input type="text" name="q7_address[city]" id="JustificationId" required/>

                                <label>Details of the Previous repair relevant to request (Item no 4)(Approximate date/type of work etc.) <span class="small"></span></label>
                                <input type="text" name="q7_address[addr_line2]" id="PreviousId" required/>

                                <label>Name<span class="small"></span></label>
                                <input type="text" name="q7_address[addr_line1]" id="nameId" required/>

                                <label>Email<span class="small"></span></label>
                                <input type="email" name="q6_email6" id="EmailId" required/>    

                                <div class="bottom">
                                    <button type="submit">Send New Request Form</button>
                                    <div class="clear"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </td>
            <%--<button type="submit">Pass the request form to selected person. </button>--%>
            <div class="spacer"></div>
        </form>
    </div>   
</body>
</html>

