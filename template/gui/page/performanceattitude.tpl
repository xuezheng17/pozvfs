<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    text-align: left;
    margin: 0 0 50px 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 711px;
    height: 25px;
    font-size: 10pt;
    font-family: Arial;
    text-align: left;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table2 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_table3 {
    height: 28px;
    border:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 240px;
    margin:13px 0 0 0;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 18px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 70px;
    padding-right:3px;
    padding-left:18px;
    height: 28px;
    text-align:right;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    white-space:nowrap;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 162px;
    height: 28px;
    text-align:left;
    vertical-align:middle;
    padding-right:30px;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td3 {
    height: 28px;
    width:138px;
    text-align: center;
    vertical-align: middle;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 980px;
    height: 28px;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 770px;
    height: 25px;
    padding-top:15px;
    vertical-align:top
  }
  .{{$template|escape:'html'}}_td6 {
    width: 29px;
    height: 25px;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 240px;
    height: 30px;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 237px;
    height: 25px;
    text-align:center;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 240px;
    height: 20px;
    text-align:left;
    padding-left:25px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td10 {
    width: 240px;
    height: 30px;
    text-align:left;
    padding-left:25px;
    padding-bottom:3px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:bottom;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td11 {
    width:240px;
    height:50px;
    text-align:right;
    padding-right:21px;
    vertical-align:middle;
    background-color:#c3d9ff;
  }
  .{{$template|escape:'html'}}_td12 {
    width: 240px;
    height: 15px;
    text-align:left;
    font-size: 10pt;
    font-family: Arial;
    vertical-align:bottom;
    padding-left:25px;
  }
  .{{$template|escape:'html'}}_text {
    width:150px;
    height:16px;
  }
  .{{$template|escape:'html'}}_text2 {
    width:190px;
    height:16px;
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
      var gui = AbstractPerformanceAttitude.gui('{{$template|escape:javascript}}');
      var options = { template: '{{$template|escape:'javascript'}}', option: '{{$options|escape:javascript}}' };
      new HandlePerformanceAttitude(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), options);
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="3"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td4" colSpan="3">
      <table class="{{$template|escape:'html'}}_table3" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td1" >Date From:</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateFrom_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td1" >Date To:</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateTo_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td3" >
            <input type="button" id="{{$template|escape:'html'}}_search_button" style="width:67px;font-family:Arial;font-size:10pt;" value = "Search"></input>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td5">
      <table class="{{$template|escape:'html'}}_table2" id="{{$template|escape:'html'}}_mains_table" cellPaddiing="0" cellSpacing="0">
        <tr>
          <td class="{{$template|escape:'html'}}_td8">Rank</td>
          <td class="{{$template|escape:'html'}}_td8">Employee Name</td>
          <td class="{{$template|escape:'html'}}_td8">No. of Follow up operations</td>
          <td class="{{$template|escape:'html'}}_td8">Proportion</td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td6" ></td>
    <td class="{{$template|escape:'html'}}_td7">
      <table class="{{$template|escape:'html'}}_table4" cellPaddiing="0" cellSpacing="0"border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td10">Create Date Zone</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td9">
            <input type="text" id="{{$template|escape:'html'}}_from_text" class="{{$template|escape:'html'}}_text2"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td9">To</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td9">
            <input type="text" id="{{$template|escape:'html'}}_to_text" class="{{$template|escape:'html'}}_text2"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td11">
            <input type="button" id="{{$template|escape:'html'}}_create_button" style="width:67px;font-family:Arial;font-size:10pt;" value = "Create"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td12" id="{{$template|escape:'html'}}_result_div"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>