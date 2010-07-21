{{if $w3cDoctype == $smarty.const.DOC_TYPE_STRICT}}<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">{{elseif $w3cDoctype == $smarty.const.DOC_TYPE_LOOSE}}<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">{{/if}}
{{config_load file='npfile.conf'}}
<html>
  <head>
    {{include file='gui/base.inc.tpl'}}
    <style>
      html,body {
      }
      .base_mainBg {

        background-image: url(image/common/background.jpg); 
      background-repeat: no-repeat;
      width: 1024px;
      height: 900px;
      }
    .base_td1 {
      background-image: url(image/common/background.png); 
      background-repeat: no-repeat;
      width: 1024px;
      height: 900px;
    }
    .base_td2 {
      background-image: url(image/common/left-line.png); 
      background-repeat: repeat-x;
      height: 900px;
    }
    .base_td3 {
      background-image: url(image/common/right-line.png); 
      background-repeat: repeat-x;
      height: 900px;
    }
    </style>
  </head>
  
  <body >
    <div align="center" class="base_td2">
      <div class="base_mainBg">
        {{include file="gui/page/$template.tpl"}}
        {{include file="gui/basesubscript.tpl"}}
      </div>
    </div>
  </body>
</html>