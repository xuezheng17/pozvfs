<style>
  .{{$template|escape:'html'}}_table1 {
    width: 980px;
    height: 660px;
    margin:100px 0 0 0;
  }
  .{{$template|escape:'html'}}_table2 {
    width: 980px;
    height: 384px;
    background-image:url(images/home/topback.png);
    background-repeat:no-repeat;
  }
  .{{$template|escape:'html'}}_table3 {
    width: 980px;
    height: 247px;
    background-image:url(images/home/btmback.png);
    background-repeat:no-repeat;
  }
  
  .{{$template|escape:'html'}}_td1 {
    width: 980px;
    height: 384px;
    text-align: center;
    vertical-align: middle;
  }
  .{{$template|escape:'html'}}_td2 {
    width: 980px;
    height: 132px;
    text-align: left;
    vertical-align: bottom;
    padding-left:153px;
  }
  .{{$template|escape:'html'}}_td3 {
    width: 124px;
    height: 252px;
    text-align: center;
    vertical-align: bottom;
    padding:0 0 50px 0;
  }
  .{{$template|escape:'html'}}_td4 {
    width: 858px;
    height: 252px;
    text-align: right;
    vertical-align: bottom;
    padding:0 48px 21px 0;
  }
  .{{$template|escape:'html'}}_td5 {
    width: 980px;
    height: 30px;
  }
  .{{$template|escape:'html'}}_td6 {
    width: 980px;
    height: 247px;
  }
  .{{$template|escape:'html'}}_td7 {
    width: 245px;
    height: 247px;
    text-align: center;
    vertical-align: bottom;
    padding:0 42px 22px;
  }
  .{{$template|escape:'html'}}_img {
    cursor:pointer;
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
      var gui = AbstractHome.gui('{{$template|escape:javascript}}');
      new HandleHome(gui, MiscUtils.decode('{{$operator|escape:javascript}}'), MiscUtils.decode('{{$now|escape:javascript}}'), MiscUtils.decode('{{$options|escape:javascript}}'));
    }
  //-->
</script>

<table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table1" border=0>
  <tr>
    <td class="{{$template|escape:'html'}}_td1">
      <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table2" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td2" colSpan="2">
            <img src="images/home/leftservice.png"></img>
          </td>
        </tr>
        <tr>
          <td class="{{$template|escape:'html'}}_td3">
            <img src="images/home/centerservice.png"></img>
          </td>
          <td class="{{$template|escape:'html'}}_td4">
            <img src="images/home/learn.png" id="{{$template|escape:'html'}}_learn_button" class="{{$template|escape:'html'}}_img"></img>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td5" colSpan="2"></td>
  </tr>
  <tr>
    <td class="{{$template|escape:'html'}}_td6" colSpan="3">
      <table cellPadding="0" cellSpacing="0" class="{{$template|escape:'html'}}_table3" border=0>
        <tr>
          <td class="{{$template|escape:'html'}}_td7"></td>
          <td class="{{$template|escape:'html'}}_td7"></td>
          <td class="{{$template|escape:'html'}}_td7"></td>
          <td class="{{$template|escape:'html'}}_td7"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>