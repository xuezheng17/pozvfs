<?php
require_once dirname(__FILE__) . '/../common/common.inc.php';

header('Content-Type: text/plain');

$tableVisitor = 'np_Visitor';
$tableOperation = 'np_Operation';

try {
  $hostname = 'localhost';
  $username = 'albumpi1_pozvfs';
  $password = 'weida911';
  $dbname = 'albumpi1_pozvfs';
  $myPdo = new PDO ('mysql:host=' . $hostname, $username, $password);
  $myPdo->exec('USE ' . $dbname);
  $myPdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  echo $e->getMessage ();
}

$action = MiscUtils::getParam('action', NULL);

try {
  switch ($action) {
    case 'visitors':
      visitors($myPdo);
      break;
    case 'followUp':
      followUp($myPdo);
      break;
    case 'performance':
      performance($myPdo);
      break;
    case 'basic':
      basic($myPdo);
      break;
    default:
      break;
  }
} catch (PDOException $e) {
  echo $e->getMessage();
}

function visitors($myPdo) {
  global $tableVisitor, $tableOperation;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'v.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;

  $datefrom = MiscUtils::getParam('datefrom', NULL);
  $dateto = MiscUtils::getParam('dateto', NULL);
  $createdFrom = MiscUtils::getParam('from', NULL);
  $createdTo = MiscUtils::getParam('to', NULL);

  $condition .= ($datefrom) ? ' AND (v.weddingDay >= \'' . SimpleDate::toStamp(json_decode($datefrom)) . '\')' : '';
  $condition .= ($dateto) ? ' AND (v.weddingDay <= \'' . SimpleDate::toStamp(json_decode($dateto)) . '\')' : '';
  $condition .= ($createdFrom) ? ' AND (v.createdDate >= \'' . SimpleDate::toStamp(json_decode($createdFrom)) . '\')' : '';
  $condition .= ($createdTo) ? ' AND (v.createdDate <= \'' . SimpleDate::toStamp(json_decode($createdTo)) . '\')' : '';

  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT DISTINCT v.e_oid AS total FROM $tableVisitor AS v $condition";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $result->total = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id, v.createdDate AS createdDate, v.weddingDay AS weddingDay, v.brideName AS brideName, v.bridePhone AS bridePhone, v.brideMobile AS brideMobile, v.brideEmail AS brideEmail, v.groomName AS groomName, v.groomPhone AS groomPhone, v.groomMobile AS groomMobile, v.groomEmail AS groomEmail, v.creator AS creator, v.firstVisitDate AS firstVisitDate, v.firstVisitMethod AS firstVisitMethod, v.status AS status FROM $tableVisitor AS v $condition ORDER BY $order $queue LIMIT $pageSkip, $size";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    $tmp->createdDate = ($tmp->createdDate) ? SimpleDate::fromStamp($tmp->createdDate) : NULL;
    $tmp->weddingDay = ($tmp->weddingDay) ? SimpleDate::fromStamp($tmp->weddingDay) : NULL;
    $tmp->firstVisitDate = ($tmp->firstVisitDate) ? SimpleDate::fromStamp($tmp->firstVisitDate) : NULL;
    $tmp->operations = array();
    $sql2 = "SELECT DISTINCT o.cancelled AS cancelled, o.operateType AS operateType FROM $tableOperation AS o WHERE o.visitId = $tmp->id";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    $j = 0;
    while ($j < $stmt2->rowCount()) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp2->cancelled = ($tmp2->cancelled == 1) ? true : false;
      $tmp->operations[] = $tmp2;
      $j++;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

function followUp($myPdo) {
  global $tableVisitor, $tableOperation;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'v.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;

  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT DISTINCT v.e_oid AS total FROM $tableVisitor AS v $condition";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $result->total = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id, v.createdDate AS createdDate, v.weddingDay AS weddingDay, v.brideName AS brideName, v.bridePhone AS bridePhone, v.brideMobile AS brideMobile, v.brideEmail AS brideEmail, v.groomName AS groomName, v.groomPhone AS groomPhone, v.groomMobile AS groomMobile, v.groomEmail AS groomEmail, v.creator AS creator, v.firstVisitDate AS firstVisitDate, v.firstVisitMethod AS firstVisitMethod, v.status AS status FROM $tableVisitor AS v $condition ORDER BY $order $queue LIMIT $pageSkip, $size";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    $tmp->createdDate = ($tmp->createdDate) ? SimpleDate::fromStamp($tmp->createdDate) : NULL;
    $tmp->weddingDay = ($tmp->weddingDay) ? SimpleDate::fromStamp($tmp->weddingDay) : NULL;
    $tmp->firstVisitDate = ($tmp->firstVisitDate) ? SimpleDate::fromStamp($tmp->firstVisitDate) : NULL;
    $tmp->operations = array();
    
    $sql3 = "SELECT DISTINCT o.operatedDate AS operatedDate FROM $tableOperation AS o WHERE o.visitId = $tmp->id AND o.cancelled = 0 ORDER BY 'o.e_oid' $queue";
    $stmt3 = $myPdo->prepare($sql3);
    $stmt3->execute();
    $tmp->cout = $stmt3->rowCount();
    
    $array = array();
    $k = 0;
    while ($k < $stmt3->rowCount()) {
      $tmp3 = $stmt3->fetch(PDO::FETCH_OBJ);
      $array[] = ($tmp3 && $tmp3->operatedDate) ? $tmp3->operatedDate : '';
      $k++;
    }
    $tmp->operation = (count($array)) ? $array[count($array)-1] : SimpleDate::toStamp($tmp->createdDate);
    
    $sql2 = "SELECT DISTINCT o.cancelled AS cancelled, o.operateType AS operateType FROM $tableOperation AS o WHERE o.visitId = $tmp->id ORDER BY 'o.e_oid' $queue";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    
    $j = 0;
    while ($j < $stmt2->rowCount()) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp2->cancelled = ($tmp2->cancelled == 1) ? true : false;
      $tmp->operations[] = $tmp2;
      $j++;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

function performance($myPdo) {
  global $tableVisitor;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'v.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;

  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->visitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = 1";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->customers = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.firstVisitMethod = 'Phone'";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->pVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = 1 AND v.firstVisitMethod = 'Phone'";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->pSucVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.firstVisitMethod = 'Email'";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->eVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = 1 AND v.firstVisitMethod = 'Email'";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->eSucVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.firstVisitMethod = 'Visitor'";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->vVisitors = $stmt->rowCount();
  $result->data[] = $tmp;
  echo json_encode($result);
}

function basic($myPdo) {
  global $tableVisitor;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'v.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;

  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->visitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = 1";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->successVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = -1";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->dropVisitors = $stmt->rowCount();
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = 0";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->progressingVisitors = $stmt->rowCount();
  
  $result->data[] = $tmp;
  echo json_encode($result);
}
?>