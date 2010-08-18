<?php
require_once dirname(__FILE__) . '/../common/common.inc.php';

header('Content-Type: text/plain');

$tableUser = 'np_pz_user';
$tableVisitor = 'np_pz_visitor';
$tableOperation = 'np_pz_operation';

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
    case 'statAdvanced':
      statAdvanced($myPdo);
      break;
    case 'statBasic':
      statBasic($myPdo);
      break;
    case 'home':
      home($myPdo);
      break;
    case 'performanceAttitude': 
      performanceAttitude($myPdo);
      break;
    case 'performancePE': 
      performancePE($myPdo);
      break;
    case 'performanceSales': 
      performanceSales($myPdo);
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
  
  $sql = "SELECT DISTINCT v.e_oid AS id, v.createdDate AS createdDate, v.weddingDay AS weddingDay, v.brideName AS brideName, v.bridePhone AS bridePhone, v.brideMobile AS brideMobile, v.brideEmail AS brideEmail, v.groomName AS groomName, v.groomPhone AS groomPhone, v.groomMobile AS groomMobile, v.groomEmail AS groomEmail, v.creator AS creator, v.firstVisitDate AS firstVisitDate, v.firstVisitMethod AS firstVisitMethod, v.status AS status, v.isVisited as isVisited FROM $tableVisitor AS v $condition ORDER BY $order $queue LIMIT $pageSkip, $size";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    $tmp->createdDate = ($tmp->createdDate) ? SimpleDate::fromStamp($tmp->createdDate) : NULL;
    $tmp->weddingDay = ($tmp->weddingDay) ? SimpleDate::fromStamp($tmp->weddingDay) : NULL;
    $tmp->firstVisitDate = ($tmp->firstVisitDate) ? SimpleDate::fromStamp($tmp->firstVisitDate) : NULL;
    $tmp->isVisited = ($tmp->isVisited == 1) ? true : false;
    $tmp->operations = array();
    $sql2 = "SELECT DISTINCT o.e_oid AS id, o.cancelled AS cancelled, o.operateType AS operateType, o.operatedDate AS operatedDate FROM $tableOperation AS o WHERE o.visitId = $tmp->id AND o.cancelled = 0 AND o.operateType != 'Custom Note' ORDER BY o.operatedDate";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    $j = 0;
    while ($j < $stmt2->rowCount()) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp2->operatedDate = ($tmp2->operatedDate) ? SimpleDate::fromStamp($tmp2->operatedDate) : NULL;
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
  
  $sql = "SELECT DISTINCT v.e_oid AS id, v.createdDate AS createdDate, v.weddingDay AS weddingDay, v.brideName AS brideName, v.bridePhone AS bridePhone, v.brideMobile AS brideMobile, v.brideEmail AS brideEmail, v.groomName AS groomName, v.groomPhone AS groomPhone, v.groomMobile AS groomMobile, v.groomEmail AS groomEmail, v.creator AS creator, v.firstVisitDate AS firstVisitDate, v.firstVisitMethod AS firstVisitMethod, v.status AS status, v.isVisited as isVisited FROM $tableVisitor AS v $condition ORDER BY $order $queue LIMIT $pageSkip, $size";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    $tmp->createdDate = ($tmp->createdDate) ? SimpleDate::fromStamp($tmp->createdDate) : NULL;
    $tmp->weddingDay = ($tmp->weddingDay) ? SimpleDate::fromStamp($tmp->weddingDay) : NULL;
    $tmp->firstVisitDate = ($tmp->firstVisitDate) ? SimpleDate::fromStamp($tmp->firstVisitDate) : NULL;
    $tmp->isVisited = ($tmp->isVisited == 1) ? true : false;
    $tmp->operations = array();
    
    $sql2 = "SELECT DISTINCT o.e_oid AS id, o.cancelled AS cancelled, o.operateType AS operateType, o.operatedDate AS operatedDate, o.visitId as visitId FROM $tableOperation AS o WHERE o.visitId = $tmp->id AND o.cancelled = 0 AND o.operateType != 'Custom Note' ORDER BY 'o.e_oid' $queue";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    
    $j = 0;
    while ($j < $stmt2->rowCount()) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp2->operatedDate = ($tmp2->operatedDate) ? SimpleDate::fromStamp($tmp2->operatedDate) : NULL;
      $tmp2->cancelled = ($tmp2->cancelled == 1) ? true : false;
      $tmp->operations[] = $tmp2;
      $j++;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

function statAdvanced($myPdo) {
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

function statBasic($myPdo) {
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

function home($myPdo) {
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
  
  $sql = "SELECT DISTINCT v.e_oid AS id FROM $tableVisitor AS v $condition AND v.status = -2";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  $tmp->deletedVisitors = $stmt->rowCount();
  
  $result->data[] = $tmp;
  echo json_encode($result);
}

function performanceAttitude($myPdo) {
  global $tableOperation, $tableUser;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1 ');
  $order = MiscUtils::getParam('o', 'o.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;

  $createdFrom = MiscUtils::getParam('from', NULL);
  $createdTo = MiscUtils::getParam('to', NULL);

  $condition .= ($createdFrom) ? ' AND (o.operatedDate >= \'' . SimpleDate::toStamp(json_decode($createdFrom)) . '\')' : '';
  $condition .= ($createdTo) ? ' AND (o.operatedDate <= \'' . SimpleDate::toStamp(json_decode($createdTo)) . '\')' : '';
  
  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT u.account AS account FROM $tableUser AS u ";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();

  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    
    $sql1 = "SELECT COUNT(o.e_oid) AS total FROM $tableOperation AS o $condition AND o.cancelled = 0";
    $stmt1 = $myPdo->prepare($sql1);
    $stmt1->execute();
    $tmp->total = 0;
    if ($stmt1->rowCount() == 1) {
      $tmp1 = $stmt1->fetch(PDO::FETCH_OBJ);
      $tmp->total = $tmp1->total;
    }
    
    $sql2 = "SELECT COUNT(o.e_oid) AS total FROM $tableOperation AS o $condition AND o.operator='$tmp->account' AND o.cancelled = 0";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    $tmp->value = 0;
    if ($stmt2->rowCount() == 1) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp->value = $tmp2->total;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

function performancePE($myPdo) {
  global $tableOperation, $tableUser, $tableVisitor;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'o.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;
  
  $createdFrom = MiscUtils::getParam('from', NULL);
  $createdTo = MiscUtils::getParam('to', NULL);

  $condition .= ($createdFrom) ? ' AND (o.operatedDate >= \'' . SimpleDate::toStamp(json_decode($createdFrom)) . '\')' : '';
  $condition .= ($createdTo) ? ' AND (o.operatedDate <= \'' . SimpleDate::toStamp(json_decode($createdTo)) . '\')' : '';
  
  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT u.account AS account FROM $tableUser AS u ";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();

  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    
    $sql1 = "SELECT COUNT(o.e_oid) AS total FROM $tableOperation AS o LEFT JOIN $tableVisitor AS v ON o.visitId = v.e_oid $condition AND v.firstVisitMethod != 'Visitor' AND o.cancelled = 0";
    $stmt1 = $myPdo->prepare($sql1);
    $stmt1->execute();
    $tmp->total = 0;
    if ($stmt1->rowCount() == 1) {
      $tmp1 = $stmt1->fetch(PDO::FETCH_OBJ);
      $tmp->total = $tmp1->total;
    }
    
    $sql2 = "SELECT COUNT(o.e_oid) AS total FROM $tableOperation AS o $condition AND o.prevOperator='$tmp->account' AND o.firstVisited = 1 AND o.cancelled = 0";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    $tmp->value = 0;
    if ($stmt2->rowCount() == 1) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp->value = $tmp2->total;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

function performanceSales($myPdo) {
  global $tableOperation, $tableUser, $tableVisitor;
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', 'WHERE 1 = 1');
  $order = MiscUtils::getParam('o', 'v.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);
  $pageSkip = ($page - 1) * $size;
  
  $createdFrom = MiscUtils::getParam('from', NULL);
  $createdTo = MiscUtils::getParam('to', NULL);

  $condition .= ($createdFrom) ? ' AND (v.operatorDate >= \'' . SimpleDate::toStamp(json_decode($createdFrom)) . '\')' : '';
  $condition .= ($createdTo) ? ' AND (v.operatorDate <= \'' . SimpleDate::toStamp(json_decode($createdTo)) . '\')' : '';
  
  $result = new stdClass();
  $result->data = array();
  $result->page = $page;
  $result->size = $size;
  $result->order = $order;
  $result->queue = $queue;
  $result->condition = $condition;
  
  $sql = "SELECT u.account AS account FROM $tableUser AS u ";
  $stmt = $myPdo->prepare($sql);
  $stmt->execute();
  
  $i = 0;
  while ($i < $stmt->rowCount()) {
    $tmp = $stmt->fetch(PDO::FETCH_OBJ);
    
    $sql1 = "SELECT COUNT(v.e_oid) AS total FROM $tableVisitor AS v $condition";
    $stmt1 = $myPdo->prepare($sql1);
    $stmt1->execute();
    $tmp->total = 0;
    if ($stmt1->rowCount() == 1) {
      $tmp1 = $stmt1->fetch(PDO::FETCH_OBJ);
      $tmp->total = $tmp1->total;
    }
    
    $sql2 = "SELECT COUNT(v.e_oid) AS total FROM $tableVisitor AS v $condition AND v.operator='$tmp->account' AND v.status = 1  ";
    $stmt2 = $myPdo->prepare($sql2);
    $stmt2->execute();
    $tmp->value = 0;
    if ($stmt2->rowCount() == 1) {
      $tmp2 = $stmt2->fetch(PDO::FETCH_OBJ);
      $tmp->value = $tmp2->total;
    }
    $result->data[] = $tmp;
    $i++;
  }
  echo json_encode($result);
}

?>