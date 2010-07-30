<?php
class IEmailTemplate {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm char(64)
   */
  public $subject;
  /**
   * @orm char(5086)
   */
  public $content;
}
?>