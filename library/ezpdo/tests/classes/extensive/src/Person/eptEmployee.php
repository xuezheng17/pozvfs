<?php

/**
 * $Id: eptEmployee.php 773 2006-01-25 11:52:21Z nauhygon $
 * 
 * Copyright(c) 2005 by Oak Nauhygon. All rights reserved.
 * 
 * @author Oak Nauhygon <ezpdo4php@gmail.com>
 * @version $Revision$ $Date: 2006-01-25 06:52:21 -0500 (Wed, 25 Jan 2006) $
 * @package ezpdo_t
 * @subpackage ezpdo_t.bookstore
 */

/**
 * Need eptPerson
 */
include_once(realpath(dirname(__FILE__)).'/../eptPerson.php');

/**
 * Class of a book
 * 
 * This is a test class for ezpdo
 * 
 * @author Oak Nauhygon <ezpdo4php@gmail.com>
 * @version $Revision$ $Date: 2006-01-25 06:52:21 -0500 (Wed, 25 Jan 2006) $
 * @package ezpdo_t
 * @subpackage ezpdo_t.bookstore
 * @orm otherEmployee
 */
class eptEmployee extends eptPerson {
    
    /**
     * Sales of the customer 
     * @var eptSale
     * @orm has many eptSale inverse(employee)
     */
    public $sales;
    
    /**
     * Store of the employee
     * @var eptStore
     * @orm has one eptStore inverse(employees)
     */
    public $store;

    /**
     * Constructor
     * @param string
     */
    public function __construct() { 
        parent::__construct();
    }
}

?>
