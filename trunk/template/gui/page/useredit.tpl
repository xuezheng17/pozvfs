<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 165px;
    margin:15px 0 0 0;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 50px;
    text-align: left;
    padding-left:15px;
    vertical-align: center;
    font-size: 13pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 83px;
    height: 30px;
    text-align: right;
    vertical-align: middle;
    padding-top:2px;
    padding-right:3px;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 210px;
    height: 30px;
    text-align: center;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 687px;
    height: 30px;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 210px;
    height: 70px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_inputText{
    width: 210px;
    height: 17px;
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
      
      var gui = AbstractUserEdit.gui('{{$template|escape:javascript}}');
      new HandleUserEdit(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" colSpan="3" >User</td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">Account:</td>
    <td class="{{$template|escape:'html'}}_td3">
      <input type="text" id="{{$template|escape:'html'}}_account_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
    <td class="{{$template|escape:'html'}}_td2">Password:</td>
    <td class="{{$template|escape:'html'}}_td3">
      <input type="text" id="{{$template|escape:'html'}}_password_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2"></td>
    <td class="{{$template|escape:'html'}}_td5">
      <input type="button" style="width:65px;font-family:Arial;" id="{{$template|escape:'html'}}_save_button" value = "Add"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
</table>