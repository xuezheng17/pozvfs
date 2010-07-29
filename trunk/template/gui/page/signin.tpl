 <style>
  .{{$template|escape:'html'}}_table1 {
    width: 348px;
    height: 150px;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 348px;
    height: 210px;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 348px;
    height: 210px;
    text-align: center;
    vertical-align: middle;
    border:solid 1px #c7dbff;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 340px;
    height: 202px;
    text-align: center; 
    background-color:#e8eefa;
  }
  
  .{{$template|escape:'html'}}_td1 {
    width: 348px;
    height: 128px;
    text-align: center;
    vertical-align: middle;
    font-size: 18pt;
    font-weight: 700;
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
    padding-right:7px;
    padding-bottom:6px;
    vertical-align: bottom;
    font-size: 10pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 225px;
    height: 66px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 115px;
    height: 40px;
    text-align: right;
    padding-right:7px;
    vertical-align: bottom;
    padding-bottom:6px;
    font-size: 10pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 225px;
    height: 40px;
    text-align: left;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 115px;
    height: 94px;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 225px;
    height: 94px;
    text-align: left;
    vertical-align: middle;
    padding-bottom:20px;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 339px;
    height: 202px;
    padding:3px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_inputText{
    width: 140px;
    height: 16px;
  }
  .{{$template|escape:'html'}}_btn{
    font-family:Arial;
    width:60px;
    height:24px;
    padding-bottom:15px;
    
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
      Dreamlife Visitor Service
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">
      <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table3" border=0> 
        <tr>
          <td class="{{$template|escape:'html'}}_td9">
            <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table4" border=0>
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
                  <input type="button" id="{{$template|escape:'html'}}_login_button" class ="{{$template|escape:'html'}}_btn" value = "Login" ></input>
                </td>
              </tr>
            </table>
          </td>
        </tr>  
      </table>
    </td>
  </tr>
</table>