<style>
  .basemenus_table1 {
    width: 980px;
    height: 28px;
    margin:30px 0 0 0;
  }
  .basemenus_table2 {
    background-color:#c3d9ff;
    width: 100%;
    height:23px;
    text-align:center;
  }
  .basemenus_table3 {
    width: 980px;
    height:23px;
  }
  .basemenus_table4 {
    height:16px;
  }
  .basemenus_table5 {
    height:16px;
  }
  .basemenus_td0 {
    height: 23px;
    width:100%;
  }
  .basemenus_td1 {
    height: 28px;
    text-align: center;
    vertical-align: bottom;
    cursor: pointer;
    font-size: 10pt;
    font-weight: bold;
    color: #000000; 
    font-family: Arial;
//    letter-spacing:1px;
  }
  .basemenus_td1Hilight {
    height: 28px;
    text-align: center;
    vertical-align: bottom;
    cursor: pointer;
    font-weight: bold;
    font-size: 10pt;
    color: #000000; 
    font-family: Arial;
//   letter-spacing:1px;
  }
  .basemenus_td2 {
    width: 15px;
    height: 28px;
  }
  .basemenus_td3 {
    padding: 4px 10px 3px 10px;
    height: 16px;
    white-space:nowrap;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    color: blue; 
    text-decoration: underline ;
    font-family: Arial;
    cursor: pointer;
  }
  .basemenus_td3Hilight {
    padding: 4px 10px 3px 10px;
    height: 16px;
    white-space:nowrap;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
    cursor: pointer;
  }
  .basemenus_td31 {
    padding: 4px 10px 3px 0;
    height: 16px;
    white-space:nowrap;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    color: blue; 
    text-decoration: underline ;
    font-family: Arial;
    cursor: pointer;
  }
  .basemenus_td31Hilight {
    padding: 4px 10px 3px 0;
    height: 16px;
    white-space:nowrap;
    text-align: center;
    vertical-align: middle;
    font-size: 10pt;
    font-family: Arial;
    cursor: pointer;
  }
  .basemenus_td4 {
    width: 980px;
    height: 23px;
  }
  .basemenus_td5 {
    width: 1px;
    height: 23px; 
    font-size:10pt;
    text-align: center;
    vertical-align: middle;
  }
  .basemenus_td6 {
    height: 16px; 
    font-size:8pt;
    color:red;
    text-align: center;
    vertical-align: middle;
  }
  .basemenus_item div{
    height:1px;
    overflow:hidden;
    border-left:1px solid #c3d9ff;
    border-right:1px solid #c3d9ff;
    background-color:#c3d9ff;
  }
  .basemenus_item .row1{
    margin:0 5px;
   }
  .basemenus_item .row2{
    margin:0 3px;
    border:0 2px;
  }
  .basemenus_item .row3{
    margin:0 2px;
  }
  .basemenus_item .row4{
    margin:0 1px;
    height:2px;
  }
  .basemenus_item1 div{
    height:1px;
    overflow:hidden;
    border-left:1px solid #e5ecf9;
    border-right:1px solid #e5ecf9;
    background-color:#e5ecf9;
  }
  .basemenus_item1 .row1{
    margin:0 5px;
   }
  .basemenus_item1 .row2{
    margin:0 3px;
    border:0 2px;
  }
  .basemenus_item1 .row3{
    margin:0 2px;
  }
  .basemenus_item1 .row4{
    margin:0 1px;
    height:2px;
  }
  .basemenus_p{
    padding: 0 13px;
    height:16px;
    background-color:#c3d9ff;
    vertical-align:bottom;
    padding-bottom:3px;
    margin:0;
  }
  .basemenus_ph{
    padding: 0 13px;
    height:16px;
    background-color:#e5ecf9;
    vertical-align:bottom;
    padding-bottom:3px;
    margin:0;
  }
  .basemenus_td1Hilight a,.basemenus_td1 a{
    text-decoration:none;
    font-size:10pt; 
    color:black;
    outline: none;
  } 
  .basemenus_td3Hilight a,.basemenus_td31Hilight a{
    color:black;
    font-size:10pt; 
    text-decoration:none;
    outline: none;
  }
  .basemenus_td3 a,.basemenus_td31 a{
   font-size:10pt; 
    outline: none;
  }
  .basemenus_td6 a{
    color:red;
  }
</style>

<table class="basemenus_table1"  cellPadding="0" cellSpacing="0" border=0>
  <tr>
    {{if $menu->a == 1}} 
      <td class="basemenus_td1Hilight">
        <div class="basemenus_item">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
            <td class="basemenus_p" >
              <a  href = "?t=visitors&m={%22a%22:1,%22b%22:1}">Visitor</a>
            </td>
            </tr>
          </table>
        </div>
      </td>
    {{else}}
      <td class="basemenus_td1" >
        <div class="basemenus_item1">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
            <td class="basemenus_ph" >
              <a  href = "?t=visitors&m={%22a%22:1,%22b%22:1}">Visitor</a>
            </td>
            </tr>
          </table>
        </div>
      </td>
    {{/if}}
    
    <td class="basemenus_td2"></td>
    
    {{if $menu->a == 2}} 
      <td class="basemenus_td1Hilight">
        <div class="basemenus_item">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_p">
                <a  href = "?t=followup&m={%22a%22:2,%22b%22:1}&opts={%22follow%22:1}">Processing</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{else}}
      <td class="basemenus_td1">
        <div class="basemenus_item1">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_ph" >
                <a  href = "?t=followup&m={%22a%22:2,%22b%22:1}&opts={%22follow%22:1}">Processing</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{/if}}
    
    <td class="basemenus_td2"></td>
    
    {{if $menu->a == 3}} 
      <td class="basemenus_td1Hilight">
        <div class="basemenus_item">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_p">
                <a  href = "?t=statbasic&m={%22a%22:3,%22b%22:1}">Stats</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{else}}
      <td class="basemenus_td1">
        <div class="basemenus_item1">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_ph" >
                <a  href = "?t=statbasic&m={%22a%22:3,%22b%22:1}">Stats</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{/if}}
    
    <td class="basemenus_td2"></td>
    
    {{if $menu->a == 4}} 
      <td class="basemenus_td1Hilight">
        <div class="basemenus_item">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_p">
                <table class="basemenus_table4"  cellPadding="0" cellSpacing="0" border=0>
                  <tr>
                    <td >
                      <a  href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">Performance</a>
                    </td>
                    <td class="basemenus_td6">
                      <a href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">(beta)</a>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{else}}
      <td class="basemenus_td1">
        <div class="basemenus_item1">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_ph" >
                <table class="basemenus_table4"  cellPadding="0" cellSpacing="0" border=0>
                  <tr>
                    <td >
                      <a  href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">Performance</a>
                    </td>
                    <td class="basemenus_td6">
                      <a href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">(beta)</a>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{/if}}
    
    <td class="basemenus_td2"></td>
    
    {{if $menu->a == 5}}
      <td class="basemenus_td1Hilight" >
        <div class="basemenus_item">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_p" >
                <a  href="?t=users&m={%22a%22:5,%22b%22:1}" >Administrator</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{else}}
      <td class="basemenus_td1">
        <div class="basemenus_item1">
        <div class="row1"></div>
        <div class="row2"></div>
        <div class="row3"></div>
        <div class="row4"></div>
          <table cellPadding="0" cellSpacing="0">
            <tr>
              <td class="basemenus_ph" >
                <a  href="?t=users&m={%22a%22:5,%22b%22:1}" >Administrator</a>
              </td>
            </tr>
          </table>
        </div>
      </td>
    {{/if}}
    <td class="basemenus_td4"></td>
  </tr>
</table>


{{if $menu->a == 1}}
  <div align="center">
    <table class="basemenus_table2" cellPadding="0" cellSpacing="0" border=0>
      <tr>
        <td class="basemenus_td0" align="center">
          <table class="basemenus_table3" cellPadding="0" cellSpacing="0" border=0>
            <tr>
              <td>
                <div {{if $menu->b == 1}}class="basemenus_td31Hilight"{{else}}class="basemenus_td31"{{/if}}>
                  <a href = "?t=visitors&m={%22a%22:1,%22b%22:1}">Search</a>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 2}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href = "?t=visitornew&m={%22a%22:1,%22b%22:2}">New Visitor</a>
                </div>
              <td class="basemenus_td4"></td>
            </tr>
          </table>
        <td>
      </tr>
    </table>
  </div>
{{/if}}

{{if $menu->a == 2}}
  <div align="center">
    <table class="basemenus_table2" cellPadding="0" cellSpacing="0">
      <tr>
        <td class="basemenus_td0" align="center">
          <table class="basemenus_table3" cellPadding="0" cellSpacing="0" border=0>
            <tr>
              <td>
                <div {{if $menu->b == 1}}class="basemenus_td31Hilight"{{else}}class="basemenus_td31"{{/if}}>
                  <a href="?t=followup&m={%22a%22:2,%22b%22:1}&opts={%22follow%22:1}">Last updated</a>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 2}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a  href="?t=followup&m={%22a%22:2,%22b%22:2}&opts={%22follow%22:2}">Close to Wedding Day</a>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 3}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href="?t=followup&m={%22a%22:2,%22b%22:3}&opts={%22follow%22:3}">Follow up times</a>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 4}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href="?t=followup&m={%22a%22:2,%22b%22:4}&opts={%22follow%22:4}">Visits</a>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 5}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href="?t=followup&m={%22a%22:2,%22b%22:5}&opts={%22follow%22:5}">No Visits</a>
              </td>
              <td class="basemenus_td4"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
{{/if}}

{{if $menu->a == 3}}
  <div align="center">
    <table class="basemenus_table2" cellPadding="0" cellSpacing="0" border=0>
      <tr>
        <td class="basemenus_td0" align="center">
          <table class="basemenus_table3" cellPadding="0" cellSpacing="0" border=0>
            <tr>
              <td>
                <div {{if $menu->b == 1}}class="basemenus_td31Hilight"{{else}}class="basemenus_td31"{{/if}}>
                  <a href = "?t=statbasic&m={%22a%22:3,%22b%22:1}">Basic</a>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 2}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href = "?t=statadvanced&m={%22a%22:3,%22b%22:2}">Advanced</a>
                </div>
              <td class="basemenus_td4"></td>
            </tr>
          </table>
        <td>
      </tr>
    </table>
  </div>
{{/if}}

{{if $menu->a == 4}}
  <div align="center">
    <table class="basemenus_table2" cellPadding="0" cellSpacing="0" border=0>
      <tr>
        <td class="basemenus_td0" align="center">
          <table class="basemenus_table3" cellPadding="0" cellSpacing="0" border=0>
            <tr>
              <td>
                <div {{if $menu->b == 1}}class="basemenus_td31Hilight"{{else}}class="basemenus_td31"{{/if}}>
                  <table class="basemenus_table4"  cellPadding="0" cellSpacing="0" border=0>
                    <tr>
                      <td >
                        <a href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">Attitude</a>
                      </td>
                      <td class="basemenus_td6">
                        <a href = "?t=performanceattitude&m={%22a%22:4,%22b%22:1}">(beta)</a>
                      </td>
                    </tr>
                  </table>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 2}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <table class="basemenus_table4"  cellPadding="0" cellSpacing="0" border=0>
                    <tr>
                      <td >
                        <a href = "?t=performancepe&m={%22a%22:4,%22b%22:2}">Phone / Email Performance</a>
                      </td>
                      <td class="basemenus_td6">
                        <a href = "?t=performancepe&m={%22a%22:4,%22b%22:2}">(beta)</a>
                      </td>
                    </tr>
                  </table>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 3}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <table class="basemenus_table4"  cellPadding="0" cellSpacing="0" border=0>
                    <tr>
                      <td >
                        <a href = "?t=performancesales&m={%22a%22:4,%22b%22:3}">Sales Performance</a>
                      </td>
                      <td class="basemenus_td6">
                        <a href = "?t=performancesales&m={%22a%22:4,%22b%22:3}">(beta)</a>
                      </td>
                    </tr>
                  </table>
                </div>
              </td>
              <td class="basemenus_td4"></td>
            </tr>
          </table>
        <td>
      </tr>
    </table>
  </div>
{{/if}}

{{if $menu->a == 5}}
  <div align="center">
    <table class="basemenus_table2" cellPadding="0" cellSpacing="0" border=0>
      <tr>
        <td class="basemenus_td0" align="center">
          <table class="basemenus_table3" cellPadding="0" cellSpacing="0" border=0>
            <tr>
              <td>
                <div {{if $menu->b == 1}}class="basemenus_td31Hilight"{{else}}class="basemenus_td31"{{/if}}>
                  <a href="?t=users&m={%22a%22:5,%22b%22:1}">Manage User</a>
                </div>
              </td>
              <td class="basemenus_td5">
                |
              </td>
              <td>
                <div {{if $menu->b == 2}}class="basemenus_td3Hilight"{{else}}class="basemenus_td3"{{/if}}>
                  <a href="?t=emailtemplates&m={%22a%22:5,%22b%22:2}">Manage eTemplate</a>
                </div>
              </td>
              <td class="basemenus_td4"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
{{/if}}
