<?php
/* This script (re)creates the dependency files required for JavaScript.
 */
$classes = array();
$dependencies = array();

//echo "Removing old dependencies...\n";
removeDependencies($dependenciesDir);

//echo "Reading classes...\n";
readTemplates($javascriptsDir, 'readClasses');

//echo "Reading dependencies\n";
readTemplates($templatesDir, 'readDependencies');

//echo "Validating dependencies...\n";
foreach ($dependencies as $template => &$depclasses) {
  foreach ($depclasses as $key => &$class) {
    if (!isset($classes[$class])) {
      die("ERROR: Class not found: $class\n");
    }
    if ($template == $classes[$class]) {
      //this class thinks it depends on itself
      //echo "  $template has $class\n";
      unset($depclasses[$key]);
    }
  }
  unset($class);
}
unset($depclasses);

foreach ($classes as $class1 => &$template1) {
  foreach ($dependencies[$template1] as &$name) {
    $template2 = $classes[$name];
    foreach ($dependencies[$template2] as &$class2) {
      if ($class1 == $class2) {
        die("ERROR: Circular reference in $template1 ($class1) and $template2 ($class2)\n");
      }
    }
    unset($class2);
  }
  unset($name);
}
unset($template1);


//echo "Writing dependencies...\n";
foreach ($dependencies as $template => &$depclasses) {
  //echo "  $template\n";
  //foreach ($depclasses as &$class) {
  //  echo "    $class\n";
  //}
  $deps = array();
  processDependencis($depclasses, $deps);
  $sz = count($deps);
  if ($sz == 0 || strpos($template, 'gui/page') == false) {
    continue;
  }

  $file = "$dependenciesDir/dep_" . basename($template);
  $fp = fopen($file, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $file\n";
  } else {
    $included = array();
    for ($i = ($sz - 1); $i >= 0; $i--) {
      $name = $deps[$i];
      if (in_array($name, $included)) {
        continue;
      }
      fprintf($fp, "%sinclude file='%s'%s\n", $left, str_replace($javascriptsDir . '/', '', $name), $right);
      $included[] = $name;
    }
    fclose($fp);
  }
}
unset($depclasses);

echo "Done.\n";

function processDependencis($depclasses, &$deps) {
  global $dependencies, $classes;

  foreach ($depclasses as &$class) {
    $subclass = $classes[$class];
    //echo "    -> $subclass\n";
    $deps[] = $subclass;

    if (isset($dependencies[$subclass])) {
      processDependencis($dependencies[$subclass], $deps);
    }
  }
  unset($class);
}

function readTemplates($dir, $func) {
  global $left, $right, $dependenciesDir;

  $dh = opendir($dir);
  if (!$dh) {
    echo "ERROR: Couldn't open directory: $dir\n";
    return;
  }

  
  while (($file = readdir($dh)) !== false) {
    if ($file[0] == '.' || substr($file, 0, 4) == 'dep_') {
      continue;
    }

    $name = "$dir/$file";

    if (is_dir($name)) {
      if ($name != $dependenciesDir) {
        //echo " -> $name\n";
        readTemplates($name, $func);
      }
      continue;

    } else {
      $fp = file_get_contents($name);
      $fp = preg_replace("/$left.*$right/Us", '', $fp);
      if ($fp === false) {
        echo "ERROR: Failed to read: $name\n";
      } else {
        call_user_func($func, $name, $fp);
      }
    }
  }

  closedir($dh);
}

function readClasses($file, $fp) {
  global $classes;

  $matches = array();
  if (preg_match_all('/^function ([A-Z]+\w+)\(.*\) {/m', $fp, $matches)
      || preg_match_all('/^([A-Z]+\w+) = function\(\) {/m', $fp, $matches)
      || preg_match_all('/(JSON)\s*=\s*function\(\)/', $fp, $matches)) {
    $classes[$matches[1][0]] = $file;
    //echo "  Found: {$matches[1][0]} in $file\n";
  }
}

function readDependencies($file, $fp) {
  global $dependencies, $classes;

  foreach ($classes as $class => &$template) {
    if (!isset($dependencies[$file])) {
      $dependencies[$file] = array();
      //echo "$file:\n";
    }
    if (strpos($fp, $class) !== false) {
      $matches = array();
      if (preg_match_all("/new\s+$class\(.*\)/m", $fp, $matches) || preg_match_all("/[\s(]+$class\.\w+[\(,\);\]]/m", $fp, $matches) || preg_match_all("/[\s(]+$class\.\w/m", $fp, $matches)) {
        $dependencies[$file][] = $class;
        //echo "  $class\n";
      }
    }
  }
  unset($template);
}

function removeDependencies($dir) {
  $dh = opendir($dir);
  if (!$dh) {
    echo "ERROR: Couldn't open directory: $dir\n";
    return;
  }

  while (($file = readdir($dh)) !== false) {
    if (($file[0] == '.') || (!preg_match('/^dep_.+\.tpl$/', $file))) {
      continue;
    }
    $name = "$dir/$file";
    if (is_dir($name)) {
      continue;
    }
    unlink($name);
  }

  closedir($dh);
}
?>
