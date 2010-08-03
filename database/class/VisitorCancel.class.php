<?php
class VisitorCancel {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm date
   */
  public $date;
  /**
   * @orm char(64)
   */
  public $userAccount;
  /**
   * @orm char(4096)
   */
  public $message;
}
?>