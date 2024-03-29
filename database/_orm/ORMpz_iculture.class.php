<?php
class ORMpz_iculture extends ORMBase {
  public function __construct() {
    parent::__construct('pz_iculture');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->name = isset($object->name) ? $object->name : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->name = $epObject->name;
    return $object;
  }
}
?>
