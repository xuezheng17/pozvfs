<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 143px;
    margin: 20px 0 0 0;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 980px;
    height: 210px;
    margin: 20px 0 0 0;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 7px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 122px;
    height: 30px;
    text-align: right;
    vertical-align: bottom;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 223px;
    height: 30px;
    text-align: center;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 102px;
    height: 30px;
    text-align: right;
    vertical-align: middle;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 32px;
    height: 28px;
    text-align: center;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 275px;
    height: 28px;
    text-align: left;
    vertical-align: bottom;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 268px;
    height: 210px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 980px;
    height: 210px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_inputText{
    width: 210px;
    height: 20px;
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
      
      var gui = GuiPageCustomers.instance('{{$template|escape:'javascript'}}');
      new HandlePageCustomers(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td0"></td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">
      Visitor No:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_visitorNo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3>
      Name:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_name_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
    <td class="{{$template|escape:'html'}}_td4">
      <input type = "checkbox" id="{{$template|escape:'html'}}_inProgressingOnly_input" >
    </td>
    <td class="{{$template|escape:'html'}}_td5">
      In Progressing Only
    </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">
      Phone:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_phone_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3>
      Email:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_email_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">
      W/D From:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_weddingDayFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3>
      W/D To:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_weddingDayTo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">
      Created From:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_createdDateFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3>
      Created To:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_createdDateTo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
    <td class="{{$template|escape:'html'}}_td6">
      <input type="button" id="{{$template|escape:'html'}}_search_button" value = "Search"></input>
    </td>
  </tr>
</table>
<table class="{{$template|escape:'html'}}_table2"  cellPaddiing="0" cellSpacing="0" >
  <tr>
    <td class="{{$template|escape:'html'}}_td7">
      <div id="{{$template|escape:'html'}}_visitors_table"></div>
    </td>
  </tr>
</table>
  