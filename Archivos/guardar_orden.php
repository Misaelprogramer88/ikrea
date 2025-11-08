<?php
include "conexion.php";

$emisor = $_POST['emisor'];
$proveedor = $_POST['proveedor'];
$dias = $_POST['dias'];
$moneda = $_POST['moneda'];
$consumir = $_POST['consumir'];
$factura = $_POST['factura'];
$cargo = $_POST['cargo'];
$recibe = $_POST['recibe'];
$solicita = $_POST['solicita'];
$embarque = $_POST['embarque'];
$notas_internas = $_POST['notas_internas'];
$notas_proveedor = $_POST['notas_proveedor'];
$subtotal = $_POST['subtotal'];
$impuestos = $_POST['impuestos'];
$total = $_POST['total'];

$detalle = json_decode($_POST['detalle'], true);

// ✅ GUARDAR ORDEN
$sql = "INSERT INTO ordenes_compra (
    emisor, proveedor, dias_credito, moneda, consumir, factura,
    cargo, recibe, solicita, embarque, notas_internas, notas_proveedor,
    subtotal, impuestos, total
) VALUES (
    '$emisor', '$proveedor', '$dias', '$moneda', '$consumir', '$factura',
    '$cargo', '$recibe', '$solicita', '$embarque', '$notas_internas', '$notas_proveedor',
    '$subtotal', '$impuestos', '$total'
)";

if($conexion->query($sql)){
    
    // ✅ ID de la orden
    $orden_id = $conexion->insert_id;

    // ✅ GUARDAR DETALLES
    foreach($detalle as $item){
        $producto = $item['producto'];
        $cantidad = $item['cantidad'];
        $precio = $item['precio'];
        $total = $item['total'];

        $conexion->query("
            INSERT INTO ordenes_detalle (orden_id, producto, cantidad, precio, total)
            VALUES ('$orden_id', '$producto', '$cantidad', '$precio', '$total')
        ");
    }

    echo "OK";

} else {
    echo "ERROR: " . $conexion->error;
}
?>

