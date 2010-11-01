<style>
  .{{$template|escape:'html'}}_table1 {
    width: 900px;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 712px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 900px;
    height: 46px;
    vertical-align: top;
    text-align: left;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 900px;
    height: 105px;
    vertical-align: top;
    text-align: left;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 712px;
    height: 440px;
    vertical-align: top;
    text-align: left;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 712px;
    height: 200px;
    vertical-align: top;
    text-align: left;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 168px;
    height: 50px;
    vertical-align: top;
    text-align: right;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 712px;
    height: 90px;
    vertical-align: top;
    text-align: left;
  }
  .{{$template|escape:'html'}}_td7{
    font-family: Times New Roman;
    color: #694247;
    font-size: 10px;
    font-weight: bold;
    height: 24px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td8{
    height: 24px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 712px;
    height: 150px;
    vertical-align: top;
    text-align: left;
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
      
      var gui = AbstractPageStatReception.gui('{{$template|escape:'javascript'}}');
      new HandlePageStatReception(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPadding="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td1">{{include file="pagemanager/basemenus3.tpl"}}</td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">{{include file="pagecommon/elemstatreception.tpl"}}</td>
  </tr>
</table>
