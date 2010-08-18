<?php
require_once dirname(__FILE__) . '/ORMBase.class.php';
function classToOrm($class = NULL) {
  $class = strtolower($class);
  switch ($class) {
    case 'pz_datezone':
      require_once dirname(__FILE__) . '/ORMpz_datezone.class.php';
      return new ORMpz_datezone();
    case 'pz_emailtemplate':
      require_once dirname(__FILE__) . '/ORMpz_emailtemplate.class.php';
      return new ORMpz_emailtemplate();
    case 'pz_icategory':
      require_once dirname(__FILE__) . '/ORMpz_icategory.class.php';
      return new ORMpz_icategory();
    case 'pz_iceremony':
      require_once dirname(__FILE__) . '/ORMpz_iceremony.class.php';
      return new ORMpz_iceremony();
    case 'pz_iculture':
      require_once dirname(__FILE__) . '/ORMpz_iculture.class.php';
      return new ORMpz_iculture();
    case 'pz_iopponent':
      require_once dirname(__FILE__) . '/ORMpz_iopponent.class.php';
      return new ORMpz_iopponent();
    case 'pz_ireception':
      require_once dirname(__FILE__) . '/ORMpz_ireception.class.php';
      return new ORMpz_ireception();
    case 'pz_isource':
      require_once dirname(__FILE__) . '/ORMpz_isource.class.php';
      return new ORMpz_isource();
    case 'pz_operation':
      require_once dirname(__FILE__) . '/ORMpz_operation.class.php';
      return new ORMpz_operation();
    case 'pz_user':
      require_once dirname(__FILE__) . '/ORMpz_user.class.php';
      return new ORMpz_user();
    case 'pz_visitor':
      require_once dirname(__FILE__) . '/ORMpz_visitor.class.php';
      return new ORMpz_visitor();
    default:
      return NULL;
  }
  return NULL;
}
?>
