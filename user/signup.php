<?php
include '../connection.php';


$adminUsername = $_POST['username'];
$adminEmail = $_POST['email'];
$adminPassword = md5($_POST['password']);


$sqlQuery = $dbConn->prepare("INSERT INTO admin_tbl (username, email, password) VALUES (?, ?, ?)");
$sqlQuery->bind_param("sss", $adminUsername, $adminEmail, $adminPassword);

if ($sqlQuery->execute()) {
    echo json_encode(array("success"=>true));
} else {
    echo json_encode(array("success"=>false));
}

$sqlQuery->close();
$dbConn->close();


?>