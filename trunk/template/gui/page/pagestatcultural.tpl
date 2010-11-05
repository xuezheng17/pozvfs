<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    text-align: left;
    margin: 0 0 50px 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 721px;
    font-size: 10pt;
    font-family: Arial;
    text-align: left;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    margin:0 0 20px 0;
  }
  .{{$template|escape:'html'}}_table2 td{
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    }
  .{{$template|escape:'html'}}_table3 {
    height: 28px;
  }
  .{{$template|escape:'html'}}_table4 {
    width: 220px;
  }
  .{{$template|escape:'html'}}_table5 {
    border-top:solid 1px #ccc;
    border-left:solid 1px #ccc;
  }
  .{{$template|escape:'html'}}_table5 td {
    border-right:solid 1px #ccc;
    border-bottom:solid 1px #ccc;
  }
  
  .{{$template|escape:'html'}}_td0 {
    width: 980px;
    height: 18px;
  }
  .{{$template|escape:'html'}}_td1 {
    width:60px;
    padding:0 5px 0 0;
    height: 28px;
    text-align:right;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    white-space:nowrap;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 150px;
    height: 28px;
    text-align:left;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td3 {
    height: 28px;
    width:150px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 755px;
    height: 28px;
    vertical-align:top;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 770px;
    padding-top:8px;
    vertical-align:top;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 29px;
    height: 25px;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 220px;
    vertical-align:top;
  }
  .{{$template|escape:'html'}}_td8 {
    width: 186px;
    height: 25px;
    text-align:center;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    background-color:#e5ecf9;
  }
  .{{$template|escape:'html'}}_td9 {
    width: 186px;
    height: 25px;
    text-align:center;
    font-size: 10pt;
    font-family: Arial;
  }
  .{{$template|escape:'html'}}_td10 {
    height: 20px;
    text-align:left;
    padding-left:30px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align: bottom;
    padding-bottom:4px;
  }
  .{{$template|escape:'html'}}_td11 {
    height:40px;
    text-align:right;
    padding-right:15px;
    vertical-align:middle;
  }
  .{{$template|escape:'html'}}_td12 {
    height: 15px;
    text-align:left;
    padding-left:30px;
    font-size: 10pt;
    font-family: Arial;
    vertical-align:bottom;
  }
  .{{$template|escape:'html'}}_td13 {
    padding:0 4px;
    height: 28px;
    text-align:right;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    white-space:nowrap;
  }
  .{{$template|escape:'html'}}_td14 {
    width:136px;
    padding-left:10px;
    height: 22px;
    font-size: 10pt;
    font-weight: bold;
    font-family: Arial;
    vertical-align:middle;
    background-color:#e8e8e8;
  }
  .{{$template|escape:'html'}}_td15 {
    width:20px;
    height: 22px;
    text-align:center;
    background-color:#e8e8e8;
  }
  .{{$template|escape:'html'}}_text {
    width:170px;
    height:16px;
  }
  .{{$template|escape:'html'}}_text2 {
    width:170px;
    height:16px;
  }
  .elemstatsource_table1 {
    width: 712px;
    height: 24px;
    margin: 20px 0 0 0;
    border:solid 1px #ccc;
  }
  .elemstatsource_table2 {
    width: 712px;
    height: 50px;
  }
  .elemstatsource_table3 {
    width: 695px;
    height: 15px;
    margin: 0 0 0 15px;
  }
  .elemstatsource_table4 {
    width: 400px;
  }
  .elemstatsource_table5 {
    width: 400px;
    height: 24px;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
  }
  .elemstatsource_table5 td {
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  }
  .elemstatsource_table6 {
    width: 278px;
    height: 15px;
  }
  .elemstatsource_td1 {
    width: 712px;
    background-color:#E5ECF9;
    height: 24px;
    font-size: 11pt;
    font-weight: bold;
    padding: 0 0 0 15px;
    text-align: left;
    vertical-align: middle;
    border-bottom:solid 1px #ccc;
  }
  .elemstatsource_td3 {
    width: 712px;
    height: 5px;
  }
  .elemstatsource_td5 {
    width: 695px;
    height: 35px;
    vertical-align: top;
  }
  .elemstatsource_td6 {
    width: 670px;
    height: 20px;
    vertical-align: top;
  }
  .elemstatsource_td7 {
    height: 17px;
  }
  .elemstatsource_td8 {
    width: 55px;
    height: 24px;
    font-size: 10pt;
    font-weight: bold;
    text-align: left;
    vertical-align: top;
  }
  .elemstatsource_td9 {
    height: 24px;
    text-align: left;
    vertical-align: top;
  }
  .elemstatsource_td10 {
    width: 150px;
    height: 10px;
    text-align: left;
    vertical-align: middle;
  }
  .elemstatsource_td11 {
    width: 329px;
    height: 10px;
    text-align: left;
    vertical-align: middle;
  }
  .elemstatsource_td12 {
    width: 215px;
    height: 24px;
    padding-left: 15px;
    font-size: 10pt;
    font-weight: bold;
    text-align: left;
    vertical-align: middle;
  }
  .elemstatsource_td13 {
    width: 80px;
    height: 24px;
    font-size: 10pt;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
  }
  .elemstatsource_td14 {
    width: 270px;
    height: 400px;
    text-align: center;
    vertical-align: top;
  }
  .elemstatsource_td15 {
    width: 80px;
    height: 24px;
    text-align: center;
    vertical-align: middle;
  }
  .elemstatsource_td150 {
    width: 80px;
    height: 24px;
    font-size: 10pt;
    font-weight: bold;
    text-align: center;
    vertical-align: middle;
  }
  .elemstatsource_td16 {
    width: 230px;
    height: 24px;
    text-align: left;
    vertical-align: middle;
    font-weight: Bold;
    font-size: 12px;
    padding: 0 0 0 15px;
  }
  .elemstatsource_margin {
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
      var gui = AbstractPageStatCultural.gui('{{$template|escape:javascript}}');
      var options = { template: '{{$template|escape:'javascript'}}', option: '{{$options|escape:javascript}}' };
      new HandlePageStatCultural(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), options);
    }
  //-->
</script>

<table class="{{$template|escape:'html'}}_table1" cellPaddiing="0" cellSpacing="0" border=0
  <tr>
    <td class="{{$template|escape:'html'}}_td0" colSpan="10"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td4" colSpan="3">
      <table class="{{$template|escape:'html'}}_table3" cellPaddiing="0" cellSpacing="0" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td1" >Date From</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateCreated_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td13" >To</td>
          <td class="{{$template|escape:'html'}}_td2" >
            <input type="text" id="{{$template|escape:'html'}}_dateTo_text" class="{{$template|escape:'html'}}_text"></input>
          </td>
          <td class="{{$template|escape:'html'}}_td3" >
            <input type="button" id="{{$template|escape:'html'}}_search_button" style="width:67px;font-family:Arial;font-size:10pt;" value = "Search"></input>
          </td>
          <td style="width:160px" ></td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td5" colSpan="6">
          </td>
        </tr>
        <tr>
          <td style="width:755px" colSpan="6">
            <table class="elemstatsource_table1" cellPadding="0" cellSpacing="0">
              <tr>
                <td class="elemstatsource_td1">
                  Detail
                </td>
              </tr>
              <tr>
                <td class="elemstatsource_td3" align="center">
                  <table class="elemstatsource_table2" cellPadding="0" cellSpacing="0">
                    <tr>
                      <td class="elemstatsource_td7"></td>
                    </tr>
                    <tr>
                      <td class="elemstatsource_td5" align="left">
                        <table class="elemstatsource_table3" cellPadding="0" cellSpacing="0">
                          <tr>
                            <td class="elemstatsource_td6" align="left">
                              <table class="elemstatsource_table4"  cellPadding="0" cellSpacing="0">
                                <tr>
                                  <td class="elemstatsource_td8">
                                    Total:
                                  </td>
                                  <td class="elemstatsource_td9" id="{{$template|escape:'html'}}_total_div"></td>
                                </tr>
                                <tr>
                                  <td colSpan="2" class="elemstatsource_td10">
                                    <table class="elemstatsource_table5" cellPadding="0" cellSpacing="0" id="{{$template|escape:'html'}}_main_table">
                                      <tr>
                                        <td class="elemstatsource_td12">
                                           {{if $template == 'pagestatsource' }} Source {{else if $template == 'pagestatcultural'}} Cultural {{/if}}
                                        </td>
                                        <td class="elemstatsource_td13">
                                          No.of CUS
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                            <td class="elemstatsource_td14" align="left">
                              <table class="elemstatsource_table6"  cellPadding="0" cellSpacing="0">
                                <tr>
                                  <td class="elemstatsource_td14" id="{{$template|escape:'html'}}_graph_div"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td class="elemstatsource_td7"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td class="{{$template|escape:'html'}}_td7">
      <table class="{{$template|escape:'html'}}_table4" cellPaddiing="0" cellSpacing="0"border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td10">Create Date Zone</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td10">
            <input type="text" id="{{$template|escape:'html'}}_created_text" class="{{$template|escape:'html'}}_text2"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td10">To</td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td10">
            <input type="text" id="{{$template|escape:'html'}}_to_text" class="{{$template|escape:'html'}}_text2"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td11">
            <input type="button" id="{{$template|escape:'html'}}_create_button" style="width:67px;font-family:Arial;font-size:10pt;" value = "Create"></input>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td12">
            <table class="{{$template|escape:'html'}}_table5" id="{{$template|escape:'html'}}_result_div" cellPaddiing="0" cellSpacing="0">
              <tr>
                <td class="{{$template|escape:'html'}}_td14" >Date Zone</td>
                <td class="{{$template|escape:'html'}}_td15" ></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>