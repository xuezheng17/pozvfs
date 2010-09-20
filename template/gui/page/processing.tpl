<style>
  .{{$template|escape:'html'}}_table1 {
    margin-top: 20px;
    width: 980px;
    text-align: left;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table1 td{
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_td1,.{{$template|escape:'html'}}_td2,.{{$template|escape:'html'}}_td3,
  .{{$template|escape:'html'}}_td4 {
    height: 24px;
    background-color: #E5ECF9;
    padding-left: 15px;
  }
  .{{$template|escape:'html'}}_td1 a,.{{$template|escape:'html'}}_td2 a,.{{$template|escape:'html'}}_td3 a,
  .{{$template|escape:'html'}}_td4 a{
    font-weight: bold;
    font-size: 12px;
    text-decoration:none;
    outline: none;
    color: #0000cc;
  }
  .{{$template|escape:'html'}}_td1 {
    width:160px;
  }
  .{{$template|escape:'html'}}_td2 {
    width:90px;
  }
  .{{$template|escape:'html'}}_td3 {
    width:150px;
  }
  .{{$template|escape:'html'}}_td4 {
    width:180px;
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

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" id = "{{$template|escape:'html'}}_main_table">
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      <a href="#" id = "{{$template|escape:'html'}}_brideName_button">Bride Name
    </td>
    <td class="{{$template|escape:'html'}}_td1">
      <a href="#" id = "{{$template|escape:'html'}}_groomName_button">Groom Name
    </td>
    <td class="{{$template|escape:'html'}}_td2"> 
      <a href="#" id = "{{$template|escape:'html'}}_visited_button">Visited
    </td>
    <td class="{{$template|escape:'html'}}_td3">
      <a href="#" id = "{{$template|escape:'html'}}_weddingDay_button">Wedding Day
    </td>
    <td class="{{$template|escape:'html'}}_td3">
      <a href="#" id = "{{$template|escape:'html'}}_lastUpdated_button">Last Updated
    </td>
    <td class="{{$template|escape:'html'}}_td4">
      <a href="#" id = "{{$template|escape:'html'}}_number_button">No. of Follow Up Actions
    </td>
  <tr>
</table>