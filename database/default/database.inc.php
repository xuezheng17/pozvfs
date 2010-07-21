<?php
require_once dirname(__FILE__) . '/../../library/ezpdo/ezpdo_runtime.php';
require_once dirname(__FILE__) . '/../_orm/orm.inc.php';
epLoadConfig(dirname(__FILE__) . '/config.ini');

try {
  $myManager = epManager::instance();
} catch (PDOException $e) {
  echo $e->getMessage();
}
?>