<?php
include "conexion.php";

$id = $_POST['id'];

$sql = "UPDATE ordenes_compra SET estado='PAGADO' WHERE id='$id'";

if($conexion->query($sql)){
    echo "OK";
} else {
    echo "ERROR: " . $conexion->error;
}
?>

