<?php
/* The configurations for dependencies.create.php */
$templatesDir = dirname(__FILE__) . '/../../template';
$javascriptsDir = dirname(__FILE__) . '/../../template';
$dependenciesDir = dirname(__FILE__) . '/../../template/include/_dependency';
require_once dirname(__FILE__) . '/../smarty.inc.php';
$left = $smarty->left_delimiter;
$right = $smarty->right_delimiter;

/* The configurations for orms.create.php */
$classesDir = dirname(__FILE__) . '/../../database/class';
$ormsDir = dirname(__FILE__) . '/../../database/_orm';
$includeFile = "$ormsDir/orm.inc.php";
$javascriptDatabaseDir = dirname(__FILE__) . '/../../template/include/_database';
$ormBaseFile = dirname(__FILE__) . '/../../library/pozzolana/orm/ORMBase.class.php';

/* The configurations for meta.create.php */
$metaDataFile = dirname(__FILE__) . '/../data.meta.php';
$javascriptMetaDataDir = dirname(__FILE__) . '/../../template/include/_metadata';

/* The configurations for meta.create.php */
$constantFile1 = dirname(__FILE__) . '/../data.cfg.php';
$constantFile2 = dirname(__FILE__) . '/../data.meta.php';
$javascriptConstantDir = dirname(__FILE__) . '/../../template/include/_constant';

/* The configurations for refresh.remove.php */
$smartyDir = dirname(__FILE__) . '/../smarty/template_c';
$ezpdoDir = dirname(__FILE__) . '/../../database/default/compiled';
?>