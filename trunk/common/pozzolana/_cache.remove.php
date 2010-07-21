<?php
/* This script (re)creates the orm files required for Database.
 */
//echo "Removing old ezpdo compiled file...\n";
removePrevious($smartyDir);

//echo "Removing old smarty compiled file...\n";
removePrevious($ezpdoDir);

echo "Done.\n";

function removePrevious($dir) {
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
?>
