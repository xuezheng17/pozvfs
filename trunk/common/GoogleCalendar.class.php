<?php
class GoogleCalendar {
  private $service = NULL;

  function __construct($user=null, $pass=null) {
    $clientLibraryPath = dirname(__FILE__) . '/';
    $oldPath = set_include_path(get_include_path() . PATH_SEPARATOR . $clientLibraryPath);

    require_once dirname(__FILE__) . '/MiscUtils.class.php';
    require_once dirname(__FILE__) . '/SimpleDate.class.php';
    require_once dirname(__FILE__) . '/../library/Zend/Loader.php';
    Zend_Loader::loadClass('Zend_Gdata');
    Zend_Loader::loadClass('Zend_Gdata_AuthSub');
    Zend_Loader::loadClass('Zend_Gdata_ClientLogin');
    Zend_Loader::loadClass('Zend_Gdata_Calendar');
    
    // Parameters for ClientAuth authentication
    $service = Zend_Gdata_Calendar::AUTH_SERVICE_NAME;
    
    // Create an authenticated HTTP client
    $client = Zend_Gdata_ClientLogin::getHttpClient($user, $pass, $service);
    
    // Create an instance of the Calendar service
    $this->service = new Zend_Gdata_Calendar($client);
  }
  
  public function addEvent($title, $location, $content, $startDate, $endDate, $is_all_day_event) { 
    // Create a new entry using the calendar service's magic factory method
    $event= $this->service->newEventEntry();
    
    // Populate the event with the desired information
    // Note that each attribute is crated as an instance of a matching class
    $event->title = $this->service->newTitle($title);
    $event->where = array($this->service->newWhere($location));
    $event->content = $this->service->newContent($content);
    
    $hasTime = !$is_all_day_event;
    $when = $this->service->newWhen();
    $when->startTime = SimpleDate::toUTC($startDate, $hasTime);
    $when->endTime = SimpleDate::toUTC($endDate, $hasTime);
    $event->when = array($when);
    
    // Upload the event to the calendar server
    // A copy of the event as it is recorded on the server is returned
    $newEvent = $this->service->insertEvent($event);
    
    return $newEvent->getEditLink()->href;
  }
  
  public function deleteEvent($uri) {
    $this->service->delete($uri);
  }
}
?>