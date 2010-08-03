<?php
class ORMVisitorCancel extends ORMBase {
  public function __construct() {
    parent::__construct('VisitorCancel');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->date = (isset($object->date) && $object->date) ? SimpleDate::toStamp($object->date) : 0;
    $epObject->userAccount = isset($object->userAccount) ? $object->userAccount : '';
    $epObject->message = isset($object->message) ? $object->message : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->date = ($epObject->date != 0) ? SimpleDate::fromStamp($epObject->date) : 0;
    $object->userAccount = $epObject->userAccount;
    $object->message = $epObject->message;
    return $object;
  }
}
?>
