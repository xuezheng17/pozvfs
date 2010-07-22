 <style>
  .{{$template|escape:'html'}}_table1 {
    width: 347px;
    height: 147px;
    border:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 200px;
    height: 210px;
    border:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 348px;
    height: 210px;
    text-align: center;
    vertical-align: middle;
    border:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 340px;
    height: 202px;
    background-color:#e8eefa;
    border:solid 1px #ccc;
  }
  
  .{{$template|escape:'html'}}_td1 {
    width: 250px;
    height: 128px;
    text-align: center;
    vertical-align: middle;
    font-size: 23pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 348px;
    height: 210px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 115px;
    height: 66px;
    text-align: right;
    padding-right:9px;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 224px;
    height: 66px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 115px;
    height: 40px;
    text-align: right;
    padding-right:9px;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 224px;
    height: 40px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 115px;
    height: 52px;
    text-align: right;
    padding-right:9px;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 224px;
    height: 52px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_inputText{
    width: 142px;
    height: 20px;
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
  
  
<table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table1" border=0>
  <tr>
    <td></td>
  </tr>
</table>

<table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table2" >
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      Dream Visitor Service
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
      <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table3" > 
        <tr>
          <td class="{{$template|escape:'html'}}_td2">
            <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table4">
              <tr>
                <td class="{{$template|escape:'html'}}_td3">
                  Account:
                </td>
                <td class="{{$template|escape:'html'}}_td4">
                  <input type="text" id="{{$template|escape:'html'}}_account_input" class="{{$template|escape:'html'}}_inputText"></input>
                </td>
              </tr>
              <tr>
                <td class="{{$template|escape:'html'}}_td5">
                  Password:
                </td>
                <td class="{{$template|escape:'html'}}_td6">
                  <input type="text" id="{{$template|escape:'html'}}_password_input" class="{{$template|escape:'html'}}_inputText"></input>
                </td>
              </tr>
              <tr>
                <td class="{{$template|escape:'html'}}_td7">
                </td>
                <td class="{{$template|escape:'html'}}_td8">
                  <input type="button" id="{{$template|escape:'html'}}_login_button" value = "Login"></input>
                </td>
              </tr>
          </td>
        </tr>  
      </table>
    </td>
  </tr>
</table>