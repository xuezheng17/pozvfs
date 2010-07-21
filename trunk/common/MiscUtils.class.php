<?php
class MiscUtils {
  public static function dump($obj, $what = NULL) {
    if (defined ('DEBUG_ENABLED') && ! DEBUG_ENABLED) {
      return;
    }
    echo "<pre>\n";
    if (is_null ($obj)) {
      echo ($what !== NULL) ? "$what=!NULL!" : '!NULL!';
    } else if ($obj === '') {
      echo ($what !== NULL) ? "$what=!EMPTY!" : '!EMPTY!';
    } else if ($obj === false) {
      echo ($what !== NULL) ? "$what=!FALSE!" : '!FALSE!';
    } else {
      if ($what !== NULL) {
        echo "$what=<br>";
      }
      echo htmlspecialchars (print_r ($obj, true));
    }
    echo "</pre>\n";
  }
  
  public static function getParam($itm, $default = '', $trimText = false) {
    if (isset($_POST[$itm])) {
      return ($trimText) ? trim($_POST[$itm]) : $_POST[$itm];
    } else if (isset($_GET[$itm])) {
      return ($trimText) ? trim($_GET[$itm]) : $_GET[$itm];
    } else {
      return $default;
    }
  }
  
  public static function decryptParam($itm, $default = '', $trimText = false) {
    return MiscUtils::decrypt(MiscUtils::getParam($itm, $default = '', $trimText = false));
  }
  
  public static function digits($value, $size) {
    $prefix = '';
    for ($i = 0, $il = $size - strlen($value); $i < $il; $i++) {
      $prefix .= '0';
    }
    return $prefix . $value;
  }
  
  public static function encrypt($str) {/**
    $result = '';
    for ($i = 0, $il = strlen($str); $i < $il; $i++) {
      $char = substr($str, $i, 1);
      $result .= MiscUtils::digits(dechex(ord($char)), 2);
    }
    return $result;*/return $str;
  }
  
  public static function decrypt($str) {/**
    $result = '';
    for ($i = 0, $il = strlen($str); $i < $il; $i += 2) {
      $ascii = substr($str, $i, 2);
      $result .= chr(hexdec($ascii));
    }
    return $result;*/return $str;
  }
  
  public static function encode($obj) {
    return MiscUtils::encrypt(json_encode($obj));
  }
  
  public static function decode($str) {
    return json_decode(MiscUtils::decrypt($str));
  }
}
?>