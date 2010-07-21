<?php
require_once dirname(__FILE__) . '/common/common.inc.php';
require_once dirname(__FILE__) . "/database/$database/database.inc.php";
  
header('Content-Type: text/plain');

$class = MiscUtils::decryptParam('name', NULL);
$objectsToAddOrUpdate = json_decode(MiscUtils::decryptParam('o', NULL));
$objectsToRemove = json_decode(MiscUtils::decryptParam('r', NULL));

$orm = classToOrm($class);
if ($orm) {
  try {
    $myManager->start_t();
    foreach ($objectsToAddOrUpdate as &$object) {
      if (isset($object->id)) {
        $orm->update($myManager, $object);
      } else {
        $orm->add($myManager, $object);
      }
    }
    foreach ($objectsToRemove as &$object) {
      $orm->remove($myManager, $object);
    }
    $myManager->commit_t();
    echo MiscUtils::encode(array());
  } catch (PDOException $e) {
    echo MiscUtils::encode($e->getMessage());
  }
}
?>