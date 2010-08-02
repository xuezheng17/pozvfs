<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 30px;
    margin: 13px 0 50px 0;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 480px;
    height: 10px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 40px;
    text-align: center;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 980px;
    height: 5px;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 500px;
    height: 10px;
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
      
      var gui = AbstractFollowUp.gui('{{$template|escape:'javascript'}}');
      new HandleFollowUp(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1"></td>
    <td class="{{$template|escape:'html'}}_td4" id= "{{$template|escape:'html'}}_page_div" ></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" id= "{{$template|escape:'html'}}_visitors_div" colSpan="2" ></td>
  </tr>
</table>
