<?php
require_once dirname(__FILE__) . '/../common/common.inc.php';
require_once dirname(__FILE__) . "/../database/$database/database.inc.php";
require_once dirname(__FILE__) . '/../common/_utils.class.php';

header('Content-Type: text/plain');

global $myManager;

$action = MiscUtils::decryptParam('action', NULL);

$myManager->start_t();
try {
  switch ($action) {
    case 'login':
      login($myManager);
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
  
  $orm = classToOrm('customer');
  $result = $orm->find($myManager, NULL, NULL, NULL, NULL, "d.account = '$args->account' AND d.password = '$args->password'", NULL);
  if (count($result->data) == 1) {
    $customer = $result->data[0];
    
    $_SESSION[OPERATOR] = $customer;
    setcookie(OPERATOR, json_encode($customer), (time() + 3600), PATH, DOMAIN);
    
    $dir = '../' . UPDIR . $customer->account;
    if (!file_exists($dir)) {
      mkdir($dir, 0777);
    }
    
    echo MiscUtils::encode(array());
  } else {
    echo 'INCORRECT ACCOUNT OR PASSWORD';
  }
}
?>