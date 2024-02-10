<?php
include '../connection.php';

$adminEmail = $_POST['email'];
$adminPassword = md5($_POST['password']);

$sqlQuery = $dbConn->prepare("UPDATE admin_tbl SET password = ? WHERE email = ?");
$sqlQuery->bind_param("ss", $adminPassword, $adminEmail);
$sqlQuery->execute();

// Check if any rows were updated
if ($dbConn->affected_rows > 0) {
    echo json_encode(array("changePass" => true));
} else {
    echo json_encode(array("changePass" => false));
}

$sqlQuery->close();
$dbConn->close();
?>
