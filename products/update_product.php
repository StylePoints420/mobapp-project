<?php
include '../connection.php';

$productName = $_POST['product_name'];
$productCategory = $_POST['product_category'];
$productBrand = $_POST['product_brand'];
$productQuantity = $_POST['product_quantity'];
$productPrice = $_POST['product_price'];

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
