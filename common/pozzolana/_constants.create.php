<?php
/* This script (re)creates the metadata files.
 */
$data = array();

//echo "Removing old constant files...\n";
removeConstants($javascriptConstantDir);

//echo "Reading constants...\n";
readConstants($constantFile1);
readConstants($constantFile2);

//echo "Writing constant files...\n";
writeConstantFiles('Constant');

echo "Done.\n";

function removeConstants($dir) {
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

function readConstants($file) {
  global $data;
  
  $fp = file_get_contents($file);

  $matches = array();
  if (preg_match_all('/define\((\'.*\'), (\'.*\')\);/m', $fp, $matches)) {
    foreach ($matches[1] as $key => &$var) {
      $data[$var] = $matches[2][$key];
    }
  }
}

function writeConstantFiles($name) {
  global $javascriptConstantDir, $data;
  
  $file = "$javascriptConstantDir/" . strtolower($name) . '.tpl';
  $fp = fopen($file, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $file\n";
  } else {
    fprintf($fp, "function %s() {\n", $name);
    fprintf($fp, "};\n");
    fprintf($fp, "\n");
    foreach ($data as $key => &$var) {
      fprintf($fp, "$name.%s = '%s';\n", str_replace('\'', '', $key), str_replace('\'', '', $var));
    }
    fprintf($fp, "\n");
  }
  fclose($fp);
}
?>
