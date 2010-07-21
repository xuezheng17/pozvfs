<?php
require_once dirname(__FILE__) . '/common/common.inc.php';
require_once dirname(__FILE__) . "/database/$database/database.inc.php";
  
header('Content-Type: text/plain');

$class = MiscUtils::decryptParam('name', NULL);
$function = MiscUtils::decryptParam('f', NULL);
$condition = MiscUtils::decryptParam('c', NULL);
$order = MiscUtils::decryptParam('o', NULL);
$queue = MiscUtils::decryptParam('q', NULL);
$page = MiscUtils::decryptParam('p', NULL);
$size = MiscUtils::decryptParam('s', NULL);

$orm = classToOrm($class);
if ($orm) {
  try {
    $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
    echo MiscUtils::encode($result);
  } catch (PDOException $e) {
    echo MiscUtils::encode($e->getMessage());
  }
}
?>