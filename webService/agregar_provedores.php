<?php

include 'CRUD/CRUD.php';

class ClientePost {

    function __construct() {
        // Constructor vacío si no necesitas inicializar nada
    }

    function agregarCliente($idprovedor, $nombre, $direccion, $correoElectronico, $telefono) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();
                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Consulta preparada para agregar un nuevo cliente
                $sql = "INSERT INTO proveedores (ID_Proveedor, Nombre_Proveedor, Direccion, Correo_Electronico, Telefono) 
                        VALUES (:idprovedor, :nombre, :direccion, :correoElectronico, :telefono)";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':idprovedor', $idprovedor, PDO::PARAM_INT);
                $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
                $stmt->bindParam(':direccion', $direccion, PDO::PARAM_STR);
                $stmt->bindParam(':correoElectronico', $correoElectronico, PDO::PARAM_STR);
                $stmt->bindParam(':telefono', $telefono, PDO::PARAM_STR);
                $stmt->execute();

                if ($stmt->rowCount() > 0) {
                    $response["success"] = true;
                    $response["message"] = "Cliente agregado con éxito.";
                } else {
                    $response["success"] = false;
                    $response["message"] = "No se pudo agregar al cliente.";
                }

            } else {
                header('HTTP/1.1 405 Method Not Allowed');
                $response["success"] = false;
                $response["message"] = 'Método no permitido.';
            }

        } catch (PDOException $e) {
            $response["success"] = false;
            $response["message"] = "Error en la base de datos: " . $e->getMessage();
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    }
}

$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['ID_Proveedor']) && isset($data['Nombre_Proveedor']) && isset($data['Direccion']) && isset($data['Correo_Electronico']) && isset($data['Telefono'])) {
    $clientePost = new ClientePost();
    $clientePost->agregarCliente($data['ID_Proveedor'], $data['Nombre_Proveedor'], $data['Direccion'], $data['Correo_Electronico'], $data['Telefono']);
} else {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos o incorrectos']);
}

?>