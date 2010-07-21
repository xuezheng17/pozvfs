<?php
class SimpleDate {
  public static function create($year = NULL, $month = NULL, $date = NULL, $hours = NULL, $minutes = NULL, $seconds = NULL) {
    if (func_num_args() == 0) {
      $sd = new stdClass();
      $sd->year = date("Y");
      $sd->month = date("m");
      $sd->date = date("d");
      $sd->hours = 0;
      $sd->minutes = 0;
      $sd->seconds = 0;
      return $sd;
    }

    $sd = new stdClass();
    $sd->year = ($year !== NULL) ? $year : 0;
    $sd->month = ($month !== NULL) ? $month : 0;
    $sd->date = ($date !== NULL) ? $date : 0;
    $sd->hours = ($hours !== NULL) ? $hours : 0;
    $sd->minutes = ($minutes !== NULL) ? $minutes : 0;
    $sd->seconds = ($seconds !== NULL) ? $seconds : 0;

    return $sd;
  }

  public static function fromStamp($stamp) {
    $date = getdate($stamp);

    $sd = new stdClass();
    $sd->year = $date['year'];
    $sd->month = $date['mon'];
    $sd->date = $date['mday'];
    $sd->hours = $date['hours'];
    $sd->minutes = $date['minutes'];
    $sd->seconds = $date['seconds'];

    return $sd;
  }

  public static function toStamp($sd) {
    if (func_num_args() === 0) {
      return time();
    }

    if (!$sd) {
      return NULL;
    }

    return mktime($sd->hours, $sd->minutes, $sd->seconds, $sd->month, $sd->date, $sd->year);
  }

  public static function fromUTC($utc) {
    $stamp = strtotime($utc);
    if ($stamp === false) {
      return NULL;
    }

    return self::fromStamp($stamp);
  }

  public static function toUTC($sd, $hasTime) {
    if (!$sd) {
      return NULL;
    }
    $stamp = self::toStamp($sd);
    
    if ($hasTime) {
      return gmstrftime('%Y-%m-%dT%H:%M:%S.00Z', $stamp);
    } else {
      return strftime('%Y-%m-%d', $stamp);
    }
  }
}
