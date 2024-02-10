<?php
include '../connection.php';

$productID = $_POST['product_id'];
$productName = $_POST['product_name'];
$productCategory = $_POST['product_category'];
$productBrand = $_POST['product_brand'];
$productQuantity = $_POST['product_quantity'];
$productPrice = $_POST['product_price'];

$sqlQuery = $dbConn->prepare("DELETE FROM products_tbl WHERE product_id = ?");
$sqlQuery->bind_param("s", $productID);
$sqlQuery->execute();

// Check if any rows were updated
if ($dbConn->affected_rows > 0) {
    echo json_encode(array("updateSuccess" => true));
} else {
    echo json_encode(array("updateSuccess" => false));
}

$sqlQuery->close();
$dbConn->close();
?>
