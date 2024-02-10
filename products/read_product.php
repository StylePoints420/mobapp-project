<?php
include '../connection.php';

$sqlQuery = $dbConn->prepare("SELECT * FROM products_tbl");
$sqlQuery->execute();
$result = $sqlQuery->get_result();

$products = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    echo json_encode(array("fetchedProducts" => true, "products" => $products));
} else {
    echo json_encode(array("fetchedProducts" => false, "message" => "No products found"));
}

$sqlQuery->close();
$dbConn->close();
?>
