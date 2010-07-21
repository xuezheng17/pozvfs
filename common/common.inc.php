<?php
require_once dirname(__FILE__) . '/data.cfg.php';
require_once dirname(__FILE__) . '/data.meta.php';
require_once dirname(__FILE__) . '/smarty.inc.php';
require_once dirname(__FILE__) . '/MiscUtils.class.php';
require_once dirname(__FILE__) . '/SimpleDate.class.php';

session_name(SESSION);
session_start();

$smarty->assign('w3cDoctype', DOC_TYPE_STRICT);

$database = DATABASE;
?>