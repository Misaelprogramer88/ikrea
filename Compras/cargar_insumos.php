<?php
include "conexion.php";

$sql = "SELECT * FROM insumos ORDER BY id DESC";
$res = $conexion->query($sql);

$data = [];

while($row = $res->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);
?>
