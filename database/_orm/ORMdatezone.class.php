<?php
class ORMdatezone extends ORMBase {
  public function __construct() {
    parent::__construct('datezone');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->start = (isset($object->start) && $object->start) ? SimpleDate::toStamp($object->start) : 0;
    $epObject->end = (isset($object->end) && $object->end) ? SimpleDate::toStamp($object->end) : 0;
    $epObject->page = isset($object->page) ? $object->page : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->start = ($epObject->start != 0) ? SimpleDate::fromStamp($epObject->start) : 0;
    $object->end = ($epObject->end != 0) ? SimpleDate::fromStamp($epObject->end) : 0;
    $object->page = $epObject->page;
    return $object;
  }
}
?>
