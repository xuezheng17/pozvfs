<?php
require_once dirname(__FILE__) . '/common/common.inc.php';

if (isset($_COOKIE[OPERATOR])) {
  $_SESSION[OPERATOR] = json_decode($_COOKIE[OPERATOR]);
}

$template = MiscUtils::getParam('t', 'signin');
$base = MiscUtils::getParam('b', 'base');
$menu = MiscUtils::getParam('m', json_encode(array()));
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
  $template = ($template == 'signin') ? 'visitornew' : $template;
  if ($menu == json_encode(array())) {
    $menu = new stdClass();
    $menu->a = 1;
    $menu->b = 1;
    $menu = json_encode($menu);
  }
  
  $smarty->assign('userInfo', $_SESSION[OPERATOR]->account);
  
  $smarty->assign('template', $template);

  $smarty->assign('menu', json_decode($menu));
  
  $smarty->assign('operator', MiscUtils::encode($_SESSION[OPERATOR]));
  $smarty->assign('now', MiscUtils::encode(SimpleDate::create()));
  $smarty->assign('options', urldecode($options));
  $smarty->display("gui/$base.tpl");
  return;
} else {
  $smarty->assign('template', 'signin');
  $smarty->display("gui/$base.tpl");
  return; /* SignIn Required */
}
?>
