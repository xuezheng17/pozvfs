<?php
require_once dirname(__FILE__) . '/common/common.inc.php';

if (isset($_COOKIE[OPERATOR])) {
  $_SESSION[OPERATOR] = json_decode($_COOKIE[OPERATOR]);
}

$template = MiscUtils::getParam('t', 'signin');
$options = MiscUtils::getParam('opts', MiscUtils::encode(array()));

$smarty->assign('operator', MiscUtils::encode(array()));
$smarty->assign('now', MiscUtils::encode(SimpleDate::create()));
$smarty->assign('options', $options);
$smarty->assign('template', $template);
$smarty->display('gui/baseblank.tpl');
?>