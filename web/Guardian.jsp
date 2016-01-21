<%-- 
    Document   : Guardian
    Created on : Jan 7, 2016, 10:43:29 AM
    Author     : Hashini
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- saved from url=(0038)https://form.jotform.me/60048717261453 -->
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="HandheldFriendly" content="true">
<title>Guardian Application Form</title>
<link href="./Guardian Info_files/formCss.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="./Guardian Info_files/nova.css">
<link type="text/css" media="print" rel="stylesheet" href="./Guardian Info_files/printForm.css">
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
        width:600px;
        color:#555 !important;
        font-family:'Lucida Grande','Lucida Sans Unicode','Lucida Sans','Verdana','Tahoma','sans-serif';
        font-size:14px;
    }
</style>


<script type="text/javascript">
   JotForm.init(function(){
      JotForm.alterTexts({"alphabetic":"This field can only contain letters","alphanumeric":"This field can only contain letters and numbers.","confirmClearForm":"Are you sure you want to clear the form","email":"Enter a valid e-mail address","incompleteFields":"There are incomplete required fields. Please complete them.","lessThan":"Your score should be less than","numeric":"This field can only contain numeric values","pleaseWait":"Please wait...","required":"This field is required.","uploadExtensions":"You can only upload following files:","uploadFilesize":"File size cannot be bigger than:"});
	JotForm.clearFieldOnHide="disable";
	JotForm.onSubmissionError="jumpToSubmit";
   });
</script>

<script>
    function changeRelationship(){
        var index=document.form_60048717261453.q29_relationship.selectedIndex;
        var value2=document.form_60048717261453.q29_relationship.options[index].value;
        document.getElementByName("relationsip").value=value2;
        
    }
    
    
    
</script>



</head>
<body>
<form class="jotform-form" action="Student_Application.jsp" method="post" name="form_60048717261453" id="60048717261453" accept-charset="utf-8" novalidate="true">
  <input type="hidden" name="formID" value="60048717261453">
  <div class="form-all">
    <ul class="form-section page-section">
      <li id="cid_28" class="form-input-wide" data-type="control_head">
        <div class="form-header-group">
          <div class="header-text httal htvam">
            <h2 id="header_28" class="form-header">
              Guardian Information
            </h2>
          </div>
        </div>
      </li>
      <li class="form-line jf-required" data-type="control_fullname" id="id_4">
        <label class="form-label form-label-left form-label-auto" id="label_4" for="input_4">
          Name
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_4" class="form-input jf-required">
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox validate[required]" type="text" size="10" name="q4_name[first]" id="first_4">
            <label class="form-sub-label" for="first_4" id="sublabel_first" style="min-height: 13px;"> First Name </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="text" size="10" name="q4_name[middle]" id="middle_4">
            <label class="form-sub-label" for="middle_4" id="sublabel_middle" style="min-height: 13px;"> Middle Name </label>
          </span>
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox validate[required]" type="text" size="15" name="q4_name[last]" id="last_4">
            <label class="form-sub-label" for="last_4" id="sublabel_last" style="min-height: 13px;"> Last Name </label>
          </span>
        </div>
      </li>
      
      <div id="cid_31" class="form-input jf-required">
          <span class="form-sub-label-container" style="vertical-align: top"> 
      <label class="form-label form-label-left form-label-auto" id="label_4.5" for="input_4.5">NIC Number</label>
      <input class="form-textbox validate[required]" type="text" size="20" name="NIC" id="last_4.5">
      </span>   
      </div>
      
      
      
      <li class="form-line jf-required" data-type="control_dropdown" id="id_29">
        <label class="form-label form-label-left form-label-auto" id="label_29" for="input_29">
          Relationship
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_29" class="form-input jf-required">
            <select class="form-dropdown validate[required]" style="width:150px" id="input_29" name="q29_relationship"  onchange="changeRelationship()" >
            <option value="">  </option>
            <option selected="selected" value="Father"> Father </option>
            <option value="Mother"> Mother </option>
            <option value="Guardian"> Guardian </option>
          </select>
        </div>
           
          
          
          <input type="hidden" name="relationship" value="father">
          
     
      
      </li>
      <li class="form-line jf-required" data-type="control_address" id="id_5">
        <label class="form-label form-label-left form-label-auto" id="label_5" for="input_5">
          Address (Home)
          <span class="form-required">
            *
          </span>
        </label>
        <div id="cid_5" class="form-input jf-required">
          <table summary="" undefined="" class="form-address-table" border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox validate[required] form-address-line" type="text" name="q5_addresshome[addr_line1]" id="input_5_addr_line1">
                  <label class="form-sub-label" for="input_5_addr_line1" id="sublabel_5_addr_line1" style="min-height: 13px;"> Address Line 1 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-line" type="text" name="q5_addresshome[addr_line2]" id="input_5_addr_line2" size="46">
                  <label class="form-sub-label" for="input_5_addr_line2" id="sublabel_5_addr_line2" style="min-height: 13px;"> Address Line 2 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox validate[required] form-address-city" type="text" name="q5_addresshome[city]" id="input_5_city" size="21">
                  <label class="form-sub-label" for="input_5_city" id="sublabel_5_city" style="min-height: 13px;"> Street </label>
                </span>
              </td>
              <td>
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox validate[required] form-address-state" type="text" name="q5_addresshome[state]" id="input_5_state" size="22">
                  <label class="form-sub-label" for="input_5_state" id="sublabel_5_state" style="min-height: 13px;"> City </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%" style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox validate[required] form-address-postal" type="text" name="q5_addresshome[postal]" id="input_5_postal" size="10">
                  <label class="form-sub-label" for="input_5_postal" id="sublabel_5_postal" style="min-height: 13px;"> Postal / Zip Code </label>
                </span>
              </td>
              <td style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <select class="form-dropdown validate[required] form-address-country" defaultcountry="Sri Lanka" name="q5_addresshome[country]" id="input_5_country">
                    <option value="" selected=""> Please Select </option>
                    <option value="United States"> United States </option>
                    <option value="Afghanistan"> Afghanistan </option>
                    <option value="Albania"> Albania </option>
                    <option value="Algeria"> Algeria </option>
                    <option value="American Samoa"> American Samoa </option>
                    
                    <option value="other"> Other </option>
                  </select>
                  <label class="form-sub-label" for="input_5_country" id="sublabel_5_country" style="min-height: 13px;"> Country </label>
                </span>
              </td>
            </tr>
          </tbody></table>
        </div>
      </li>
      <li class="form-line" data-type="control_phone" id="id_6">
        <label class="form-label form-label-left form-label-auto" id="label_6" for="input_6"> Home Number </label>
        <div id="cid_6" class="form-input jf-required">
          
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q6_homeNumber[phone]" id="input_6_phone" size="8">
            <label class="form-sub-label" for="input_6_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      <li class="form-line" data-type="control_phone" id="id_7">
        <label class="form-label form-label-left form-label-auto" id="label_7" for="input_7"> Cellular Number 1 </label>
        <div id="cid_7" class="form-input jf-required">
          
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q7_cellularNumber7[phone]" id="input_7_phone" size="8">
            <label class="form-sub-label" for="input_7_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      <li class="form-line" data-type="control_phone" id="id_30">
        <label class="form-label form-label-left form-label-auto" id="label_30" for="input_30"> Cellular Number 2 </label>
        <div id="cid_30" class="form-input jf-required">
          
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q30_cellularNumber30[phone]" id="input_30_phone" size="8">
            <label class="form-sub-label" for="input_30_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      <li class="form-line" data-type="control_textbox" id="id_32">
        <label class="form-label form-label-left form-label-auto" id="label_32" for="input_32"> Occupation </label>
        <div id="cid_32" class="form-input jf-required">
          <input type="text" class=" form-textbox" data-type="input-textbox" id="input_32" name="q32_occupation" size="20" value="">
        </div>
      </li>
      <li class="form-line" data-type="control_address" id="id_33">
        <label class="form-label form-label-left form-label-auto" id="label_33" for="input_33"> Address (Work) </label>
        <div id="cid_33" class="form-input jf-required">
          <table summary="" undefined="" class="form-address-table" border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-line" type="text" name="q33_addresswork[addr_line1]" id="input_33_addr_line1">
                  <label class="form-sub-label" for="input_33_addr_line1" id="sublabel_33_addr_line1" style="min-height: 13px;"> Address Line 1 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-line" type="text" name="q33_addresswork[addr_line2]" id="input_33_addr_line2" size="46">
                  <label class="form-sub-label" for="input_33_addr_line2" id="sublabel_33_addr_line2" style="min-height: 13px;"> Address Line 2 </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-city" type="text" name="q33_addresswork[city]" id="input_33_city" size="21">
                  <label class="form-sub-label" for="input_33_city" id="sublabel_33_city" style="min-height: 13px;"> Street </label>
                </span>
              </td>
              <td>
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-state" type="text" name="q33_addresswork[state]" id="input_33_state" size="22">
                  <label class="form-sub-label" for="input_33_state" id="sublabel_33_state" style="min-height: 13px;"> City </label>
                </span>
              </td>
            </tr>
            <tr>
              <td width="50%" style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <input class="form-textbox form-address-postal" type="text" name="q33_addresswork[postal]" id="input_33_postal" size="10">
                  <label class="form-sub-label" for="input_33_postal" id="sublabel_33_postal" style="min-height: 13px;"> Postal / Zip Code </label>
                </span>
              </td>
              <td style="display: none;">
                <span class="form-sub-label-container" style="vertical-align: top">
                  <select class="form-dropdown form-address-country" defaultcountry="" name="q33_addresswork[country]" id="input_33_country">
                    <option value="" selected=""> Please Select </option>
                    <option value="United States"> United States </option>
                    <option value="Afghanistan"> Afghanistan </option>
                 
                  <option value="Sri Lanka"> Sri Lanka </option>
                 
                    <option value="other"> Other </option>
                  </select>
                  <label class="form-sub-label" for="input_33_country" id="sublabel_33_country" style="min-height: 13px;"> Country </label>
                </span>
              </td>
            </tr>
          </tbody></table>
        </div>
      </li>
      <li class="form-line" data-type="control_phone" id="id_9">
        <label class="form-label form-label-left form-label-auto" id="label_9" for="input_9"> Work Number 1 </label>
        <div id="cid_9" class="form-input jf-required">
        
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q9_workNumber9[phone]" id="input_9_phone" size="8">
            <label class="form-sub-label" for="input_9_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      <li class="form-line" data-type="control_phone" id="id_31">
        <label class="form-label form-label-left form-label-auto" id="label_31" for="input_31"> Work Number 2 </label>
        <div id="cid_31" class="form-input jf-required">
          
          <span class="form-sub-label-container" style="vertical-align: top">
            <input class="form-textbox" type="tel" name="q31_workNumber[phone]" id="input_31_phone" size="8">
            <label class="form-sub-label" for="input_31_phone" id="sublabel_phone" style="min-height: 13px;"> Phone Number </label>
          </span>
        </div>
      </li>
      <li class="form-line">
        <div id="cid_34" class="form-input-wide">
          <div style="margin-left:156px" class="form-buttons-wrapper">
              <input type="submit" class="form-submit-button" value="Submit"></input>
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="">
      </li>
    </ul>
  </div>
  </form>

</body></html>