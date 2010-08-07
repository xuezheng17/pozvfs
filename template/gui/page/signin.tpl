 <style>
  .{{$template|escape:'html'}}_table1 {
    width: 372px;
    height: 240px;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 372px;
    height: 240px;
  }

  .{{$template|escape:'html'}}_td1 {
    width: 372px;
    height: 88px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 372px;
    height: 23px;
    text-align: left;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 372px;
    height: 56px;
    text-align: right;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_Text{
    width: 372px;
    height: 17px;
  }
  .{{$template|escape:'html'}}_btn{
    text-align:center;
    width:60px;
    font-family:Arial;
    font-size:10pt;
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
      
      var gui = AbstractSignIn.gui('{{$template|escape:javascript}}');
      new HandleSignIn(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table1" border=0>
  <tr>
    <td></td>
  </tr>
</table>

<table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table2" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      <img src="image/logintitle.png"></img>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">Account</td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
      <input type="text" class="{{$template|escape:'html'}}_Text" id="{{$template|escape:'html'}}_account_input"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">Password</td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
      <input type="text" class="{{$template|escape:'html'}}_Text" id="{{$template|escape:'html'}}_password_input"></input>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3">
      <input type="button" id="{{$template|escape:'html'}}_login_button" value = "Login" class="{{$template|escape:'html'}}_btn"></input>
    </td>
  </tr>
</table>