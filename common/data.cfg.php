<?php
define('DOMAIN', $_SERVER["SERVER_NAME"]);
define('PATH', '/pozvfs');

define('START', 1);
define('INFINITE', 99999);
define('SIZE', 8);

define('DATABASE', 'default');
define('SESSION', 'pozvfs');

define('READ', 'jsonread.php');
define('WRITE', 'jsonwrite.php');
define('CUSTOM', 'myphp/jsoncustom.php');

define('OPERATOR', 'operator');
?>