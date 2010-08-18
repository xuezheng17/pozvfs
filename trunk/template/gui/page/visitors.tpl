<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    margin: 10px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 480px;
    height: 25px;
    text-align:left;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 492px;
    height: 25px;
    margin-left:-5px;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 980px;
  }
  .{{$template|escape:'html'}}_table5 {
    width: 980px;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height:5px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 125px;
    height: 22px;
    text-align: left;
    padding-left:13px;
    vertical-align: middle;
    font-size: 9pt;
    font-weight: bold;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 90px;
    padding-left:36px;
    text-align: left;
    font-size:9pt;
    height: 25px;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 854px;
    height: 25px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 25px;
    height: 25px;
    text-align: center;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 30px;
    height: 25px;
    text-align: left;
    vertical-align: middle;
    font-size: 9pt;
    color: #999999; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 28px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    font-size: 9pt;
    color: #999999; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td7 {
    width:18px
    height: 35px;
    text-align:left;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 105px;
    height: 35px;
    text-align: left;
    vertical-align: middle;
    padding-left:5px;
    font-size: 9pt;
    font-weight: bold;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td9 {
    width:980px
    height: 45px;
    text-align:left;
    padding-left:645px;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td10 {
    width:980px;
    padding:5px 30px 5px 0;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_inputText {
    width: 210px;
    height: 16px;
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
      
      var gui = AbstractVisitors.gui('{{$template|escape:'javascript'}}');
      new HandleVisitors(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="6"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" colSpan="2">Any of these criteria</td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Visitor No:</td>
    <td class="{{$template|escape:'html'}}_td3">
       <input type="text" id="{{$template|escape:'html'}}_visitorNo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Phone:</td>
    <td class="{{$template|escape:'html'}}_td3">
       <input type="text" id="{{$template|escape:'html'}}_phone_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Name:</td>
    <td class="{{$template|escape:'html'}}_td3">
       <input type="text" id="{{$template|escape:'html'}}_name_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Email:</td>
    <td class="{{$template|escape:'html'}}_td3">
       <input type="text" id="{{$template|escape:'html'}}_email_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="6"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" colSpan="2">Or any of these date factors</td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Wedding Date:</td>
    <td class="{{$template|escape:'html'}}_td3" align="left">
      <table class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td5">from</td>
          <td>
            <input type="text" id="{{$template|escape:'html'}}_weddingDayFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td6">to</td>
          <td>
            <input type="text" id="{{$template|escape:'html'}}_weddingDayTo_input" class="{{$template|escape:'html'}}_inputText"></input>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td2">Created Date:</td>
    <td class="{{$template|escape:'html'}}_td3" align="left">
      <table class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td5">from</td>
          <td>
            <input type="text" id="{{$template|escape:'html'}}_createdDateFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td6">to</td>
          <td>
            <input type="text" id="{{$template|escape:'html'}}_createdDateTo_input" class="{{$template|escape:'html'}}_inputText"></input>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" align="left" colSpan="2">
      <table class="{{$template|escape:'html'}}_table3" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td7">
            <input type="checkbox" id = "{{$template|escape:'html'}}_inProgressingOnly_input"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td8">In Processing</td>
          <td class="{{$template|escape:'html'}}_td7">
            <input type="checkbox" id = "{{$template|escape:'html'}}_succeededOnly_input"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td8">Succeeded </td>
          <td class="{{$template|escape:'html'}}_td7">
            <input type="checkbox" id = "{{$template|escape:'html'}}_failedOnly_input"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td8">Failed</td>
          <td class="{{$template|escape:'html'}}_td7">
            <input type="checkbox" id = "{{$template|escape:'html'}}_deletedOnly_input"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td8">Deleted</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td9" colSpan="2">
      <input type="button" value="Search" id = "{{$template|escape:'html'}}_search_button"></input>
    </td>
  </tr>
</table>

<table class="{{$template|escape:'html'}}_table4" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td10" id="{{$template|escape:'html'}}_page_div">
  </tr>
</table>

<table id="{{$template|escape:'html'}}_visitors_table" class="{{$template|escape:'html'}}_table5" cellPaddiing="0" cellSpacing="0" border=0>
</table>