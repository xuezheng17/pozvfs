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
    default:
      break;
  }
} catch (PDOException $e) {
  echo MiscUtils::encode($e->getMessage());
}
$myManager->commit_t();

function login($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('user');
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
  
  $orm = classToOrm('visitor');
  $epVisitor = $orm->add($myManager, $args->visitor);
  $myManager->commit_t();
  $myManager->start_t();
  $visitor = $orm->__toObject($myManager, $epVisitor, new stdClass());
  
  if ($args->visitor->brideEmail != '' || $args->visitor->groomEmail != '') {
    require_once dirname(__FILE__) . '/../library/phpMailer/class.phpmailer.php';
    $mailer = new PHPMailer();
    $mailer->IsSMTP();
    $mailer->Host = 'ssl://smtp.gmail.com:465';
    $mailer->SMTPAuth = true;
    $mailer->Username = 'ns.gresource@gmail.com';
    $mailer->Password = 'weida911';
    $mailer->From = 'ns.gresource@gmail.com';
    $mailer->FromName = 'Dreamlife';
    $mailer->Body = 'Welcome to Dreamlife';
    $mailer->Subject = 'This is the subject of the email';
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
  
  $orm = classToOrm('visitor');
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

function sendEmail($myManager) {
  $args = json_decode(MiscUtils::decryptParam('a', '[]'));
  
  $orm = classToOrm('operation');
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
    $mailer->Host = 'ssl://smtp.gmail.com:465';
    $mailer->SMTPAuth = true;
    $mailer->Username = 'ns.gresource@gmail.com';
    $mailer->Password = 'weida911';
    $mailer->From = 'ns.gresource@gmail.com';
    $mailer->FromName = 'Dreamlife';
    $mailer->Body = $subject;
    $mailer->Subject = $content;
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
?>