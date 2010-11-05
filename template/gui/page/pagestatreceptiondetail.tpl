<style>
  .{{$template|escape:'html'}}_div1 {
    width: 350px;
  }
  .{{$template|escape:'html'}}_table1 {
    width: 350px;
    margin: 100px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 350px;
    height: 24px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 350px;
    height: 40px;
    vertical-align: middle;
    text-align: center;
    font-size: 12px;
    font-family: Times New Roman;
    font-weight: bold;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 350px;
    vertical-align: top;
    text-align: center;
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
      
      var gui = AbstractPageStatReceptionDetail.gui('{{$template|escape:'javascript'}}');
      new HandlePageStatReceptionDetail(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<div class="{{$template|escape:'html'}}_div1">
  <table class="{{$template|escape:'html'}}_table1" cellPadding="0" cellSpacing="0">
    <tr>
      <td class="{{$template|escape:'html'}}_td1" id="{{$template|escape:'html'}}_title_div"></td>
    </tr>
    <tr>
      <td class="{{$template|escape:'html'}}_td2">
        <table class="{{$template|escape:'html'}}_table2" cellPadding="0" cellSpacing="0" id="{{$template|escape:'html'}}_main_table"></table>
      </td>
    </tr>
  </table>
</div>