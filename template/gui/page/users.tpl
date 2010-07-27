<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 200px;
    text-align: left
  }
  .{{$template|escape:'html'}}_table2 {
    width: 430px;
    height: 25px;
    font-size: 12px;
    font-family: Arial;
    text-align: center;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table2 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_table3 {
    width: 730px;
    height: 155px;
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
  .{{$template|escape:'html'}}_td3 {
    width: 140px;
    height: 25px;
    text-align: left;
    background-color:#e5ecf9;
    vertical-align: middle;
    padding-left:20px;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 215px;
    height: 25px;
    text-align: left;
    vertical-align: middle;
    background-color:#e5ecf9;
    padding-left:20px;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 75px;
    height: 25px;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 730px;
    height: 155px;
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
      new HandleUsers(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colspan="2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >
      <table class="{{$template|escape:'html'}}_table2" id="{{$template|escape:'html'}}_users_table" cellPaddiing="0" cellSpacing="0">
        <tr>
          <td class="{{$template|escape:'html'}}_td3">Account</td>
          <td class="{{$template|escape:'html'}}_td4">Password</td>
          <td class="{{$template|escape:'html'}}_td5"></td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td2" ></td>
  </tr>
</table>