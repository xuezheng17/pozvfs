<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 30px;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 480px;
    height: 30px;
    vertical-align:top;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height:1px;
    padding-right:22px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 40px;
    text-align: center;
  }
  .{{$template|escape:'html'}}_select {
    width: 150px;
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
      
      var gui = AbstractFollowUp.gui('{{$template|escape:'javascript'}}');
      new HandleFollowUp(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0">
      <select id="{{$template|escape:'html'}}_sort_select" class="{{$template|escape:'html'}}_select"></select>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" id= "{{$template|escape:'html'}}_page_div" align="right"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" id= "{{$template|escape:'html'}}_visitors_div" colSpan="2" ></td>
  </tr>
</table>
