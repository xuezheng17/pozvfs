<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 40px;
    text-align: left
    marging:23px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 530px;
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
    text-align:center;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td2 a {
    font-size:35pt;
    font-weight:bold;
    font-faminy:Arial;
    font-style: italic;
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
      
      var gui = AbstractHome.gui('{{$template|escape:'javascript'}}');
      new HandleHome(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>


<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="2"></td>
  </tr>
  <tr>
    <td style="padding: 10px 0 20px 0;font-size:15px;" colSpan="2"><a style="color:#FF0000;font-size:15px;font-weight:bold"href="?t=visitors&m={%22a%22:1,%22b%22:1}">Enter System Now</a> or automatically enter system in <span id="{{$template|escape:'html'}}_time_div">30</span> seconds</td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >
      <table class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td3">Total</td>
          <td class="{{$template|escape:'html'}}_td6">In processing</td>
          <td class="{{$template|escape:'html'}}_td4">Booked Customer</td>
          <td class="{{$template|escape:'html'}}_td5">Failed</td>
          <td class="{{$template|escape:'html'}}_td5">Deleted</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td31" id="{{$template|escape:'html'}}_visitors_div"></td>
          <td class="{{$template|escape:'html'}}_td61" id="{{$template|escape:'html'}}_progressingVisitors_div"></td>
          <td class="{{$template|escape:'html'}}_td41" id="{{$template|escape:'html'}}_succeedVisitors_div"></td>
          <td class="{{$template|escape:'html'}}_td51" id="{{$template|escape:'html'}}_dropVisitors_div"></td>
          <td class="{{$template|escape:'html'}}_td51" id="{{$template|escape:'html'}}_deletedVisitors_div"></td>
        </tr>
      </table>
    </td>
  <tr>
</table>
<div id="{{$template|escape:'html'}}_graphy_div" class="{{$template|escape:'html'}}_table1" style="margin:30px 0 0 0;height:550px"></div>

