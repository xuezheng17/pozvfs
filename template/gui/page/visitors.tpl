<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 143px;
    margin: 20px 0 0 0;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 980px;
    height: 10px;
    margin: 10px 0 0 0;
    border:solid 0px #ccc;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 980px;
    height: 30px;
    margin: 0px 0 0 0;
    border:solid 0px #ccc;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 9px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 122px;
    height: 30px;
    text-align: right;
    vertical-align: bottom;
    padding-bottom:7px;
    font-size: 11pt;
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
    vertical-align: bottom;
    padding-bottom:7px;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 25px;
    height: 28px;
    text-align: center;
    vertical-align: bottom;
    padding-bottom:4px;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 220px;
    height: 28px;
    text-align: left;
    vertical-align: bottom;
    padding-bottom:9px;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 208px;
    height: 60px;
    text-align: right;
    vertical-align: bottom;
    padding:0 30px 20px 0;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 500px;
    height: 10px;
    padding-right:22px;
  }
  .{{$template|escape:'html'}}_td71 {
    width: 480px;
    height: 10px;
    padding-right:22px;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 980px;
    height: 11px;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 980px;
    height: 50px;
  }
  .{{$template|escape:'html'}}_inputText {
    width: 210px;
    height: 17px;
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
    <td class="{{$template|escape:'html'}}_td1">Visitor No:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_visitorNo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td  class="{{$template|escape:'html'}}_td3">Name:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_name_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
    <td class="{{$template|escape:'html'}}_td4">
      <input type = "checkbox" id="{{$template|escape:'html'}}_inProgressingOnly_input" >
    </td>
    <td class="{{$template|escape:'html'}}_td5">In Progressing Only</td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">Phone:</td>
    <td class="{{$template|escape:'html'}}_td2">
      <input type="text" id="{{$template|escape:'html'}}_phone_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3"> Email:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_email_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">W/D From:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_weddingDayFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3">
      W/D To:
    </td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_weddingDayTo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
    <td class="{{$template|escape:'html'}}_td6" colspan="2" rowSpan="2">
    <input type="button" id="{{$template|escape:'html'}}_search_button" style="width:65px;font-family:Arial;font-size:10pt;" value = "Search"></input>
  </td>
  </tr>
  <tr>
    <td  class="{{$template|escape:'html'}}_td1">Created From:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_createdDateFrom_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td3">Created To:</td>
    <td class="{{$template|escape:'html'}}_td2">
       <input type="text" id="{{$template|escape:'html'}}_createdDateTo_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td8" colSpan="6"></td>
  </tr>
</table>
<table class="{{$template|escape:'html'}}_table2"  cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td7"></td>
    <td class="{{$template|escape:'html'}}_td71" id="{{$template|escape:'html'}}_page_div"></td>
  </tr>
</table>
<table class="{{$template|escape:'html'}}_table3"  cellPaddiing="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td9" id="{{$template|escape:'html'}}_visitors_table">
    </td>
  </tr>
</table>
  