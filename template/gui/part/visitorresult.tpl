<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 122px;
    border:solid 1px #e5ecf9;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 980px;
    height: 28px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 30px;
    text-align: left;
    vertical-align: bottom;
    padding-left:18px;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 124px;
    height: 24px;
    text-align: right;
    vertical-align: BOTTOM;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 164px;
    height: 24px;
    text-align: left;
    vertical-align: BOTTOM;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 164px;
    height: 24px;
    text-align: right;
    vertical-align: BOTTOM;
    font-size: 11pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 528px;
    height: 24px;
    text-align: left;
    vertical-align: BOTTOM;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 980px;
    height: 28px;
    text-align: right;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 800px;
    height: 28px;
    text-align: right;
    vertical-align: middle;
    font-weight: bold;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 68px;
    height: 28px;
    text-align: right;
    vertical-align: middle;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 32px;
    height: 28px;
    text-align: right;
    vertical-align: middle;
    font-weight: bold;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td10 {
    width: 80px;
    height: 28px;
    text-align: left;
    vertical-align: middle;
    padding-left:10px;
    font-size: 11pt;
    color: #000000; 
    font-family: Arial;
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
      
      var gui = AbstractVisitorResult.gui('{{$template|escape:javascript}}');
      console.log(gui);
      //new HandleSignIn(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" colSpan="5" ></td> 
      <div id="{{$template|escape:'html'}}_title_div" ></div>
    </td>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" >Bride:</td> 
    <td class="{{$template|escape:'html'}}_td3" id="{{$template|escape:'html'}}_brideName_div" ></td>
    <td class="{{$template|escape:'html'}}_td4" >Groom:</td>
    <td class="{{$template|escape:'html'}}_td5" id="{{$template|escape:'html'}}_groomName_div" ></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" >Tel/Mob:</td> 
    <td class="{{$template|escape:'html'}}_td3" id="{{$template|escape:'html'}}_bridePhone_div" ></td>
    <td class="{{$template|escape:'html'}}_td4" >Tel/Mob:</td>
    <td class="{{$template|escape:'html'}}_td5" id="{{$template|escape:'html'}}_groomPhone_div" ></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2" >Email:</td> 
    <td class="{{$template|escape:'html'}}_td3" id="{{$template|escape:'html'}}_brideEmail_div" ></td>
    <td class="{{$template|escape:'html'}}_td4" >Email:</td>
    <td class="{{$template|escape:'html'}}_td5" id="{{$template|escape:'html'}}_groomEmail_div" ></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colSpan="5" >
      <table class="{{$template|escape:'html'}}_table2" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td7" >Created on</td>
          <td class="{{$template|escape:'html'}}_td8" id="{{$template|escape:'html'}}_createdDate_div" ></td>
          <td class="{{$template|escape:'html'}}_td9" >By</td>
          <td class="{{$template|escape:'html'}}_td10" id="{{$template|escape:'html'}}_author_div" ></td>
        </tr>
      </table>
    </td> 
  </tr>
</table>