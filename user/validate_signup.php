<?php
include '../connection.php';


$adminUsername = $_POST['username'];
$adminPassword = md5($_POST['password']);

$sqlQuery = $dbConn->prepare("SELECT * FROM admin_tbl WHERE username = ? AND password = ?");
$sqlQuery->bind_param("ss", $adminUsername, $adminPassword);
$sqlQuery->execute();
$result = $sqlQuery->get_result();

if ($result->num_rows > 0) {
    echo json_encode(array("accountFound"=>true));
} else {
    echo json_encode(array("accountFound"=>false));
}

$sqlQuery->close();
$dbConn->close();



?>