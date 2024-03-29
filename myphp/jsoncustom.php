<?php
require_once dirname(__FILE__) . '/../common/common.inc.php';
require_once dirname(__FILE__) . "/../database/$database/database.inc.php";

header('Content-Type: text/plain');

global $myManager;

$action = MiscUtils::decryptParam('action', NULL);

$myManager->start_t();
try {
  switch ($action) {
    case 'login':
      login($myManager);
      break;
    case 'addVisitor':
      addVisitor($myManager);
      break;
    case 'visitors':
      visitors($myManager);
      break;
    case 'sendEmail':
      sendEmail($myManager);
      break;
    case 'isLogin':
      isLogin();
      break;
    case 'statsreceptioncustomers':
      statsreceptioncustomers($myManager);
      break;
    case 'source':
      source($myManager);
      break;
    case 'statsceremony':
      statsceremony($myManager);
      break;
    case 'statsceremonycustomers':
      statsceremonycustomers($myManager);
      break;
    case 'statculturecustomers':
      statculturecustomers($myManager);
      break;
    case 'updateVisitor':
      updateVisitor($myManager);
      break;
    case 'removeOperation':
      removeOperation($myManager);
      break;
    case 'succeeded':
      succeeded($myManager);
      break;
    default:
      break;
  }
} catch (PDOException $e) {
  echo MiscUtils::encode($e->getMessage());
}
$myManager->commit_t();

function login($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('pz_user');
  $result = $orm->find($myManager, NULL, NULL, NULL, NULL, "d.account = '$args->account' AND d.password = '$args->password'", NULL);
  if (count($result->data) == 1) {
    $user = $result->data[0];
    
    $_SESSION[OPERATOR] = $user;
    setcookie(OPERATOR, json_encode($user), (time() + 3600), PATH, DOMAIN);
    
    echo json_encode($user);
  } else {
    echo 'INCORRECT ACCOUNT OR PASSWORD';
  }
}

function addVisitor($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('pz_visitor');
  $epVisitor = $orm->add($myManager, $args->visitor);
  $myManager->commit_t();
  $myManager->start_t();
  $visitor = $orm->__toObject($myManager, $epVisitor, new stdClass());
  
  echo json_encode($visitor);
}

function visitors($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $function = MiscUtils::getParam('f', NULL);
  $order = MiscUtils::getParam('o', 'd.e_oid');
  $queue = MiscUtils::getParam('q', 'DESC');
  $page = MiscUtils::getParam('p', START);
  $size = MiscUtils::getParam('s', 8);

  $datefrom = MiscUtils::getParam('datefrom', NULL);
  $dateto = MiscUtils::getParam('dateto', NULL);
  $createdFrom = MiscUtils::getParam('from', NULL);
  $createdTo = MiscUtils::getParam('to', NULL);

  $condition .= ($datefrom) ? ' AND (d.weddingDay >= \'' . SimpleDate::toStamp(json_decode($datefrom)) . '\')' : '';
  $condition .= ($dateto) ? ' AND (vd.weddingDay <= \'' . SimpleDate::toStamp(json_decode($dateto)) . '\')' : '';
  $condition .= ($createdFrom) ? ' AND (d.createdDate >= \'' . SimpleDate::toStamp(json_decode($createdFrom)) . '\')' : '';
  $condition .= ($createdTo) ? ' AND (d.createdDate <= \'' . SimpleDate::toStamp(json_decode($createdTo)) . '\')' : '';
  
  $orm = classToOrm('pz_visitor');
  if ($orm) {
    try {
      $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
      $result->total = count($orm->find($myManager, START, INFINITE, NULL, NULL, $condition, NULL)->data);
      echo json_encode($result);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function statsreceptioncustomers($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', NULL);
  $order = MiscUtils::getParam('o', NULL);
  $queue = MiscUtils::getParam('q', NULL);
  $page = MiscUtils::getParam('p', NULL);
  $size = MiscUtils::getParam('s', NULL);
  
  $condition = $args->cond;
  $orm = classToOrm('pz_visitor');
  if ($orm) {
    try {
      $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
      $result->total = count($orm->find($myManager, START, INFINITE, NULL, NULL, $condition, NULL)->data);
      $res = array();
      for ($i = 0, $il = count($result->data); $i < $il; $i++) {
        $customer = $result->data[$i];
        array_push($res, $customer->id);
      }
      echo json_encode($res);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function statsceremonycustomers($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', NULL);
  $order = MiscUtils::getParam('o', NULL);
  $queue = MiscUtils::getParam('q', NULL);
  $page = MiscUtils::getParam('p', NULL);
  $size = MiscUtils::getParam('s', NULL);
  
  $condition = $args->cond;
  $orm = classToOrm('pz_visitor');
  if ($orm) {
    try {
      $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
      $result->total = count($orm->find($myManager, START, INFINITE, NULL, NULL, $condition, NULL)->data);
      $res = array();
      for ($i = 0, $il = count($result->data); $i < $il; $i++) {
        $customer = $result->data[$i];
        array_push($res, $customer->id);
      }
      echo json_encode($res);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function statculturecustomers($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', NULL);
  $order = MiscUtils::getParam('o', NULL);
  $queue = MiscUtils::getParam('q', NULL);
  $page = MiscUtils::getParam('p', NULL);
  $size = MiscUtils::getParam('s', NULL);
  
  $condition = $args->cond;
  $orm = classToOrm('pz_visitor');
  if ($orm) {
    try {
      $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
      $result->total = count($orm->find($myManager, START, INFINITE, NULL, NULL, $condition, NULL)->data);
      $res = array();
      for ($i = 0, $il = count($result->data); $i < $il; $i++) {
        $customer = $result->data[$i];
        array_push($res, $customer->id);
      }
      echo json_encode($res);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function source($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $function = MiscUtils::getParam('f', NULL);
  $condition = MiscUtils::getParam('c', NULL);
  $order = MiscUtils::getParam('o', NULL);
  $queue = MiscUtils::getParam('q', NULL);
  $page = MiscUtils::getParam('p', NULL);
  $size = MiscUtils::getParam('s', NULL);
  
  $condition = $args->cond;
  $orm = classToOrm('pz_visitor');
  if ($orm) {
    try {
      $result = $orm->find($myManager, $page, $size, $order, $queue, $condition, $function);
      $result->total = count($orm->find($myManager, START, INFINITE, NULL, NULL, $condition, NULL)->data);
      $res = array();
      for ($i = 0, $il = count($result->data); $i < $il; $i++) {
        $customer = $result->data[$i];
        array_push($res, $customer->id);
      }
      echo json_encode($res);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function sendEmail($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('pz_operation');
  $epOperation = $orm->add($myManager, $args->operation);
  $myManager->commit_t();
  $myManager->start_t();
  $operation = $orm->__toObject($myManager, $epOperation, new stdClass());
  
  $subject = $args->email->subject;
  $content = $args->email->content;
  if ($args->visitor->brideEmail != '' || $args->visitor->groomEmail != '') {
    require_once dirname(__FILE__) . '/../library/phpMailer/class.phpmailer.php';
    $mailer = new PHPMailer();
    $mailer->IsSMTP();
    $mailer->Host = 'mx.hosting.isx.net.nz';
//    $mailer->SMTPAuth = true;
    $mailer->Username = 'dreamlife.customerservice@dlmanage.co.nz';
    $mailer->Password = 'luckybox4mail';
    $mailer->From = 'dreamlife.customerservice@dlmanage.co.nz';
    $mailer->FromName = 'Dreamlife';
    $mailer->Body = $content;
    $mailer->Subject = $subject;
    if ($args->visitor->brideEmail != '') {
      $mailer->AddAddress($args->visitor->brideEmail);
    }
    if ($args->visitor->groomEmail != '') {
      $mailer->AddAddress($args->visitor->groomEmail);
    }
    if (!$mailer->Send()) {
      echo $mailer->ErrorInfo; 
      return;
    }
  }
  echo json_encode($operation);
}

function updateVisitor($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  $orm = classToOrm('pz_operation');
  $orm1 = classToOrm('pz_visitor');
  if ($orm && $orm1) {
    try {
      if ($args->operation != NULL) {
        $orm->update($myManager, $args->operation);
      }
      if ($args->visitor) {
        $orm1->update($myManager, $args->visitor);
      }
      $myManager->commit_t();
      $myManager->start_t();
      echo json_encode(array());
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function removeOperation($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  $orm = classToOrm('pz_operation');
  $orm1 = classToOrm('pz_visitor');
  if ($orm && $orm1) {
    try {
      if ($args->current != NULL) {
        $orm->update($myManager, $args->current);
      }
      if ($args->next != NULL) {
        $orm->update($myManager, $args->next);
      }
      if ($args->visitor != NULL) {
        $orm1->update($myManager, $args->visitor);
      }
      $myManager->commit_t();
      $myManager->start_t();
      echo json_encode(array());
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}

function succeeded($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('pz_operation');
  $orm1 = classToOrm('pz_visitor');
  if ($orm && $orm1) {
    try {
      if ($args->operation != NULL) {
        $orm->add($myManager, $args->operation);
      }
      if ($args->visitor) {
        $orm1->update($myManager, $args->visitor); 
      }
      $myManager->commit_t();
      $myManager->start_t();
      echo json_encode(array());
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
  }
}
?>