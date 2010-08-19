<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    text-align: left;
    margin: 0 0 50px 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 721px;
    height: 25px;
    font-size: 10pt;
    font-family: Arial;
    text-align: left;
    margin:-8px 0 0 0;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table2 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_table3 {
    height: 28px;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 220px;
  }
  .{{$template|escape:'html'}}_table5 {
    border-top:solid 1px #ccc;
    border-left:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table5 td {
    border-right:solid 1px #ccc;
    border-bottom:solid 1px #ccc;
  }
  
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 18px;
  }
  .{{$template|escape:'html'}}_td1 {
    width:60px;
    padding:0 5px 0 0;
    height: 28px;
    text-align:right;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    white-space:nowrap;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 150px;
    height: 28px;
    text-align:left;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td3 {
    height: 28px;
    width:150px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 150px;
    height: 28px;
    vertical-align:top;
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
    width: 220px;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 186px;
    height: 25px;
    text-align:center;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td9 {
    height: 20px;
    text-align:left;
    padding-left:30px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align: bottom;
    padding-bottom:3px;
  }
  .{{$template|escape:'html'}}_td10 {
    height: 20px;
    text-align:left;
    padding-left:30px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align: bottom;
    padding-bottom:4px;
  }
  .{{$template|escape:'html'}}_td11 {
    height:40px;
    text-align:right;
    padding-right:15px;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td12 {
    height: 15px;
    text-align:left;
    padding-left:30px;
    font-size: 10pt;
    font-family: Arial;
    vertical-align:bottom;
  }
  .{{$template|escape:'html'}}_td13 {
    padding:0 4px;
    height: 28px;
    text-align:right;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    white-space:nowrap;
  }
  .{{$template|escape:'html'}}_td14 {
    width:136px;
    padding-left:10px;
    height: 22px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    background-color:#e8e8e8;
  }
  .{{$template|escape:'html'}}_td15 {
    width:20px;
    height: 22px;
    text-align:center;
    background-color:#e8e8e8;
  }
  .{{$template|escape:'html'}}_text {
    width:170px;
    height:16px;
  }
  .{{$template|escape:'html'}}_text2 {
    width:170px;
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
      var gui = AbstractPerformancePE.gui('{{$template|escape:javascript}}');
      var options = { template: '{{$template|escape:'javascript'}}', option: '{{$options|escape:javascript}}' };
      new HandlePerformancePE(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), options);
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td4" colSpan="3">
      <table class="{{$template|escape:'html'}}_table3" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td1" >Date From</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateFrom_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td13" >To</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateTo_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td3" >
            <input type="button" id="{{$template|escape:'html'}}_search_button" style="width:67px;font-family:Arial;font-size:10pt;" value = "Search"></input>
          </td>
          <td style="width:160px" ></td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td5" colSpan="6" valign="top">
            <table class="{{$template|escape:'html'}}_table2" id="{{$template|escape:'html'}}_mains_table" cellPaddiing="0" cellSpacing="0">
              <tr>
                <td class="{{$template|escape:'html'}}_td8">Rank</td>
                <td class="{{$template|escape:'html'}}_td8">Employee Name</td>
                <td class="{{$template|escape:'html'}}_td8">No. of Follow up actions</td>
                <td class="{{$template|escape:'html'}}_td8">Proportion</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
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
          <td class="{{$template|escape:'html'}}_td12">
            <table class="{{$template|escape:'html'}}_table5" id="{{$template|escape:'html'}}_result_table" cellPaddiing="0" cellSpacing="0">
              <tr>
                <td class="{{$template|escape:'html'}}_td14" >Date Zone</td>
                <td class="{{$template|escape:'html'}}_td15" ></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>