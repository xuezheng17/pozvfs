<style>
  .basetoolbar_cellTdLeft {
    width:900px;
    height:50px;
    text-align: right;
    vertical-align: bottom;
  	padding-bottom:2px;
  }
  .basetoolbar_cellTdCenter {
    width: 20px;
    height: 50px;
    text-align: center;
    vertical-align: bottom;

  }
  .basetoolbar_cellTdRight {
    width: 60px;
    font-size: 10pt;
    font-family: Arial;
    color: blue;
    text-align: left;
    padding-top:31px;
    text-decoration: underline ;
    cursor: pointer;
  }
  .basetoolbar_padding {
    font-size: 11pt;
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
    <td class="basetoolbar_cellTdRight" onclick="location.href='?logout'">Sign out</td>
  </tr>
</table>
<hr color=#c9d7f1 size=1 width=980px>