<style>
  .{{$template|escape:'html'}}_table0 {
    margin-top: 20px;
    width: 980px;
    text-align: left;
  }
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    text-align: left;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table1 td{
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_td1,.{{$template|escape:'html'}}_td3,
  .{{$template|escape:'html'}}_td6 {
    height: 24px;
    background-color: #E5ECF9;
    padding-left: 5px;
  }
  .{{$template|escape:'html'}}_td1 a,.{{$template|escape:'html'}}_td2 a,.{{$template|escape:'html'}}_td3 a,
  .{{$template|escape:'html'}}_td4 a,.{{$template|escape:'html'}}_td5 a,.{{$template|escape:'html'}}_td6 a{
    font-weight: bold;
    font-size: 12px;
    color: #0000cc;
  }
  .{{$template|escape:'html'}}_td1 {
    width:80px;
    white-space: nowrap;
  }
  .{{$template|escape:'html'}}_td3 {
    width:85px;
    white-space: nowrap;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 35px;
    text-align: center;
    background-color: #E5ECF9;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 80px;
    white-space: nowrap;
    text-align: center;
    background-color: #E5ECF9;
  }
  .{{$template|escape:'html'}}_td5 {
    background-color: #E5ECF9;
    text-align: center;
    width: 45px;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 555px;
    font-weight: bold;
    font-size: 12px;
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
      
      var gui = AbstractProcessing.gui('{{$template|escape:javascript}}');
      new HandleProcessing(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table0" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td id="{{$template|escape:'html'}}_page_div">
  </tr>
</table>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" id = "{{$template|escape:'html'}}_main_table">
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
      <a href="#" id = "{{$template|escape:'html'}}_visitNo_button"> No.
    </td>
    <td class="{{$template|escape:'html'}}_td1">
      <a href="#" id = "{{$template|escape:'html'}}_brideName_button">Bride Name
    </td>
    <td class="{{$template|escape:'html'}}_td3">
      <a href="#" id = "{{$template|escape:'html'}}_groomName_button">Groom Name
    </td>
    <td class="{{$template|escape:'html'}}_td5"> 
      <a href="#" id = "{{$template|escape:'html'}}_visited_button">Visited
    </td>
    <td class="{{$template|escape:'html'}}_td4">
      <a href="#" id = "{{$template|escape:'html'}}_weddingDay_button">Wedding Day
    </td>
    <td class="{{$template|escape:'html'}}_td4">
      <a href="#" id = "{{$template|escape:'html'}}_lastUpdated_button">Last Updated
    </td>
    <td class="{{$template|escape:'html'}}_td5">
      <a href="#" id = "{{$template|escape:'html'}}_number_button">Actions
    </td>
    <td class="{{$template|escape:'html'}}_td6">Office Note</td>
  <tr>
</table>