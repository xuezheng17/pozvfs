<table class="basemenus_tableWidth" cellPadding="0" cellSpacing="0">
  <tr>
    <td class="basemenus_cellLeft"></td>
    <td class="basemenus_cellMiddle" align="right">
      <table class="basemenus_subTableWidth" cellPadding="0" cellSpacing="0">
        <tr>
          <td {{if $menu->a == 1}}class="basemenus_tasksHilight"{{else}}class="basemenus_tasks"{{/if}} onclick="location.href='?t=visitors&m={%22a%22:1,%22b%22:1}';">
            |---Visitor---|
          </td>
          <td {{if $menu->a == 2}}class="basemenus_customersHilight"{{else}}class="basemenus_customers"{{/if}} onclick="location.href='?t=followup&m={%22a%22:2,%22b%22:1}&opts={%22follow%22:1}';">
            |---Follow UP---|
          </td>
          <td {{if $menu->a == 3}}class="basemenus_incomeHilight"{{else}}class="basemenus_income"{{/if}} onclick="location.href='?t=performance&m={%22a%22:3}';">
            |---Performance---|
          </td>
          <td {{if $menu->a == 4}}class="basemenus_backendHilight"{{else}}class="basemenus_backend"{{/if}} onclick="location.href='?t=users&m={%22a%22:4,%22b%22:1}';">
            |---User---|
          </td>
        </tr>
      </table>
    </td>
    <td class="basemenus_cellRight"></td>
  </tr>
</table>