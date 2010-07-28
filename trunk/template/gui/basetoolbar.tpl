<style>
  .basetoolbar_cellTdLeft {
    width:907px;
    height:50px;
    text-align: right;
    vertical-align: bottom;
    padding-bottom:4px;
  }
  .basetoolbar_cellTdCenter {
    width: 16px;
    height: 50px;
    text-align: center;
    vertical-align: bottom;
    padding-bottom:2px;
  }
  .basetoolbar_cellTdRight {
    width: 57px;
    font-size: 11pt;
    font-family: Arial;
    color:blue;
    text-align: left;
    padding-top:24px;
    text-decoration: underline ;
    cursor: pointer;
  }
  .basetoolbar_padding {
    font-size: 12pt;
    font-family: Arial;
    font-weight: bold;
    color: #000000;
  }
</style>
<table cellPadding="0" cellSpacing="0" border=0>
  <tr>
    <td class="basetoolbar_cellTdLeft">
      <span class="basetoolbar_padding">{{$userInfo|escape:html}}</span>
    </td>
    <td class="basetoolbar_cellTdCenter">
      <img src="image/line2.png"></img>
    </td>
    <td>
      <div class="basetoolbar_cellTdRight" onclick="location.href='?logout'">Sign out</div>
    </td>
  </tr>
</table>
<hr color=#c9d7f1 size=1>