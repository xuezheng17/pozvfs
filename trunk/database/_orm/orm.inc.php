<?php
require_once dirname(__FILE__) . '/ORMBase.class.php';
function classToOrm($class = NULL) {
  $class = strtolower($class);
  switch ($class) {
    case 'datezone':
      require_once dirname(__FILE__) . '/ORMdatezone.class.php';
      return new ORMdatezone();
    case 'emailtemplate':
      require_once dirname(__FILE__) . '/ORMemailtemplate.class.php';
      return new ORMemailtemplate();
    case 'iceremony':
      require_once dirname(__FILE__) . '/ORMiceremony.class.php';
      return new ORMiceremony();
    case 'iculture':
      require_once dirname(__FILE__) . '/ORMiculture.class.php';
      return new ORMiculture();
    case 'iopponent':
      require_once dirname(__FILE__) . '/ORMiopponent.class.php';
      return new ORMiopponent();
    case 'ireception':
      require_once dirname(__FILE__) . '/ORMireception.class.php';
      return new ORMireception();
    case 'isource':
      require_once dirname(__FILE__) . '/ORMisource.class.php';
      return new ORMisource();
    case 'operation':
      require_once dirname(__FILE__) . '/ORMoperation.class.php';
      return new ORMoperation();
    case 'user':
      require_once dirname(__FILE__) . '/ORMuser.class.php';
      return new ORMuser();
    case 'visitor':
      require_once dirname(__FILE__) . '/ORMvisitor.class.php';
      return new ORMvisitor();
    default:
      return NULL;
  }
  return NULL;
}
?>
