<?php
include '../connection.php';


$productName = $_POST['product_name'];
$productCategory = $_POST['product_category'];
$productBrand = $_POST['product_brand'];
$productQuantity = $_POST['product_quantity'];
$productPrice = $_POST['product_price'];

$sqlQuery = $dbConn->prepare("INSERT INTO products_tbl (
    product_name,
    product_category,
    product_brand,
    product_quantity,
    product_price
    )
    VALUES (?, ?, ?, ?, ?)"
);
$sqlQuery->bind_param("sssss", $productName, $productCategory, $productBrand, $productQuantity, $productPrice);

if ($sqlQuery->execute()) {
    echo json_encode(array("productCreated"=>true));
} else {
    echo json_encode(array("productCreated"=>false));
}

$sqlQuery->close();
$dbConn->close();


?>