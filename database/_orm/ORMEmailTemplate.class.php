<?php
class ORMEmailTemplate extends ORMBase {
  public function __construct() {
    parent::__construct('EmailTemplate');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->name = isset($object->name) ? $object->name : '';
    $epObject->content = isset($object->content) ? $object->content : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->name = $epObject->name;
    $object->content = $epObject->content;
    return $object;
  }
}
?>
