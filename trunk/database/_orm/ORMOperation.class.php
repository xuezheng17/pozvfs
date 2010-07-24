<?php
class ORMOperation extends ORMBase {
  public function __construct() {
    parent::__construct('Operation');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->visitId = isset($object->visitId) ? $object->visitId : '';
    $epObject->cancelled = isset($object->cancelled) ? $object->cancelled : 0;
    $epObject->operateType = isset($object->operateType) ? $object->operateType : '';
    $epObject->operator = isset($object->operator) ? $object->operator : '';
    $epObject->operatedDate = (isset($object->operatedDate) && $object->operatedDate) ? SimpleDate::toStamp($object->operatedDate) : 0;
    $epObject->content = isset($object->content) ? $object->content : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->visitId = $epObject->visitId;
    $object->cancelled = $epObject->cancelled;
    $object->operateType = $epObject->operateType;
    $object->operator = $epObject->operator;
    $object->operatedDate = ($epObject->operatedDate != 0) ? SimpleDate::fromStamp($epObject->operatedDate) : 0;
    $object->content = $epObject->content;
    return $object;
  }
}
?>
