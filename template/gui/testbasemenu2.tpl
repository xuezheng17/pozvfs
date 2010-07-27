

{{if $menu->a == 1}}
  <div align="center">
    <table class="basemenus2_tableWidth" cellPadding="0" cellSpacing="0">
      <tr>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 1}}class="basemenus2_manageCustomerHilight"{{else}}class="basemenus2_manageCustomer"{{/if}} onclick="location.href='?t=visitors&m={%22a%22:1,%22b%22:1}';">|---Search---|</div>
        </td>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 2}}class="basemenus2_manageOrderHilight"{{else}}class="basemenus2_manageOrder"{{/if}} onclick="location.href='?t=visitornew&m={%22a%22:1,%22b%22:2}';">|---New Visitor---|</div>
        </td>
        <td class="basemenus2_remainCell2"></td>
      </tr>
    </table>
  </div>
{{/if}}
  
{{if $menu->a == 2}}
  <div align="center">
    <table class="basemenus2_tableWidth" cellPadding="0" cellSpacing="0">
      <tr>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 1}}class="basemenus2_manageCustomerHilight"{{else}}class="basemenus2_manageCustomer"{{/if}} onclick="location.href='?t=followup&m={%22a%22:2,%22b%22:1}&opts={%22follow%22:1}';">|---Close to wedding day---|</div>
        </td>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 2}}class="basemenus2_manageOrderHilight"{{else}}class="basemenus2_manageOrder"{{/if}} onclick="location.href='?t=followup&m={%22a%22:2,%22b%22:2}&opts={%22follow%22:2}';">|---New Last updated---|</div>
        </td>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 2}}class="basemenus2_manageOrderHilight"{{else}}class="basemenus2_manageOrder"{{/if}} onclick="location.href='?t=followup&m={%22a%22:2,%22b%22:3}&opts={%22follow%22:3}';">|---Follow up times---|</div>
        </td>
        <td class="basemenus2_remainCell2"></td>
      </tr>
    </table>
  </div>
{{/if}}
  
{{if $menu->a == 4}}
  <div align="center">
    <table class="basemenus2_tableWidth" cellPadding="0" cellSpacing="0">
      <tr>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 1}}class="basemenus2_manageCustomerHilight"{{else}}class="basemenus2_manageCustomer"{{/if}} onclick="location.href='?t=users&m={%22a%22:4,%22b%22:1}';">|---users---|</div>
        </td>
        <td class="basemenus2_standardCell">
          <div {{if $menu->b == 2}}class="basemenus2_manageCustomerHilight"{{else}}class="basemenus2_manageCustomer"{{/if}} onclick="location.href='?t=useredit&m={%22a%22:4,%22b%22:2}';">|---new user---|</div>
        </td>
        <td class="basemenus2_remainCell2"></td>
      </tr>
    </table>
  </div>
{{/if}}