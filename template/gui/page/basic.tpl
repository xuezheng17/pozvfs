<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 40px;
    text-align: left
    marging:24px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 430px;
    height: 50px;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table2 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_td0 {
    width: 430px;
    height: 24px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 430px;
    height: 50px;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 550px;
    height: 50px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 100px;
    height: 25px;
    text-align: center;
    background-color:#e5ecf9;
    vertical-align: middle;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 110px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    background-color:#e5ecf9;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 95px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    background-color:#e5ecf9;
    font-size: 10pt;
    font-weight: bold; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 125px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    background-color:#e5ecf9;
    font-size: 10pt;
    font-weight: bold; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td31 {
    width: 100px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td41 {
    width: 110px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td51 {
    width: 95px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td61 {
    width: 125px;
    height: 25px;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 430px;
    height: 25px;
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
      
      var gui = AbstractBasic.gui('{{$template|escape:'javascript'}}');
      new HandleBasic(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>


<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >
      <table class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0">
        <tr>
          <td class="{{$template|escape:'html'}}_td3">Visitors</td>
          <td class="{{$template|escape:'html'}}_td4">Successed</td>
          <td class="{{$template|escape:'html'}}_td5">Dropped</td>
          <td class="{{$template|escape:'html'}}_td6">Progressing</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td31" id="{{$template|escape:'html'}}_visitors_div"></td>
          <td class="{{$template|escape:'html'}}_td41" id="{{$template|escape:'html'}}_succeedVisitors_div"></td>
          <td class="{{$template|escape:'html'}}_td51" id="{{$template|escape:'html'}}_dropVisitors_div"></td>
          <td class="{{$template|escape:'html'}}_td61" id="{{$template|escape:'html'}}_progressingVisitors_div"></td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td2"></td>
  <tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td7">
     <div id="{{$template|escape:'html'}}_graphy_div"></div>
    </td>
    <td class="{{$template|escape:'html'}}_td2"></td>
  </tr>
</table>