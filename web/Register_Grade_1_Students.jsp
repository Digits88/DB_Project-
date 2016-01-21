<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.String"%>
<%@page import="javax.jms.Session"%>
<%@page import="java.sql.SQLException"%>
<%@page import="servelet.SchoolServlet"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="db.DB_Handler"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- saved from url=(0038)https://form.jotform.me/60184470840453 -->
<html class="supernova"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=http%3A%2F%2Fwww.jotform.com%2Fform%2F60184470840453" title="oEmbed Form"><link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=http%3A%2F%2Fwww.jotform.com%2Fform%2F60184470840453" title="oEmbed Form">
        <meta property="og:title" content="Register Grade 1 Students">
        <meta property="og:url" content="http://www.jotform.me/form/60184470840453">
        <meta property="og:description" content="Please click the link to complete this form.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta name="HandheldFriendly" content="true">
        <title>Register Grade 1 Students</title>
        <link href="./Register Grade 1 Students_files/formCss.css" rel="stylesheet" type="text/css">
        <link type="text/css" rel="stylesheet" href="./Register Grade 1 Students_files/nova.css">
        <link type="text/css" media="print" rel="stylesheet" href="./Register Grade 1 Students_files/printForm.css">
        <style type="text/css">
            .form-label-left{
                width:150px !important;
            }
            .form-line{
                padding-top:12px;
                padding-bottom:12px;
            }
            .form-label-right{
                width:150px !important;
            }
            body, html{
                margin:0;
                padding:0;
                background:#fff;
            }

            .form-all{
                margin:0px auto;
                padding-top:0px;
                width:690px;
                color:#555 !important;
                font-family:"Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Verdana, sans-serif;
                font-size:14px;
            }
        </style>

        <style type="text/css" id="form-designer-style">
            /* Injected CSS Code */
            .form-all {
                font-family: "Lucida Grande", sans-serif;
            }
            .form-all {
                width: 690px;
            }
            .form-label-left,
            .form-label-right {
                width: 150px;
            }
            .form-label {
                white-space: normal;
            }
            .form-label.form-label-auto {
                display: inline-block;
                float: left;
                text-align: left;
                width: 150px;
            }
            .form-label-left {
                display: inline-block;
                white-space: normal;
                float: left;
                text-align: left;
            }
            .form-label-right {
                display: inline-block;
                white-space: normal;
                float: left;
                text-align: right;
            }
            .form-label-top {
                white-space: normal;
                display: block;
                float: none;
                text-align: left;
            }
            .form-all {
                font-size: 14px;
            }
            .form-label {
                font-weight: bold;
            }
            .form-checkbox-item label,
            .form-radio-item label {
                font-weight: normal;
            }
            .supernova {
                background-color: #ffffff;
                background-color: #f5f5f5;
            }
            .supernova body {
                background-color: transparent;
            }
            /*
            @width30: (unit(@formWidth, px) + 60px);
            @width60: (unit(@formWidth, px)+ 120px);
            @width90: (unit(@formWidth, px)+ 180px);
            */
            /* | */
            @media screen and (min-width: 480px) {
                .supernova .form-all {
                    border: 1px solid #dcdcdc;
                    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);
                    -moz-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);
                    box-shadow: 0 3px 9px rgba(0, 0, 0, 0.1);
                }
            }
            /* | */
            /* | */
            @media screen and (max-width: 480px) {
                .jotform-form {
                    padding: 10px 0;
                }
            }
            /* | */
            /* | */
            @media screen and (min-width: 480px) and (max-width: 768px) {
                .jotform-form {
                    padding: 30px 0;
                }
            }
            /* | */
            /* | */
            @media screen and (min-width: 480px) and (max-width: 689px) {
                .jotform-form {
                    padding: 30px 0;
                }
            }
            /* | */
            /* | */
            @media screen and (min-width: 768px) {
                .jotform-form {
                    padding: 60px 0;
                }
            }
            /* | */
            /* | */
            @media screen and (max-width: 689px) {
                .jotform-form {
                    padding: 0;
                }
            }
            /* | */
            .supernova .form-all,
            .form-all {
                background-color: #ffffff;
                border: 1px solid transparent;
            }
            .form-header-group {
                border-color: #e6e6e6;
            }
            .form-matrix-table tr {
                border-color: #e6e6e6;
            }
            .form-matrix-table tr:nth-child(2n) {
                background-color: #f2f2f2;
            }
            .form-all {
                color: #555555;
            }
            .form-header-group .form-header {
                color: #555555;
            }
            .form-header-group .form-subHeader {
                color: #6f6f6f;
            }
            .form-sub-label {
                color: #6f6f6f;
            }
            .form-label-top,
            .form-label-left,
            .form-label-right,
            .form-html {
                color: #555555;
            }
            .form-checkbox-item label,
            .form-radio-item label {
                color: #6f6f6f;
            }
            .form-line.form-line-active {
                -webkit-transition-property: all;
                -moz-transition-property: all;
                -ms-transition-property: all;
                -o-transition-property: all;
                transition-property: all;
                -webkit-transition-duration: 0.3s;
                -moz-transition-duration: 0.3s;
                -ms-transition-duration: 0.3s;
                -o-transition-duration: 0.3s;
                transition-duration: 0.3s;
                -webkit-transition-timing-function: ease;
                -moz-transition-timing-function: ease;
                -ms-transition-timing-function: ease;
                -o-transition-timing-function: ease;
                transition-timing-function: ease;
                background-color: #ffffe0;
            }
            /* ömer */
            .form-radio-item,
            .form-checkbox-item {
                padding-bottom: 0px !important;
            }
            .form-radio-item:last-child,
            .form-checkbox-item:last-child {
                padding-bottom: 0;
            }
            /* ömer */
            .form-single-column .form-checkbox-item,
            .form-single-column .form-radio-item {
                width: 100%;
            }
            .supernova {
                height: 100%;
                background-repeat: no-repeat;
                background-attachment: scroll;
                background-position: center top;
                background-repeat: repeat;
            }
            .supernova {
                background-image: none;
            }
            #stage {
                background-image: none;
            }
            /* | */
            .form-all {
                background-repeat: no-repeat;
                background-attachment: scroll;
                background-position: center top;
                background-repeat: repeat;
            }
            .form-header-group {
                background-repeat: no-repeat;
                background-attachment: scroll;
                background-position: center top;
            }
            .form-line {
                margin-top: 12px;
                margin-bottom: 12px;
            }
            .form-line {
                padding: 12px 36px;
            }
            .form-all .qq-upload-button,
            .form-all .form-submit-button,
            .form-all .form-submit-reset,
            .form-all .form-submit-print {
                font-size: 1em;
                padding: 9px 15px;
                font-family: "Lucida Grande", sans-serif;
                font-size: 14px;
                font-weight: normal;
            }
            .form-all .form-pagebreak-back,
            .form-all .form-pagebreak-next {
                font-size: 1em;
                padding: 9px 15px;
                font-family: "Lucida Grande", sans-serif;
                font-size: 14px;
                font-weight: normal;
            }
            /*
            & when ( @buttonFontType = google ) {
                    @import (css) "@{buttonFontLink}";
            }
            */
            h2.form-header {
                line-height: 1.618em;
                font-size: 1.714em;
            }
            h2 ~ .form-subHeader {
                line-height: 1.5em;
                font-size: 1.071em;
            }
            .form-header-group {
                text-align: left;
            }
            /*.form-dropdown,
            .form-radio-item,
            .form-checkbox-item,
            .form-radio-other-input,
            .form-checkbox-other-input,*/
            .form-captcha input,
            .form-spinner input,
            .form-error-message {
                padding: 4px 3px 2px 3px;
            }
            .form-header-group {
                font-family: "Lucida Grande", sans-serif;
            }
            .form-section {
                padding: 0px 0px 0px 0px;
            }
            .form-header-group {
                margin: 12px 36px 12px 36px;
            }
            .form-header-group {
                padding: 24px 29px 24px 29px;
            }
            .form-header-group .form-header,
            .form-header-group .form-subHeader {
                color: #ffffff;
            }
            .form-header-group {
                background-color: #4879df;
            }
            .form-textbox,
            .form-textarea {
                padding: 4px 3px 2px 3px;
            }
            .form-textbox,
            .form-textarea,
            .form-radio-other-input,
            .form-checkbox-other-input,
            .form-captcha input,
            .form-spinner input {
                background-color: #ffffff;
            }
            [data-type="control_dropdown"] .form-input,
            [data-type="control_dropdown"] .form-input-wide {
                width: 150px;
            }
            .form-label {
                font-family: "Lucida Grande", sans-serif;
            }
            li[data-type="control_image"] div {
                text-align: left;
            }
            li[data-type="control_image"] img {
                border: none;
                border-width: 0px !important;
                border-style: solid !important;
                border-color: false !important;
            }
            .form-line-column {
                width: auto;
            }
            .form-line-error {
                overflow: hidden;
                -webkit-transition-property: none;
                -moz-transition-property: none;
                -ms-transition-property: none;
                -o-transition-property: none;
                transition-property: none;
                -webkit-transition-duration: 0.3s;
                -moz-transition-duration: 0.3s;
                -ms-transition-duration: 0.3s;
                -o-transition-duration: 0.3s;
                transition-duration: 0.3s;
                -webkit-transition-timing-function: ease;
                -moz-transition-timing-function: ease;
                -ms-transition-timing-function: ease;
                -o-transition-timing-function: ease;
                transition-timing-function: ease;
                background-color: #fff4f4;
            }
            .form-line-error .form-error-message {
                background-color: #ff3200;
                clear: both;
                float: none;
            }
            .form-line-error .form-error-message .form-error-arrow {
                border-bottom-color: #ff3200;
            }
            .form-line-error input:not(#coupon-input),
            .form-line-error textarea,
            .form-line-error .form-validation-error {
                border: 1px solid #ff3200;
                -webkit-box-shadow: 0 0 3px #ff3200;
                -moz-box-shadow: 0 0 3px #ff3200;
                box-shadow: 0 0 3px #ff3200;
            }
            .ie-8 .form-all {
                margin-top: auto;
                margin-top: initial;
            }
            .ie-8 .form-all:before {
                display: none;
            }
            /* | */
            @media screen and (max-width: 480px), screen and (max-device-width: 768px) and (orientation: portrait), screen and (max-device-width: 415px) and (orientation: landscape) {
                .jotform-form {
                    padding: 0;
                }
                .form-all {
                    border: 0;
                    width: 100%;
                    max-width: initial;
                }
                .form-sub-label-container {
                    width: 100%;
                    margin: 0;
                }
                .form-input {
                    width: 100%;
                }
                .form-label {
                    width: 100%!important;
                }
                .form-line {
                    padding: 2% 5%;
                    -moz-box-sizing: border-box;
                    -webkit-box-sizing: border-box;
                    box-sizing: border-box;
                }
                input[type=text],
                input[type=email],
                input[type=tel],
                textarea {
                    width: 100%;
                    -moz-box-sizing: border-box;
                    -webkit-box-sizing: border-box;
                    box-sizing: border-box;
                    max-width: initial !important;
                }
                .form-input,
                .form-input-wide,
                .form-textarea,
                .form-textbox,
                .form-dropdown {
                    max-width: initial !important;
                }
                div.form-header-group {
                    padding: 24px 29px !important;
                    margin: 0 12px 2% !important;
                    -moz-box-sizing: border-box;
                    -webkit-box-sizing: border-box;
                    box-sizing: border-box;
                }
                [data-type="control_button"] {
                    margin-bottom: 0 !important;
                }
                .form-buttons-wrapper {
                    margin: 0!important;
                }
                .form-buttons-wrapper button {
                    width: 100%;
                }
                table {
                    width: 100%!important;
                    max-width: initial !important;
                }
                table td + td {
                    padding-left: 3%;
                }
                .form-checkbox-item input,
                .form-radio-item input {
                    width: auto;
                }
                .form-collapse-table {
                    margin: 0 5%;
                }
            }
            /* | */

            /*__INSPECT_SEPERATOR__*/

            /* Injected CSS Code */
        </style>

        <script src="./Register Grade 1 Students_files/prototype.forms.js" type="text/javascript"></script>
        <script src="./Register Grade 1 Students_files/jotform.forms.js" type="text/javascript"></script>
        <script type="text/javascript">
            JotForm.init(function () {
                JotForm.clearFieldOnHide = "disable";
                JotForm.onSubmissionError = "jumpToSubmit";
            });
        </script>
    </head>
    <body>
        <form class="jotform-form" action="StudentRegistrationServlet" method="post" name="form_60184470840453" id="60184470840453" accept-charset="utf-8" novalidate="true">
            <input type="hidden" name="formID" value="60184470840453">
            <div class="form-all">
                <ul class="form-section page-section">
                    <li id="cid_1" class="form-input-wide" data-type="control_head">
                        <div class="form-header-group">
                            <div class="header-text httal htvam">
                                <h2 id="header_1" class="form-header">
                                    Register Grade 1 Students
                                </h2>
                                <div id="subHeader_1" class="form-subHeader">
                                    Registering the student who approve from the interview and conform to register the school
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_text" id="id_4">
                        <div id="cid_4" class="form-input-wide">
                            <div id="text_4" class="form-html">
                                <p>Student who passed the interview and approved for school. choose student who conform and register for school</p>
                            </div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_checkbox" id="id_3">
                        <label class="form-label form-label-left form-label-auto" id="label_3" for="input_3">  </label>
                        <div id="cid_3" class="form-input jf-required">
                            <div class="form-single-column">
                                <%
            //String studentName = null;       
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
                //response.sendRedirect("index.htm?message=" + URLEncoder.encode(ex.getMessage(), "UTF-8"));
            }
        %>
                                


                                <% int count = 0;
            for (String studentName : studentNames) {%>

            <input type="checkbox" name="checkbox" value="<%=student_id.get(count)%>"><%=studentName%>
    
            <%
                count++;

            }%>

                                <input name = "checkboxCount" value = "<%=String.valueOf(count)%>" type = "hidden" />
                            </div>
                        </div>
                    </li>
                    <li class="form-line" data-type="control_button" id="id_2">
                        <div id="cid_2" class="form-input-wide">
                            <div style="margin-left:156px" class="form-buttons-wrapper">
                                <button id="input_2" type="submit" class="form-submit-button">
                                    Submit
                                </button>
                            </div>
                        </div>
                    </li>
                    <li style="display:none">
                        Should be Empty:
                        <input type="text" name="website" value="">
                    </li>
                </ul>
            </div>
            <input type="hidden" id="simple_spc" name="simple_spc" value="60184470840453-60184470840453">
            <script type="text/javascript">
                document.getElementById("si" + "mple" + "_spc").value = "60184470840453-60184470840453";
            </script>
            <input type="hidden" name="event_id" value="1453258025817_60184470840453_MhSYORR"></form><img src="./Register Grade 1 Students_files/saved_resource" style="display: none;">

</body></html>