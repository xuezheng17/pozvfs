<?php
class pz_emailtemplate {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm char(64)
   */
  public $name;
  /**
   * @orm char(1024)
   */
  public $subject;
  /**
   * @orm char(4096)
   */
  public $content;
}
?>