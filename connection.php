<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$databaseName = "mobapp_project";

$dbConn = new mysqli($serverHost, $user, $password, $databaseName);

if ($dbConn->connect_error) {
    die("Connection failed: " . $dbConn->connect_error);
}


?>