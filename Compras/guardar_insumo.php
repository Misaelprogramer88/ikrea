<?php
include "conexion.php";

$nombre = $_POST['nombre'];
$funcion = $_POST['funcion'];
$fertilizante = $_POST['fertilizante'];
$notas = $_POST['notas'];

// ✅ Guardar como insumo manual
$sql = "INSERT INTO insumos (tipo, nombre, funcion, fertilizante, notas)
        VALUES ('MANUAL', '$nombre', '$funcion', '$fertilizante', '$notas')";

if ($conexion->query($sql)) {
    echo "OK";
} else {
    echo "ERROR: " . $conexion->error;
}
?>
