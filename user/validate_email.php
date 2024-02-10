<?php

include '../connection.php';

$userEmail = $_POST['email'];

$sqlQuery = $dbConn->prepare("SELECT * FROM admin_tbl WHERE email = ?");
$sqlQuery->bind_param("s", $userEmail);
$sqlQuery->execute();
$result = $sqlQuery->get_result();

if ($result->num_rows > 0) {
    echo json_encode(array("emailFound"=>true));
} else {
    echo json_encode(array("emailFound"=>false));
}

$sqlQuery->close();
$dbConn->close();

?>
