<?php
abstract class ORMBase {
  private $dto;
  
  public function __construct($dto = '') {
    $this->dto = $dto;
  }
  
  public abstract function __toEpObject($myManager, $epObject, $object);
  
  public abstract function __toObject($myManager, $epObject, $object);
  
  public function add($myManager, $object) {
    $epObject = $myManager->create($this->dto);
    $epObject = $this->__toEpObject($myManager, $epObject, $object);
    return $epObject;
  }

  public function remove($myManager, $object) {
    $epObjects = $myManager->find("FROM $this->dto AS d WHERE d.oid = ?", $object->id);
    if (count($epObjects) === 1) {
      $epObject = $epObjects[0];
      $myManager->delete($epObject);
      return true;
    }
    return false;
  }
  
  public function disable($myManager, $object) {
    $epObjects = $myManager->find("FROM $this->dto AS d WHERE d.oid = ?", $object->id);
    if (count($epObjects) === 1) {
      $epObject = $epObjects[0];
      return $epObject;
    }
    return false;
  }

  public function update($myManager, $object) {
    $epObjects = $myManager->find("FROM $this->dto AS d WHERE d.oid = ?", $object->id);
    if (count($epObjects) === 1) {
      $epObject = $epObjects[0];
      $epObject = $this->__toEpObject($myManager, $epObject, $object);
      return $epObject;
    }
    return false;
  }
  
  public function find($myManager, $page, $size, $order, $queue, $condition, $func) {
    $page = ($page) ? $page : START;
    $size = ($size) ? $size : INFINITE;
    $order = ($order) ? $order : 'd.oid';
    $queue = ($queue) ? $queue : 'ASC';
    $where = ($condition) ? "WHERE $condition" : '';
    $pageSkip = ($page - 1) * $size;
    
    if ($func) {
      $result = new stdClass();
      $result->data = $myManager->find("$func FROM $this->dto AS d $where LIMIT $pageSkip, $size");
      return $result;
    }

    $epObjects = $myManager->find("FROM $this->dto AS d $where ORDER BY $order $queue LIMIT $pageSkip, $size");

    $objects = array();
    foreach ($epObjects as &$epObject) {
      $object = new stdClass();
      $object = $this->__toObject($myManager, $epObject, $object);
      $objects[] = $object;
    }
    
    $result = new stdClass();
    $result->data = $objects;
    $result->page = $page;
    $result->size = $size;
    $result->order = $order;
    $result->queue = $queue;
    $result->condition = $condition;
    $result->total = $myManager->find("COUNT(*) FROM $this->dto AS d $where");
    return $result;
  }
  
  public function __getEpObject_4_lvl_1_object($myManager, $object, $orm, $dto) {
    /* 如果有object的话，就要更新或新建 */
    if ($object) {
      /* 如果有id的话，就要更新 */
      if (isset($object->id)) {
        $epObjects = $myManager->find("FROM $dto AS d WHERE d.oid = " . $object->id);
        if (count($epObjects) === 1) {
          $epObject = $orm->__toEpObject($myManager, $epObjects[0], $object);
          return $epObject;
        }
      } /* 如果没有id的话，就要新建 */ else {
        $epObject = $myManager->create("$dto");
        $epObject = $orm->__toEpObject($myManager, $epObject, $object);
        return $epObject;
      }
    }
    return NULL;
  }
  
  public function __getObject_4_lvl_1_ep_object($myManager, $epObject, $orm) {
    return $orm->__toObject($myManager, $epObject, new stdClass());
  }
}
?>