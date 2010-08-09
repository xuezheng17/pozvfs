<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 30px;
    margin: 0 0 50px 0;
  }
  .{{$template|escape:'html'}}_td0 {
    padding: 20px 0 10px 0;
    width: 980px;
    vertical-align:center;
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
    width: 200px;
    height: 20px;
    font-size: 12px;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_title {
    padding: 0 5px 0 0;
    height: 20px;
    font-size: 13px;
    font-weight: bold;
    font-family: Arial;
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
    <td id="{{$template|escape:'html'}}_sort_div" class="{{$template|escape:'html'}}_td0">
      <span class="{{$template|escape:'html'}}_title">Sort by</span>
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
