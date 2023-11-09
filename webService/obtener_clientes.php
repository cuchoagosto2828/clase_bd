<?php

include 'CRUD/CRUD.php';

header('Content-Type: application/json');

$crud = new CRUD();
$conexion = new conexion();
$pdo = $conexion->conect();

$sql = "SELECT ID_Cliente, Nombre, Apellido, Correo_Electronico, Telefono, Direccion FROM clientes"; // Asegúrate de que los campos coincidan con tu base de datos
$stmt = $pdo->query($sql);

$resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($resultado);