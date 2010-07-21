<?php
require_once './common/data.cfg.php';
require_once './common/data.meta.php';
require_once './common/smarty.inc.php';

header('Content-Type: text/javascript');

if (!ob_start("ob_gzhandler")) {
  ob_start();
}

$script = (isset($_GET['script'])) ? $_GET['script'] : NULL;
if (($script !== NULL) && (strpos($script, '.') === false)) {
  $name = "include/_dependency/dep_$script.tpl";
  if ($smarty->template_exists($name)) {
    $smarty->display($name);
  }
}
?>