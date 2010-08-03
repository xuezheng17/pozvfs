<?php
class Visitor {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm date
   */
  public $createdDate;
  /**
   * @orm char(64)
   */
  public $creator;
  /**
   * @orm date
   */
  public $weddingDay;
  /**
   * @orm char(64)
   */
  public $brideName;
  /**
   * @orm char(64)
   */
  public $bridePhone;
  /**
   * @orm char(64)
   */
  public $brideMobile;
  /**
   * @orm char(64)
   */
  public $brideEmail;
  /**
   * @orm char(512)
   */
  public $brideAddress;
  /**
   * @orm char(64)
   */
  public $groomName;
  /**
   * @orm char(64)
   */
  public $groomPhone;
  /**
   * @orm char(64)
   */
  public $groomMobile;
  /**
   * @orm char(64)
   */
  public $groomEmail;
  /**
   * @orm char(512)
   */
  public $groomAddress;
  /**
   * @orm char(64)
   */
  public $culturalBackground;
  /**
   * @orm char(64)
   */
  public $ceremonyLocation;
  /**
   * @orm char(64)
   */
  public $receptionLocation;
  /**
   * @orm char(64)
   */
  public $source;
  /**
   * @orm char(64)
   */
  public $firstVisitMethod;
  /**
   * @orm date
   */
  public $firstVisitDate;
  /**
   * @orm integer
   */
  public $status;
  /**
   * @orm date
   */
  public $cancelledDate;
  /**
   * @orm char(64)
   */
  public $cancelledOperator;
  /**
   * @orm char(4096)
   */
  public $cancelledMessage;
  
  
}
?>