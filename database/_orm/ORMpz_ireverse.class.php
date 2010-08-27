<?php
class ORMpz_ireverse extends ORMBase {
  public function __construct() {
    parent::__construct('pz_ireverse');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->operator = isset($object->operator) ? $object->operator : '';
    $epObject->date = (isset($object->date) && $object->date) ? SimpleDate::toStamp($object->date) : 0;
    $epObject->content = isset($object->content) ? $object->content : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->operator = $epObject->operator;
    $object->date = ($epObject->date != 0) ? SimpleDate::fromStamp($epObject->date) : 0;
    $object->content = $epObject->content;
    return $object;
  }
}
?>
