<?php

include 'CRUD/CRUD.php';

header('Content-Type: application/json');

$crud = new CRUD();
$conexion = new conexion();
$pdo = $conexion->conect();

$sql = "SELECT ID_Producto, Nombre_Producto, Descripcion, Precio, ID_Categoria FROM productos"; // Asegúrate de que los campos coincidan con tu base de datos
$stmt = $pdo->query($sql);

$resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($resultado);