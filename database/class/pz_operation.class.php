<?php
class pz_operation {
  /**
   * @orm char(64)
   */
  public $trackId;
  /**
   * @orm char(64)
   */
  public $visitId;
  /**
   * @orm bool
   */
  public $cancelled;
  /**
   * @orm char(64)
   */
  public $operateType;
  /**
   * @orm char(64)
   */
  public $operator;
  /**
   * @orm date
   */
  public $operatedDate;
  /**
   * @orm char(5120)
   */
  public $content;
  /**
   * @orm char(64)
   */
  public $prevOperator;
  /**
   * @orm bool
   */
  public $firstVisited;
}
?>