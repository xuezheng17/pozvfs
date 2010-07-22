<?php
require_once dirname(__FILE__) . '/ORMBase.class.php';
function classToOrm($class = NULL) {
  $class = strtolower($class);
  switch ($class) {
    case 'operation':
      require_once dirname(__FILE__) . '/ORMOperation.class.php';
      return new ORMOperation();
    case 'visitor':
      require_once dirname(__FILE__) . '/ORMVisitor.class.php';
      return new ORMVisitor();
    default:
      return NULL;
  }
  return NULL;
}
?>
