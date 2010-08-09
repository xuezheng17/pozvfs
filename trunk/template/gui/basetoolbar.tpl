<style>
  .baetoolbar_table1 {
    width: 100%;
    height: 20px;
  }
  .basetoolbar_td1 {
    width: 100%;
    height: 20px;
    text-align: left;
    vertical-align: bottom;
    padding:0 0 3px 7px;
  }
  .basetoolbar_cellTdLeft {
    height: 20px;
  	width:
    text-align: right;
    vertical-align: bottom;
    padding-bottom: 2px;
  	padding-right:7px;
  }
  .basetoolbar_cellTdCenter {
    width: 2px;
    height: 20px;
    text-align: center;
    vertical-align: bottom;
  }
  .basetoolbar_cellTdRight {
    width: 60px;
    font-size: 13px;
    font-family: Arial;
    text-align: left;
    white-space:nowrap;
    padding: 0 7px;
  }
  .basetoolbar_padding {
    font-size: 11pt;
    font-family: Arial;
    font-weight: bold;
    color: #000000;
  }
  .basetoolbar_cellTdRight a {
    color: #0000ff;
    font-size: 13px;
    text-decoration: underline ;
    cursor: pointer;
  }
</style>
<div align="right">
  <table cellPadding="0" cellSpacing="0" border=0>
    <tr>
      <td class="basetoolbar_td1">
        <a href = "http://code.google.com/p/dreamlifevisitorsystem/issues/list">Report&nbsp a&nbsp bug</a>
      </td>
      <td class="basetoolbar_cellTdLeft">
        <span class="basetoolbar_padding">{{$userInfo|escape:html}}</span>
      </td>
      <td class="basetoolbar_cellTdCenter">
        <img src="image/line2.png"></img>
      </td>
      <td class="basetoolbar_cellTdRight">
        <a onclick="location.href='?logout'">Sign out</a>
      </td>
    </tr>
  </table>
</div>
<hr color=#c9d7f1 size=1 width=100%>