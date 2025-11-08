<?php
include "conexion.php";

// ✅ ahora sí incluimos la columna estado
$sql = "SELECT id, fecha, proveedor, emisor, total, estado FROM ordenes_compra ORDER BY id DESC";
$res = $conexion->query($sql);

$data = [];

while($row = $res->fetch_assoc()){
    $data[] = $row;
}

echo json_encode($data);
?>
