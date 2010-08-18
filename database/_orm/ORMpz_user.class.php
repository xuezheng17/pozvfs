<?php
class ORMpz_user extends ORMBase {
  public function __construct() {
    parent::__construct('pz_user');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->account = isset($object->account) ? $object->account : '';
    $epObject->password = isset($object->password) ? $object->password : '';
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->account = $epObject->account;
    $object->password = $epObject->password;
    return $object;
  }
}
?>
