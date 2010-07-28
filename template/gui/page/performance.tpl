<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 122px;
    margin:20px 0 0 0;
  }
  .{{$template|escape:'html'}}_td1 {
    width: 380px;
    height: 30px;
    text-align: right;
    vertical-align: bottom;
    font-weight: bold;
    font-size: 12pt;
    color: #000000; 
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 600px;
    height: 30px;
    text-align: left;
    vertical-align: bottom;
    font-size: 12pt;
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
      
      var gui = AbstractPerformance.gui('{{$template|escape:javascript}}');
      new HandlePerformance(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Visitors:</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_visitors_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Emails/Visitors(Email%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_eVisitor_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Email suc/Emails(Email suc%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_eSucVisitor_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Phones/Visitors(Phone%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_pVisitor_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Phone suc/Phones(Phone suc%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_pSucVisitor_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Customers/Visitors(Sale suc%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_cVisitor_div"></td> 
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td1" >Customers/Email+Phone+Visitor(Total suc%):</td> 
    <td class="{{$template|escape:'html'}}_td2" id="{{$template|escape:'html'}}_total_div"></td> 
  </tr>
</table>