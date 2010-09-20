<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 350px;
    margin: 18px 0 70px 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 310px;
    height: 23px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 32px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 6px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 157px;
    height: 25px;
    text-align: right;
    vertical-align: middle;
    font-size: 10pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
    padding: 1px 5px 0 0;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 310px;
    height: 25px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 179px;
    height: 25px;
    text-align: right;
    vertical-align: middle;
    font-size: 10pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
    padding: 1px 5px 0px 0;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 980px;
    height: 12px;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 980px;
    height: 2px;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 291px;
    height: 23px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 19px;
    height: 23px;
    text-align: left;
    vertical-align: bottom;
    cursor: pointer;
  }
  .{{$template|escape:'html'}}_td10 {
    width: 975px;
    height: 60px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td11 {
    width: 291px;
    height: 25px;
    text-align: right;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td12 {
    width: 24px;
    height: 1px;
  }
  .{{$template|escape:'html'}}_td13 {
    width: 980px;
    height: 25px;
    padding-bottom:8px;
    font-size: 12pt;
    font-weight: bold;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td30 {
    width: 157px;
    text-align: right;
    vertical-align: top;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    padding: 5px 5px 0 0;
  }
  .{{$template|escape:'html'}}_inputText1{
    width: 309px;
    height: 16px;
  }
  .{{$template|escape:'html'}}_inputText2{
    width: 172px;
    height: 16px;
  }
  .{{$template|escape:'html'}}_inputText3{
    width: 172px;
    height: 16px;
  }
  .{{$template|escape:'html'}}_textArea{
    vertical-align: top;
    width: 810px;
    height: 90px;
  }
  .{{$template|escape:'html'}}_select{
    width: 291px;
    height: 22px;
  }
  .{{$template|escape:'html'}}_select2{
    width: 314px;
    height: 22px;
  }
  .{{$template|escape:'html'}}_item p{
    border-left:1px solid #e5ecf9;
    border-right:1px solid #e5ecf9;
    height:18px;
    margin:0;
    background-color:#e5ecf9;
    text-align: left;
    padding-left:15px;
    padding-top:2px;
    font-size: 10pt;
    font-weight: 700;
    font-family: Arial;
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
      
      var gui = AbstractVisitorNew.gui('{{$template|escape:'javascript'}}');
      new HandleVisitorNew(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
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
         <p>CUSTOMER &nbsp INFORMATION</p>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2"colspan="5">
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Wedding Day:</td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_weddingDay_input" class="{{$template|escape:'html'}}_inputText2"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td5">First Contact Date:</td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_fristVisitingDate_input" class="{{$template|escape:'html'}}_inputText3"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3">First Contact Method:</td>
    <td class="{{$template|escape:'html'}}_td8">
       <select id="{{$template|escape:'html'}}_fristVisitingMethod_select" class="{{$template|escape:'html'}}_select2"></select>
    </td>
  </tr>
  <tr><td style="padding: 20px 0 0 0;"></td></tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">Bride Name:</td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_brideName_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td5">Groom Name:</td>
    <td class="{{$template|escape:'html'}}_td4">
       <input type="text" id="{{$template|escape:'html'}}_groomName_input" class="{{$template|escape:'html'}}_inputText1"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td12"></td>
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
    <td class="{{$template|escape:'html'}}_td5">Email:</td>
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
            <select id="{{$template|escape:'html'}}_culturalBackground_select" class="{{$template|escape:'html'}}_select"></select>
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
          <select id="{{$template|escape:'html'}}_ceremoneyLocation_select" class="{{$template|escape:'html'}}_select"></select>
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
            <select id="{{$template|escape:'html'}}_receptionLocation_select" class="{{$template|escape:'html'}}_select"></select>
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
          <select id="{{$template|escape:'html'}}_source_select" class="{{$template|escape:'html'}}_select"></select>
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
    <td class="{{$template|escape:'html'}}_td30"> Office Note: </td>
    <td colspan="4">
      <textarea id="{{$template|escape:'html'}}_officerNote_input" class="{{$template|escape:'html'}}_textArea"></textarea>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td11" colspan="4">
      <input type="button" id="{{$template|escape:'html'}}_save_button" style = "width:66px;font-family:Arial;font-size:9pt;" value = "Add"></input>
    </td>
  </tr>
</table>
