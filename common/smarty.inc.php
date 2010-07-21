<?php
// load Smarty library
require_once dirname(__FILE__) . '/../library/smarty/libs/Smarty.class.php';
$smarty = new Smarty;

$smarty->left_delimiter = '{{';
$smarty->right_delimiter = '}}';

$smarty->template_dir = dirname(__FILE__) . '/../template';
$smarty->config_dir = dirname(__FILE__) . '/../config';
$smarty->cache_dir = dirname(__FILE__) . '/smarty/cache';
$smarty->compile_dir = dirname(__FILE__) . '/smarty/template_c';
?>
