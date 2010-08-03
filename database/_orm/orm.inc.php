<?php
require_once dirname(__FILE__) . '/ORMBase.class.php';
function classToOrm($class = NULL) {
  $class = strtolower($class);
  switch ($class) {
    case 'emailtemplate':
      require_once dirname(__FILE__) . '/ORMEmailTemplate.class.php';
      return new ORMEmailTemplate();
    case 'iceremony':
      require_once dirname(__FILE__) . '/ORMICeremony.class.php';
      return new ORMICeremony();
    case 'iculture':
      require_once dirname(__FILE__) . '/ORMICulture.class.php';
      return new ORMICulture();
    case 'ireception':
      require_once dirname(__FILE__) . '/ORMIReception.class.php';
      return new ORMIReception();
    case 'isource':
      require_once dirname(__FILE__) . '/ORMISource.class.php';
      return new ORMISource();
    case 'operation':
      require_once dirname(__FILE__) . '/ORMOperation.class.php';
      return new ORMOperation();
    case 'user':
      require_once dirname(__FILE__) . '/ORMUser.class.php';
      return new ORMUser();
    case 'visitor':
      require_once dirname(__FILE__) . '/ORMVisitor.class.php';
      return new ORMVisitor();
    case 'visitorcancel':
      require_once dirname(__FILE__) . '/ORMVisitorCancel.class.php';
      return new ORMVisitorCancel();
    default:
      return NULL;
  }
  return NULL;
}
?>
