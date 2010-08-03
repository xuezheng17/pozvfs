<style>
.{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 525px;
  }
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 23px;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 40px;
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
    vertical-align: top;
    padding-top:7px;
    padding-right:3px;
    font-size: 10pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 210px;
    height: 30px;
    text-align: left;
    vertical-align: bottom;

  }
  .{{$template|escape:'html'}}_td4 {
    width: 687px;
    height: 30px;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 670px;
    height: 50px;
    text-align: right;
    vertical-align: bottom;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 83px;
    height: 30px;
    text-align: right;
    vertical-align: middle;
    padding-top:3px;
    padding-right:3px;
    font-size: 10pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_inputText{
    width: 670px;
    height: 17px;
  }
  .{{$template|escape:'html'}}_textarea{
    width: 670px;
    height: 380px;
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
      var gui = AbstractEmailTemplateEdit.gui('{{$template|escape:javascript}}');
      new HandleEmailTemplateEdit(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>


<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="3" ></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6">Name:</td>
    <td class="{{$template|escape:'html'}}_td3">
      <input type="text" id="{{$template|escape:'html'}}_name_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6">Subject:</td>
    <td class="{{$template|escape:'html'}}_td3">
      <input type="text" id="{{$template|escape:'html'}}_subject_input" class="{{$template|escape:'html'}}_inputText"></input>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
  <tr>
    <td style="width:3px" colSpan="3"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2">Content:</td>
    <td class="{{$template|escape:'html'}}_td3">
      <textarea id="{{$template|escape:'html'}}_content_input" class="{{$template|escape:'html'}}_textarea" style="overflow:hidden"></textarea>
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2"></td>
    <td class="{{$template|escape:'html'}}_td5">
      <input type="button" style="width:65px;font-family:Arial;font-size:10pt;" id="{{$template|escape:'html'}}_save_button" value = "Save"></input>
      <input type="button" style="width:65px;font-family:Arial;font-size:10pt;" id="{{$template|escape:'html'}}_back_button" value = "Back"></input
    </td>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
</table>