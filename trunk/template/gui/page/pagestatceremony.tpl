<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 25px;
    margin-top:20px;
    border:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 980px;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 950px;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_table3 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  }
  .{{$template|escape:'html'}}_td1 {
    border-bottom:solid 1px #ccc;
    background-color: #E5ECF9;
    width: 980px;
    font-size: 11pt;
    font-weight: bold;
    height: 25px;
    padding: 0 0 0 15px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 980px;
    height: 5px;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 55px;
    height: 30px;
    font-size: 10pt;
    font-weight: bold;
    padding-left: 15px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 910px;
    height: 30px;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 980px;
    height: 40px;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 550px;
    height: 25px;
    padding-left: 15px;
    font-size: 10pt;
    font-weight: bold;
    text-align: left;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 400px;
    height: 25px;
    font-size: 10pt;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td10 {
    height: 13px;
  }
  .{{$template|escape:'html'}}_td11 {
    width: 630px;
    height: 25px;
    text-align: left;
    vertical-align: middle;
    font-weight: Bold;
    font-size: 12px;
    color: #694247;
    padding: 0 0 0 15px;
  }
  .{{$template|escape:'html'}}_margin {
    margin: 0 0 0 15px;
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
      
      var gui = AbstractPageStatCeremony.gui('{{$template|escape:'javascript'}}');
      new HandlePageStatCeremony(gui, JSON.parse('{{$operator|escape:javascript}}'), JSON.parse('{{$now|escape:javascript}}'), JSON.parse('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPadding="0" cellSpacing="0">
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      Wedding
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td3" align="center">
      <table class="{{$template|escape:'html'}}_table2" cellPadding="0" cellSpacing="0">
        <tr>
          <td class="{{$template|escape:'html'}}_td5">
            Total:
          </td>
          <td class="{{$template|escape:'html'}}_td6" id="{{$template|escape:'html'}}_total_div"></td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td7" colSpan="2" align="center">
            <table class="{{$template|escape:'html'}}_table3" cellPadding="0" cellSpacing="0" id="{{$template|escape:'html'}}_main_table">
              <tr>
                <td class="{{$template|escape:'html'}}_td8">
                  Locations
                </td>
                <td class="{{$template|escape:'html'}}_td9">
                  No. of Customers
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td10"></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td4"></td>
  </tr>
</table>