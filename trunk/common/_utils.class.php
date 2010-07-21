<?php
class Utils {
  public static function unique() {
    $unique = 'u' . (mktime() * rand());
    return $unique;
  }
}
?>