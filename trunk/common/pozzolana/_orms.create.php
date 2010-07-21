<?php
/* This script (re)creates the orm files required for Database.
 */
require_once dirname(__FILE__) . '/config.ini.php';

$myClasses = array();

//echo "Removing old PHP orms...\n";
removeOrms($ormsDir);

//echo "Removing old Javascript classes...\n";
removeOrms($javascriptDatabaseDir);

//echo "Reading attributes...\n";
readMyClasses($classesDir, 'readAttributes');

//echo "Reading variables...\n";
readMyClasses($classesDir, 'readVariables');

//echo "Copying PHP library files...\n";
copy("$ormBaseFile", "$ormsDir/" . basename($ormBaseFile));

//echo "Writing PHP orms...\n";
writeOrms();

//echo "Writing orm.inc.file...\n";
writeInclude();

//echo "Writing Javascript classes...\n";
writeClasses();

echo "Done.\n";

function removeOrms($dir) {
  $dh = opendir($dir);
  if (!$dh) {
    echo "ERROR: Couldn't open directory: $dir\n";
    return;
  }

  while (($file = readdir($dh)) !== false) {
    $name = "$dir/$file";
    if (is_dir($name)) {
      continue;
    }
    unlink($name);
  }

  closedir($dh);
}

function readMyClasses($dir, $func) {
  global $ormsDir;

  $dh = opendir($dir);
  if (!$dh) {
    echo "ERROR: Couldn't open directory: $dir\n";
    return;
  }

  while (($file = readdir($dh)) !== false) {
    if ($file[0] == '.') {
      continue;
    }

    $name = "$dir/$file";

    if (is_dir($name)) {
      if ($name != $ormsDir) {
        echo " -> $name\n";
        readMyClasses($name, $func);
      }
      continue;

    } else {
      $fp = file_get_contents($name);
      if ($fp === false) {
        echo "ERROR: Failed to read: $name\n";
      } else {
        call_user_func($func, $name, $fp);
      }
    }
  }

  closedir($dh);
}

function readAttributes($file, $fp) {
  global $myClasses;

  $matches = array();
  if (preg_match_all('/orm (.*)/m', $fp, $matches)) {
    $myClasses[$file]['attr'] = $matches[1];
  }
}

function readVariables($file, $fp) {
  global $myClasses;

  $matches = array();
  if (preg_match_all('/public \$(.*);/m', $fp, $matches)) {
    $myClasses[$file]['var'] = $matches[1];
  }
}

function writeOrms() {
  global $myClasses;
  
  foreach ($myClasses as $name => &$class) {
    writeOrm($name, $class['attr'], $class['var']);
  }
}

function writeOrm($file, $attributes, $variables) {
  global $ormsDir;
  
  $name = basename($file);
  $name = substr($name, 0, stripos($name, '.'));
  $file = "$ormsDir/ORM$name.class.php";
  $fp = fopen($file, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $file\n";
  } else {
    fprintf($fp, "<?php\n");
    fprintf($fp, "class ORM%s extends ORMBase {\n", $name);
    fprintf($fp, "  public function __construct() {\n");
    fprintf($fp, "    parent::__construct('%s');\n", $name);
    fprintf($fp, "  }\n");
    fprintf($fp, "\n");
    fprintf($fp, "  public function __toEpObject(\$myManager, \$epObject, \$object) {\n");
    __toEpObject($fp, $attributes, $variables);
    fprintf($fp, "    return \$epObject;\n");
    fprintf($fp, "  }\n");
    fprintf($fp, "\n");
    fprintf($fp, "  public function __toObject(\$myManager, \$epObject, \$object) {\n");
    __toObject($fp, $attributes, $variables);
    fprintf($fp, "    return \$object;\n");
    fprintf($fp, "  }\n");
    fprintf($fp, "}\n");
    fprintf($fp, "?>\n");
  
    fclose($fp);
  }
}

function __toEpObject($fp, $attributes, $variables) {
  __writeImportedOrms($fp, $attributes);
  
  __writeContent($fp, $attributes, $variables, '__toEpObject');
}

function __toObject($fp, $attributes, $variables) {
  __writeImportedOrms($fp, $attributes);
  
  fprintf($fp, "    \$object->id = \$epObject->oid;\n");
  __writeContent($fp, $attributes, $variables, '__toObject');
}

function __writeImportedOrms($fp, $attributes) {
  global $myClasses;
  
  $orms = array();
  foreach ($attributes as &$attribute) {
    $contents = explode(' ', $attribute);
    if(count($contents) == 3) {
      $contents[2] = trim($contents[2]);
      $orms[] = $contents[2];
    }
  }
  
  $orms = array_unique($orms);
  sort($orms);
  
  foreach ($orms as &$orm) {
    fprintf($fp, "    require_once dirname(__FILE__) . '/ORM%s.class.php';\n", $orm);
  }
}

function __writeContent($fp, $attributes, $variables, $which) {
  if ($which == '__toEpObject') {
    foreach ($attributes as $key => &$attribute) {
      $variable = $variables[$key];
      
      $variable = trim($variable);
      $attribute = trim($attribute);
      
      $contents = explode(' ', $attribute);
      if (count($contents) == 1) {
        if ($contents[0] == 'date') {
          fprintf($fp, "    \$epObject->%s = (isset(\$object->%s) && \$object->%s) ? SimpleDate::toStamp(\$object->%s) : 0;\n", $variable, $variable, $variable, $variable);
        } else {
          $default = 0;
          if (stripos($contents[0], 'char') !== false || stripos($contents[0], 'clob') !== false || stripos($contents[0], 'blob') !== false) {
            $default = '\'\'';
          }
          fprintf($fp, "    \$epObject->%s = isset(\$object->%s) ? \$object->%s : %s;\n", $variable, $variable, $variable, $default);
        }
      } else if (count($contents) == 3) {
        if ($contents[1] == 'one') {
          __writeOne($fp, $contents[2], $variable, $which);
        } else if ($contents[1] == 'many') {
          __writeMany($fp, $contents[2], $variable, $which);
        }
      }
    }
  } else if ($which == '__toObject') {
    foreach ($attributes as $key => &$attribute) {
      $variable = $variables[$key];
      
      $variable = trim($variable);
      $attribute = trim($attribute);
      
      $contents = explode(' ', $attribute);
      if (count($contents) == 1) {
        if (trim($contents[0]) == 'date') {
          fprintf($fp, "    \$object->%s = (\$epObject->%s != 0) ? SimpleDate::fromStamp(\$epObject->%s) : 0;\n", $variable, $variable, $variable);
        } else {
          $default = 0;
          if (stripos($contents[0], 'char') !== false || stripos($contents[0], 'clob') !== false || stripos($contents[0], 'blob') !== false) {
            $default = '\'\'';
          }
          fprintf($fp, "    \$object->%s = \$epObject->%s;\n", $variable, $variable);
        }
      } else if (count($contents) == 3) {
        if ($contents[1] == 'one') {
          __writeOne($fp, $contents[2], $variable, $which);
        } else if ($contents[1] == 'many') {
          __writeMany($fp, $contents[2], $variable, $which);
        }
      }
    }
  }
}

function __writeOne($fp, $attribute, $variable, $which) {
  if ($which == '__toEpObject') {
    fprintf($fp, "    if (isset(\$object->%s) && \$object->%s) {\n", $variable, $variable);
    fprintf($fp, "        \$epObject->%s = \$this->__getEpObject_4_lvl_1_object(\$myManager, \$object->%s, new ORM%s(), '%s');\n", $variable, $variable, $attribute, $attribute);
    fprintf($fp, "    } else {\n");
    fprintf($fp, "      if (isset(\$epObject->%s)) {\n", $variable);
    fprintf($fp, "        \$my_manager->delete(\$epObject->%s);\n", $variable);
    fprintf($fp, "      }\n", $variable);
    fprintf($fp, "    }\n");
  } else if ($which == '__toObject') {
    fprintf($fp, "    if (isset(\$epObject->%s)) {\n", $variable);
    fprintf($fp, "      \$object->%s = \$this->__getObject_4_lvl_1_ep_object(\$myManager, \$epObject->%s, new ORM%s());\n", $variable, $variable, $attribute);
    fprintf($fp, "    }\n");
  }
}

function __writeMany($fp, $attribute, $variable, $which) {
  if ($which == '__toEpObject') {
    fprintf($fp, "    if (isset(\$epObject->%s)) {\n", $variable);
    fprintf($fp, "      \$epObject->%s->removeAll();\n", $variable);
    fprintf($fp, "      foreach (\$object->%s as &\$item) {\n", $variable);
    fprintf($fp, "        \$epObject->%s[] = \$this->__getEpObject_4_lvl_1_object(\$myManager, \$item, new ORM%s(), '%s');\n", $variable, $attribute, $attribute);
    fprintf($fp, "      }\n", $variable);
    fprintf($fp, "    }\n", $variable);
  } else if ($which == '__toObject') {
    fprintf($fp, "    \$object->%s = array();\n", $variable);
    fprintf($fp, "    if (isset(\$epObject->%s)) {\n", $variable);
    fprintf($fp, "      foreach (\$epObject->%s as &\$item) {\n", $variable);
    fprintf($fp, "        \$object->%s[] = \$this->__getObject_4_lvl_1_ep_object(\$myManager, \$item, new ORM%s());\n", $variable, $attribute);
    fprintf($fp, "      }\n");
    fprintf($fp, "    }\n", $variable);
  }
}

function writeInclude() {
  global $includeFile, $myClasses;
  
  $fp = fopen($includeFile, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $includeFile\n";
  } else {
    fprintf($fp, "<?php\n");
    fprintf($fp, "require_once dirname(__FILE__) . '/ORMBase.class.php';\n");
    fprintf($fp, "function classToOrm(\$class = NULL) {\n");
    fprintf($fp, "  \$class = strtolower(\$class);\n");
    fprintf($fp, "  switch (\$class) {\n");
    
    $files = array_keys($myClasses);
    sort($files);
    
    foreach ($files as &$file) {
      $name = basename($file);
      $name = substr($name, 0, stripos($name, '.'));
      fprintf($fp, "    case '%s':\n", strtolower($name));
      fprintf($fp, "      require_once dirname(__FILE__) . '/ORM%s.class.php';\n", $name);
      fprintf($fp, "      return new ORM%s();\n", $name);
    }
    
    fprintf($fp, "    default:\n");
    fprintf($fp, "      return NULL;\n");
    fprintf($fp, "  }\n");
    fprintf($fp, "  return NULL;\n");
    fprintf($fp, "}\n");
    fprintf($fp, "?>\n");
    
    fclose($fp);
  }
}

function writeClasses() {
  global $myClasses;
  
  foreach ($myClasses as $name => &$class) {
    writeClass($name, $class['attr'], $class['var']);
  }
}

function writeClass($file, $attributes, $variables) {
  global $javascriptDatabaseDir;
  
  $name = basename($file);
  $name = substr($name, 0, stripos($name, '.'));
  $file = "$javascriptDatabaseDir/" . strtolower($name) . '.class.tpl';
  $fp = fopen($file, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $file\n";
  } else {
    fprintf($fp, "function %s() {\n", $name);
    fprintf($fp, "};\n");
    fprintf($fp, "\n");
    fprintf($fp, "%s.instance = function() {\n", $name);
    
    foreach ($attributes as $key => &$attribute) {
      $variable = $variables[$key];
      
      $variable = trim($variable);
      $attribute = trim($attribute);
      
      $default = 'null';
      $contents = explode(' ', $attribute);
      if (count($contents) == 1) {
        if (stripos($contents[0], 'char') !== false || stripos($contents[0], 'clob') !== false || stripos($contents[0], 'blob') !== false) {
          $default = '\'\'';
        } else if (stripos($contents[0], 'date') !== false) {
          $default = 'SimpleDate.create()';
        } else {
          $default = 0;
        }
      } else if (count($contents) == 3) {
        if ($contents[1] == 'one') {
          if ($contents[0] == 'composed_of') {
            $default = $contents[2] . '.instance()';
          } else if ($contents[0] == 'has') {
            $default = 'null';
          }
        } else if ($contents[1] == 'many') {
          $default = '[]';
        }
      }
      
      if ($variable == 'trackId') {
        $default = 'MiscUtils.unique()';
      }
      
      if ($key == 0) {
        fprintf($fp, "  return { %s: %s%s\n", $variable, $default, ($key == (count($attributes) - 1)) ? '' : ',');
      } else {
        fprintf($fp, "           %s: %s%s\n", $variable, $default, ($key == (count($attributes) - 1)) ? '' : ',');
      }
    }
    fprintf($fp, "         }\n");
    fprintf($fp, "};\n");
    fclose($fp);
  }
}
?>
