<%-- 
    Document   : View_FullApplication
    Created on : Jan 12, 2016, 7:02:10 AM
    Author     : Yasiru
--%>

<%@page import="Model.School"%>
<%@page import="Controller.SchoolController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- saved from url=(0038)https://form.jotform.me/60080737750454 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=http%3A%2F%2Fwww.jotform.com%2Fform%2F60080737750454" title="oEmbed Form"><link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=http%3A%2F%2Fwww.jotform.com%2Fform%2F60080737750454" title="oEmbed Form">
<meta property="og:title" content="Event Registration">
<meta property="og:url" content="http://www.jotform.me/form/60080737750454">
<meta property="og:description" content="Please click the link to complete this form.">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="HandheldFriendly" content="true">
<title>Event Registration</title>
<link href="./Event Registration_files/formCss.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="./Event Registration_files/nova.css">
<link type="text/css" media="print" rel="stylesheet" href="./Event Registration_files/printForm.css">
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
        background:false;
    }

    .form-all{
        margin:0px auto;
        padding-top:0px;
        width:690px;
        color:Black !important;
        font-family:'Lucida Grande',' Lucida Sans Unicode',' Lucida Sans',' Verdana',' Tahoma',' sans-serif';
        font-size:14px;
    }
</style>

<script src="./Event Registration_files/prototype.forms.js" type="text/javascript"></script>
<script src="./Event Registration_files/jotform.forms.js" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.init(function(){
      JotForm.calendarMonths = ["January","February","March","April","May","June","July","August","September","October","November","December"];
      JotForm.calendarDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
      JotForm.calendarOther = {"today":"Today"};
      JotForm.setCalendar("8", false, false);
	JotForm.clearFieldOnHide="disable";
	JotForm.onSubmissionError="jumpToSubmit";
   });
</script>

<script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>
    
 var map;
//var myCenter=new google.maps.LatLng(6.9344,79.8428);
var myCenter=new google.maps.LatLng(6.835838182005156,80.58921108953655);
 var markers = [];
 
function initialize() {
  var mapProp = {
    center:myCenter,
    zoom:5,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
   map=new google.maps.Map(document.getElementById("googleMap"), mapProp);


 google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });

}
function placeMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map,
  });
  lat = location.lat();
  lng = location.lng();
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + lat + '<br>Longitude: ' + lng
  });
  
  clearMarkers();
  deleteMarkers();
  markers.push(marker);
  infowindow.open(map,marker);
  
    document.getElementByName("lat").value = lat;
    document.getElementByName("lng").value = lng;
}

function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function clearMarkers() {
  setMapOnAll(null);
}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
   
    
    
<form class="jotform-form" action="ApplicationForm" method="post" name="form_60080737750454" id="60080737750454" accept-charset="utf-8" novalidate="true">
  
  <%
         
    String firstName = request.getParameter("q4_name[first]");
    String middleName = request.getParameter("q4_name[middle]");
    String lastName = request.getParameter("q4_name[last]");
    String nic = request.getParameter("NIC");
    String relationship = request.getParameter("q29_relationship");
    String adressline1 = request.getParameter("q5_addresshome[addr_line1]");
    String addressline2 = request.getParameter("q5_addresshome[addr_line2]");
    String street = request.getParameter("q5_addresshome[city]");
    String city = request.getParameter("q5_addresshome[state]");
    String homeTel = request.getParameter("q6_homeNumber[phone]");
    String tel1 = request.getParameter("q7_cellularNumber7[phone]");
    String tel2 = request.getParameter("q30_cellularNumber30[phone]");
    String occupaton = request.getParameter("q32_occupation");
    String workAddressline1 = request.getParameter("q33_addresswork[addr_line1]");
    String workAddressline2 = request.getParameter("q33_addresswork[addr_line2]");
    String workStreet = request.getParameter("q33_addresswork[city]");
    String workCity = request.getParameter("q33_addresswork[state]");
    String workTel1 = request.getParameter("q9_workNumber9[phone]");
    String workTel2 = request.getParameter("q31_workNumber[phone]");
        

    %>  
    
    <input type="hidden" name="q4_name[first]" value="<%=firstName%>">
    <input type="hidden" name="q4_name[middle]" value="<%=middleName%>">
    <input type="hidden" name="q4_name[last]" value="<%=lastName%>">
    <input type="hidden" name="NIC" value="<%=nic%>">
    <input type="hidden" name="q29_relationship" value="<%=relationship%>">
    <input type="hidden" name="q5_addresshome[addr_line1]" value="<%=adressline1%>">
    <input type="hidden" name="q5_addresshome[addr_line2]" value="<%=addressline2%>">
    <input type="hidden" name="q5_addresshome[city]" value="<%=street%>">
    <input type="hidden" name="q5_addresshome[state]" value="<%=city%>">
    <input type="hidden" name="q6_homeNumber[phone]" value="<%=homeTel%>">
    <input type="hidden" name="q7_cellularNumber7[phone]" value="<%=tel1%>">
    <input type="hidden" name="q30_cellularNumber30[phone]" value="<%=tel2%>">
    <input type="hidden" name="q32_occupation" value="<%=occupaton%>">
    <input type="hidden" name="q33_addresswork[addr_line1]" value="<%=workAddressline1%>">
    <input type="hidden" name="q33_addresswork[addr_line2]" value="<%=workAddressline2%>">
    <input type="hidden" name="q33_addresswork[city]" value="<%=workStreet%>">
    <input type="hidden" name="q33_addresswork[state]" value="<%=workCity%>">
    <input type="hidden" name="q9_workNumber9[phone]" value="<%=workTel1%>">
    <input type="hidden" name="q31_workNumber[phone]" value="<%=workTel2%>">
    
    <input type="hidden" name="formID" value="60080737750454">
  <div class="form-all">
    <ul class="form-section page-section">
      <li id="cid_7" class="form-input-wide" data-type="control_head">
        <div class="form-header-group">
          <div class="header-text httal htvam">
            <h1 id="header_7" class="form-header">
              Application Form
            </h1>
          </div>
        </div>
      </li>
      <li class="form-line jf-required" data-type="control_fullname" id="id_4">
        <label class="form-label form-label-left form-label-auto" id="label_4" for="input_4">
          Full Name
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_4" class="form-input jf-required">
          <span class="form-sub-label-container" style="vertical-align: top">
              <input class="form-textbox validate[required]" type="text" size="10" name="q4_fullName4[first]" id="first_4">
            <label class="form-sub-label" for="first_4" id="sublabel_first" style="min-height: 13px;"> First Name </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="text" size="10" name="q4_fullName4[middle]" id="middle_4">
            <label class="form-sub-label" for="middle_4" id="sublabel_middle" style="min-height: 13px;"> Middle Name </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
              <input class="form-textbox validate[required]" type="text" size="15" name="q4_fullName4[last]" id="last_4">
            <label class="form-sub-label" for="last_4" id="sublabel_last" style="min-height: 13px;"> Last Name </label>
          </span>
        </div>
      </li>
      <li class="form-line jf-required" data-type="control_datetime" id="id_8">
        <label class="form-label form-label-left form-label-auto" id="label_8" for="input_8">
          Birthday
          <span class="form-required">
            *
          </span>
        </label>          
          
        <div id="cid_8" class="form-input jf-required">
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox validate[required]" id="month_8" name="q8_birthday8[month]" type="tel" size="2" maxlength="2">
            <span class="date-separate">
              &nbsp;-
            </span>
            <label class="form-sub-label" for="month_8" id="sublabel_month" style="min-height: 13px;"> Month </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox validate[required]" id="day_8" name="q8_birthday8[day]" type="tel" size="2" maxlength="2">
            <span class="date-separate">
              &nbsp;-
            </span>
            <label class="form-sub-label" for="day_8" id="sublabel_day" style="min-height: 13px;"> Day </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
              <input class="form-textbox validate[required]" id="year_8" name="q8_birthday8[year]" type="tel" size="4" maxlength="4">
            <label class="form-sub-label" for="year_8" id="sublabel_year" style="min-height: 13px;"> Year </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <img class="showAutoCalendar" alt="Pick a Date" id="input_8_pick" src="./Event Registration_files/calendar.png" align="absmiddle">
            <label class="form-sub-label" for="input_8_pick" style="min-height: 13px;">  </label>
          </span>
        </div>
      </li>
      <li class="form-line jf-required" data-type="control_address" id="id_9">
        <label class="form-label form-label-left form-label-auto" id="label_9" for="input_9">
          Address
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_9" class="form-input jf-required">
          <table summary="" undefined="" class="form-address-table" border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                    <input class="form-textbox validate[required] form-address-line" type="text" name="q9_address[addr_line1]" id="input_9_addr_line1">
                  <label class="form-sub-label" for="input_9_addr_line1" id="sublabel_9_addr_line1" style="min-height: 13px;"> Address Line 1 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                    <input class="form-textbox form-address-line" type="text" name="q9_address[addr_line2]" id="input_9_addr_line2" size="46" >
                  <label class="form-sub-label" for="input_9_addr_line2" id="sublabel_9_addr_line2" style="min-height: 13px;"> Address Line 2 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%">
                <span class="form-sub-label-container" style="vertical-align: top">
                    <input class="form-textbox validate[required] form-address-city" type="text" name="q9_address[city]" id="input_9_city" size="21">
                  <label class="form-sub-label" for="input_9_city" id="sublabel_9_city" style="min-height: 13px;"> Street Name </label>
                </span>
              </td>
              <td>
                <span class="form-sub-label-container" style="vertical-align: top">
                    <input class="form-textbox validate[required] form-address-state" type="text" name="q9_address[state]" id="input_9_state" size="22">
                  <label class="form-sub-label" for="input_9_state" id="sublabel_9_state" style="min-height: 13px;"> CIty </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%" style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                    <input class="form-textbox validate[required] form-address-postal" type="text" name="q9_address[postal]" id="input_9_postal" size="10">
                  <label class="form-sub-label" for="input_9_postal" id="sublabel_9_postal" style="min-height: 13px;"> Postal / Zip Code </label>
                </span>
              </td>
              <td style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <select class="form-dropdown validate[required] form-address-country" defaultcountry="" name="q9_address[country]" id="input_9_country">
                    <option value="" selected=""> Please Select </option>
                    
                    <option value="other"> Other </option>
                  </select>
                  <label class="form-sub-label" for="input_9_country" id="sublabel_9_country" style="min-height: 13px;"> Country </label>
                </span>
              </td>
            </tr>
          </tbody></table>
        </div>
      </li>
     
      
      
      <div id="googleMap" style="width:500px;height:380px;"></div>
      <input type="hidden" name="lat"> 
    <input type="hidden" name="lng" >
      
      
      
      
      
      <li class="form-line" data-type="control_phone" id="id_6">
        <label class="form-label form-label-left form-label-auto" id="label_6" for="input_6"> Phone Number </label>
        <div id="cid_6" class="form-input jf-required">
          <span class="form-sub-label-container" style="vertical-align: top">
            <!--input class="form-textbox" type="tel" name="q6_phoneNumber6[area]" id="input_6_area" size="3"-->
            <span class="phone-separate">
              &nbsp;-
            </span>
            <!--label class="form-sub-label" for="input_6_area" id="sublabel_area" style="min-height: 13px;"> Area Code </label-->
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q6_phoneNumber6[phone]" id="input_6_phone" size="8">
            <label class="form-sub-label" for="input_6_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      
      <li class="form-line" data-type="control_radio" id="id_12">
        <label class="form-label form-label-top" id="label_12" for="input_12">Gender </label>
        <div id="cid_12" class="form-input-wide jf-required">
          <div class="form-multiple-column" data-columncount="2">
            <span class="form-radio-item">
              <span class="dragger-item">
              </span>
                <input type="radio" class="form-radio" id="input_12_0" name="q12_availabilityOf" value="male" >
              <label id="label_input_12_0" for="input_12_0"> male </label>
            </span>
            <span class="form-radio-item">
              <span class="dragger-item">
              </span>
                <input type="radio" class="form-radio" id="input_12_1" name="q12_availabilityOf" value="female" checked>
              <label id="label_input_12_1" for="input_12_1"> female </label>
            </span>
          </div>
        </div>
      </li>
      
      <li class="form-line jf-required" data-type="control_dropdown" id="id_11">
        <label class="form-label form-label-left form-label-auto" id="label_11" for="input_11">
          School
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_11" class="form-input jf-required">
             
            <select class="ui fluid dropdown" style="width:150px" id="input_11" name="q11_school" multiple size=2 name="schools">
             
             
             
             
              
           <% ArrayList<School> schools=SchoolController.getFemaleSchools(); %>
    
            <%  for(int i=0;i<schools.size();i++){ %>
            
            <option value=<%=schools.get(i).getSchool_id()%>> <%=schools.get(i).getSchool_name()%> </option>
            <%} %>
            
            
            
          </select>
        </div>
      </li>
    
      
      
      
      
<div>
    <label class="form-label form-label-left form-label-auto">Schools selected</label>
    <textarea  rows="8" cols="30" id="selected_school">   
        
    </textarea>
</div>         
      
      <li class="form-line" data-type="control_button" id="id_10">
        <div id="cid_10" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
            <button id="input_10" type="submit" class="form-submit-button">
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
  <input type="hidden" id="simple_spc" name="simple_spc" value="60080737750454-60080737750454">
  <script type="text/javascript">
  document.getElementById("si" + "mple" + "_spc").value = "60080737750454-60080737750454";
  </script>
<input type="hidden" name="event_id" value="1452318394919_60080737750454_lRaEyrA"></form><img src="./Event Registration_files/saved_resource" style="display: none;">

<div class="calendar popup" style="position: absolute; display: none;"><table><thead><tr><td colspan="7" class="title">January 2016</td></tr><tr><td class="button previousYear">«</td><td class="button previousMonth">?</td><td colspan="3" class="button todayButton">Today</td><td class="button nextMonth">?</td><td class="button nextYear">»</td></tr><tr><th class="weekend">S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th class="weekend">S</th></tr></thead><tbody><tr class="days"><td class="otherDay weekend">27</td><td class="otherDay">28</td><td class="otherDay">29</td><td class="otherDay">30</td><td class="otherDay">31</td><td class="">1</td><td class="weekend">2</td></tr><tr class="days"><td class="weekend">3</td><td class="">4</td><td class="">5</td><td class="">6</td><td class="">7</td><td class="">8</td><td class="selected today weekend">9</td></tr><tr class="days"><td class="weekend">10</td><td class="">11</td><td class="">12</td><td class="">13</td><td class="">14</td><td class="">15</td><td class="weekend">16</td></tr><tr class="days"><td class="weekend">17</td><td class="">18</td><td class="">19</td><td class="">20</td><td class="">21</td><td class="">22</td><td class="weekend">23</td></tr><tr class="days"><td class="weekend">24</td><td class="">25</td><td class="">26</td><td class="">27</td><td class="">28</td><td class="">29</td><td class="weekend">30</td></tr><tr class="days"><td class="weekend">31</td><td class="otherDay">1</td><td class="otherDay">2</td><td class="otherDay">3</td><td class="otherDay">4</td><td class="otherDay">5</td><td class="otherDay weekend">6</td></tr><tr class="days" style="display: none;"><td class="otherDay weekend">7</td><td class="otherDay">8</td><td class="otherDay">9</td><td class="otherDay">10</td><td class="otherDay">11</td><td class="otherDay">12</td><td class="otherDay weekend">13</td></tr></tbody></table></div></body></html>
  