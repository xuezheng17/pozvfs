<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 420px;
    margin: 20px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 310px;
    height: 27px;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 980px;
    height: 22px;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 980px;
    height: 250px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 36px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 8px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 155px;
    height: 27px;
    text-align: right;
    vertical-align: middle;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 310px;
    height: 27px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 179px;
    height: 27px;
    text-align: right;
    vertical-align: middle;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 980px;
    height: 10px;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 980px;
    height: 2px;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 291px;
    height: 27px;
    text-align: right;
    vertical-align: bottom;
    margin-right:15px;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 19px;
    height: 27px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td10 {
    width: 975px;
    height: 60px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td11 {
    width: 291px;
    height: 50px;
    text-align: right;
    vertical-align: bottom;
    padding-right:15px;
  }
  .{{$template|escape:'html'}}_td12 {
    width: 653px;
    height: 22px;
    padding-left:18px;
    padding-top:6px;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td13 {
    width: 85px;
    height: 22px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td14 {
    width: 75px;
    height: 22px;
    text-align: right;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td15 {
    width: 85px;
    height: 22px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td16 {
    width: 82px;
    height: 22px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td17 {
    width: 980px;
    height: 50px;
    padding-bottom:6px;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td18 {
    width: 980px;
    height: 150px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td19 {
    width: 618px;
    height: 50px;
    text-align: right;
    vertical-align: middle;
    padding-right:1px;
  }
  .{{$template|escape:'html'}}_td20 {
    width: 70px;
    height: 50px;
    text-align: right;
    vertical-align: middle;
    padding-right:1px;
  }
  .{{$template|escape:'html'}}_td21 {
    width: 82px;
    height: 50px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_inputText1{
    width: 310px;
    height: 21px;
  }
  .{{$template|escape:'html'}}_inputText2{
    width: 155px;
    height: 21px;
  }
  .{{$template|escape:'html'}}_inputText3 {
    width: 75px;
    height: 19px;
  }
  
  .{{$template|escape:'html'}}_select{
    width: 291px;
    height: 21px;
  }
  
  
  
  .{{$template|escape:'html'}}_item{
    margin:0;
    padding:0;
  }
  .{{$template|escape:'html'}}_item div{
    height:1px;
    overflow:hidden;
    border-left:1px solid #e5ecf9;
    border-right:1px solid #e5ecf9;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_item .row1{
    margin:0 5px;
    background:#e5ecf9;
  }
  .{{$template|escape:'html'}}_item .row2{
    margin:0 3px;
    border:0 2px;
  }
  .{{$template|escape:'html'}}_item .row3{
    margin:0 2px;
  }
  .{{$template|escape:'html'}}_item .row4{
    margin:0 1px;
    height:2px;
  }
</style>

<script src="jsrequest.php?script={{$template|escape:'html'}}" type="text/javascript"></script>
<script type="text/javascript">
  <!--
    if (document.addEventListener) {
      document.addEventListener('DOMContentLoaded', init, false);
    }
    window.onload = init;

    function init() {
      if (!document.getElementById || !document.createElement || !arguments || arguments.callee._loaded) {
        return;
      }
      arguments.callee._loaded = true;
      
      var gui = AbstractVisitorExist.gui('{{$template|escape:'javascript'}}');
      console.log(gui);
      //new HandlePageCustomers(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table  class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" colspan="5">
      <div class="{{$template|escape:'html'}}_item">
      <div class="row1"></div>
      <div class="row2"></div>
      <div class="row3"></div>
      <div class="row4"></div>
        <table  class="{{$template|escape:'html'}}_table3" cellPaddiing="0" cellSpacing="0" border=0>
          <tr>
            <td class="{{$template|escape:'html'}}_td12" id="{{$template|escape:'html'}}_title_label">
            </td>
            <td class="{{$template|escape:'html'}}_td13">
              <input type="button" id="{{$template|escape:'html'}}_back_button" value ="Back"></input>
            </td>
            <td class="{{$template|escape:'html'}}_td14">
              <input type="text" id="{{$template|escape:'html'}}_number_input" class="{{$template|escape:'html'}}_inputText3"></input>
            </td>
            <td class="{{$template|escape:'html'}}_td15">
              <input type="button" id="{{$template|escape:'html'}}_jump_button" value = "Jump"></input>
            </td>
            <td class="{{$template|escape:'html'}}_td16">
              <input type="button" id="{{$template|escape:'html'}}_next_button" value = "Next"></input>
            </td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2"colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Wedding Date:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_weddingDay_input" class="{{$template|escape:'html'}}_inputText2"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Bride Name:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_brideName_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Groom Name:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_groomName_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Address:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_brideAddress_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Address:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_groomAddress_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Phone:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_bridePhone_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Phone:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_groomPhone_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Mobile:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_brideMobile_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Mobile:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_groomMobile_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Email:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_brideEmail_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Email:
    </td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_groomEmail_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td7" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Culture Background:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <table  class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td8">
            <input type="select" id="{{$template|escape:'html'}}_culturalBackground_select" class="{{$template|escape:'html'}}_select"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td9">
          <img src="image/add.png" id="{{$template|escape:'html'}}_culturalBackgroundAdd_button" ></img>
          </td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Ceremony Location:</td>
    <td class="{{$template|escape:'html'}}_td4">
    <table  class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
      <tr>
        <td class="{{$template|escape:'html'}}_td8">
          <input type="select" id="{{$template|escape:'html'}}_ceremoneyLocation_select" class="{{$template|escape:'html'}}_select"></input>
        </td>
        <td class="{{$template|escape:'html'}}_td9">
          <img src="image/add.png" id="{{$template|escape:'html'}}_ceremoneyLocationAdd_button" ></img>
        </td>
      </tr>
    </table>
  </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Reception Location:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <table  class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td8">
            <input type="select" id="{{$template|escape:'html'}}_receptionLocation_select" class="{{$template|escape:'html'}}_select"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td9">
            <img src="image/add.png" id="{{$template|escape:'html'}}_receptionLocationAdd_button" ></img>
          </td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Source:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <table  class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td8">
            <input type="select" id="{{$template|escape:'html'}}_source_select" class="{{$template|escape:'html'}}_select"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td9">
            <img src="image/add.png" id="{{$template|escape:'html'}}_sourceAdd_button" ></img>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td7" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">First Visiting Method:</td>
    <td class="{{$template|escape:'html'}}_td8">
      <input type="text" id="{{$template|escape:'html'}}_fristVisitingMethod_button" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">First Visiting Date:</td>
    <td class="{{$template|escape:'html'}}_td4">
      <input type="text" id="{{$template|escape:'html'}}_fristVisitingDate_button" class="{{$template|escape:'html'}}_inputText2"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td11" colspan="4">
      <input type="button" id="{{$template|escape:'html'}}_update_button" value = "Update"></input>
    </td>
  </tr>
</table>

<table  class="{{$template|escape:'html'}}_table4" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td17" colspan="6"> Operation </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td18" id="{{$template|escape:'html'}}_operations_table" colspan="6">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td19">
    </td>
    <td class="{{$template|escape:'html'}}_td20">
      <input type="button" id="{{$template|escape:'html'}}_email_button" value = "Email"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td20">
      <input type="button" id="{{$template|escape:'html'}}_call_button" value = "Call"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td20">
      <input type="button" id="{{$template|escape:'html'}}_visit_button" value = "Visit"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td20">
      <input type="button" id="{{$template|escape:'html'}}_succeed_button" value = "Succeed"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td21">
      <input type="button" id="{{$template|escape:'html'}}_drop_button" value = "Drop"></input>
    </td>
  </tr>
</table>
