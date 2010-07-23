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
  
  echo json_encode($visitor);
}
?>