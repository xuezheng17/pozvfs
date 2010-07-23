<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 200px;
    text-align: left
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 20px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 430px;
    height: 180px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 550px;
    height: 180px;
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
      
      var gui = AbstractUsers.gui('{{$template|escape:javascript}}');
      console.log(gui);
      //new HandleSignIn(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=1>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colspan="2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" id="{{$template|escape:'html'}}_users_table" ></td>
    <td class="{{$template|escape:'html'}}_td2" ></td>
  </tr>
</table>