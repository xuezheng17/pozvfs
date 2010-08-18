<?php
class ORMpz_emailtemplate extends ORMBase {
  public function __construct() {
    parent::__construct('pz_emailtemplate');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->name = isset($object->name) ? $object->name : '';
    $epObject->subject = isset($object->subject) ? $object->subject : '';
    $epObject->content = isset($object->content) ? $object->content : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->name = $epObject->name;
    $object->subject = $epObject->subject;
    $object->content = $epObject->content;
    return $object;
  }
}
?>
