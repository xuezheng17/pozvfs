<?php
require_once dirname(__FILE__) . '/config.ini.php';
echo 'Creating orms... ';
require_once dirname(__FILE__) . '/_orms.create.php';
echo 'Creating metadata... ';
require_once dirname(__FILE__) . '/_metadata.create.php';
echo 'Creating constants... ';
require_once dirname(__FILE__) . '/_constants.create.php';
echo 'Creating dependencies... ';
require_once dirname(__FILE__) . '/_dependencies.create.php';
echo 'Removing cache... ';
require_once dirname(__FILE__) . '/_cache.remove.php';
?>