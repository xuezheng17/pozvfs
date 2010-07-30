<?php
class EmailTemplate {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm char(64)
   */
  public $name;
  /**
   * @orm char(4096)
   */
  public $content;
}
?>