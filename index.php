<?php
require_once dirname(__FILE__) . '/common/common.inc.php';

if (isset($_COOKIE[OPERATOR])) {
  $_SESSION[OPERATOR] = json_decode($_COOKIE[OPERATOR]);
}

$template = MiscUtils::getParam('t', 'signin');
$base = MiscUtils::getParam('b', 'base');
$options = MiscUtils::getParam('opts', MiscUtils::encode(array()));

$smarty->assign('operator', MiscUtils::encode(array()));
$smarty->assign('now', MiscUtils::encode(SimpleDate::create()));
$smarty->assign('options', $options);

$logout = MiscUtils::getParam('logout', NULL);
if ($logout === '') {
  unset($_SESSION[OPERATOR]);
  setcookie(OPERATOR, '', time() - 1, PATH, DOMAIN);
  $smarty->assign('template', 'signin');
  $smarty->display("gui/$base.tpl");
  return; /* SignOut */
}

if (isset($_SESSION[OPERATOR])) {
  if ($template == 'signin' || $template == 'signup') {
    $template = 'manage';
  }
  $smarty->assign('user', $_SESSION[OPERATOR]);
  $smarty->assign('operator', MiscUtils::encode($_SESSION[OPERATOR]));
  $smarty->assign('template', $template);
  $smarty->display("gui/$base.tpl");
  return;
} else {
  if ($template != 'signup') {
    $template = 'signin';
  }
  $smarty->assign('template', $template);
  $smarty->display("gui/$base.tpl");
  return; /* SignIn Required */
}
?>
