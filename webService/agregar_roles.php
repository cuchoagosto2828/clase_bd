<?php

include 'CRUD/CRUD.php';

class ClientePost {

    function __construct() {
        // Constructor vacío si no necesitas inicializar nada
    }

    function agregarCliente($idCliente, $nombre, $apellido, $correoElectronico, $telefono, $direccion) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();
                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Consulta preparada para agregar un nuevo cliente
                $sql = "INSERT INTO roles (ID_Rol, Nombre_Rol) 
                        VALUES (:idRoles, :id_Rol, :Nombre)";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':id_Rol', $id_Rol, PDO::PARAM_INT);
                $stmt->bindParam(':Nombre', $Nombre, PDO::PARAM_STR);
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

if (isset($data['ID_Rol']) && isset($data['Nombre_Rol'])) {
    $clientePost = new ClientePost();
    $clientePost->agregarCliente($data['ID_Rol'], $data['Nombre_Rol']);
} else {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos o incorrectos']);
}

?>