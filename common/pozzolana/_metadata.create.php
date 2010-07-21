<?php
/* This script (re)creates the metadata files.
 */
$meta = array();

//echo "Removing old meta files...\n";
removeMetadata($javascriptMetaDataDir);

//echo "Reading meta data...\n";
readMeta($metaDataFile);

//echo "Writing meta data files...\n";
writeMetaFiles();

echo "Done.\n";

function removeMetadata($dir) {
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

function readMeta($file) {
  global $meta;
  
  $fp = file_get_contents($file);

  $matches = array();
  $data = array();
  if (preg_match_all('/define\((\'.*\'), (\'.*\')\);/m', $fp, $matches)) {
    $data = $matches[1];
  }
  
  $categories = array();
  if (preg_match_all('/meta (.*)\((.*)\)/m', $fp, $matches)) {
    foreach ($matches[1] as $key => &$match) {
      $categories[$match] = $matches[2][$key];
    }
  }
  
  foreach ($categories as $key => &$category) {
    $vars = array();
    foreach ($data as &$var) {
      if (stripos($var, $category) !== false) {
        $vars[] = $var;
      }
    }
    $meta[$key] = $vars;
  }
}

function writeMetaFiles() {
  global $meta;
  
  foreach ($meta as $category => &$data) {
    writeMetaFile($category, $data);
  }
}

function writeMetaFile($name, $data) {
  global $javascriptMetaDataDir;
  
  $file = "$javascriptMetaDataDir/" . strtolower($name) . '.meta.tpl';
  $fp = fopen($file, 'wt');
  if ($fp === false) {
    echo "ERROR: Failed to write: $file\n";
  } else {
    fprintf($fp, "function %s() {\n", $name);
    fprintf($fp, "};\n");
    fprintf($fp, "\n");
    fprintf($fp, "%s.array = function() {\n", $name);
    foreach ($data  as $key => &$var) {
      if ($key == 0) {
        fprintf($fp, "  return [ '{{\$smarty.const.%s|escape:javascript}}'%s\n", str_replace('\'', '', $var), ($key == (count($data) - 1)) ? '' : ',');
      } else {
        fprintf($fp, "           '{{\$smarty.const.%s|escape:javascript}}'%s\n", str_replace('\'', '', $var), ($key == (count($data) - 1)) ? '' : ',');
      }
    }
    fprintf($fp, "         ]\n");
    fprintf($fp, "};\n");
  }
  fclose($fp);
}
?>
