<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 300px;
    margin: 20px 0 0 0;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 50px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 240px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 980px;
    height: 10px;
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
      
      var gui = AbstractFollowUp.gui('{{$template|escape:'javascript'}}');
      console.log(gui);
      //new HandleFollowUp(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" id= "{{$template|escape:'html'}}_page_div" ></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" id= "{{$template|escape:'html'}}_visitors_div" ></td>
  </tr>
</table>
