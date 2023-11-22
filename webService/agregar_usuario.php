<?php

include 'CRUD/CRUD.php';

class ClientePost {

    function __construct() {
        // Constructor vacío si no necesitas inicializar nada
    }

    function agregarEmpleado($ID_Empleado, $nombre, $apellido, $usuario, $contra, $Telefono, $Correo_Electronico, $ID_Rol, $Salario) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();
                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Consulta preparada para agregar un nuevo cliente
                $sql = "INSERT INTO empleados (ID_Empleado, Nombre, Apellido, usuario, contra, Telefono, Correo_Electronico, ID_Rol, Salario) 
                        VALUES (:idEmpleado, :nombre, :apellido, :usuario, :contra, :Telefono, :Correo_Electronico, :idRol, :Salario)";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':idEmpleado', $idEmpleado, PDO::PARAM_INT);
                $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
                $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
                $stmt->bindParam(':usuario', $usuario, PDO::PARAM_STR);
                $stmt->bindParam(':contra', $contra, PDO::PARAM_STR);
                $stmt->bindParam(':Telefono', $Telefono, PDO::PARAM_STR);
                $stmt->bindParam(':correoElectronico', $correoElectronico, PDO::PARAM_STR);
                $stmt->bindParam(':idRol', $idRol, PDO::PARAM_STR);
                $stmt->bindParam(':Salario', $Salario, PDO::PARAM_STR);
                $stmt->execute();

                if ($stmt->rowCount() > 0) {
                    $response["success"] = true;
                    $response["message"] = "Usuario agregado con éxito.";
                } else {
                    $response["success"] = false;
                    $response["message"] = "No se pudo agregar al usuario.";
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

if (isset($data['ID_Empleado']) && isset($data['Nombre']) && isset($data['Apellido']) && isset($data['usuario']) && isset($data['contra']) && isset($data['Telefono']) && isset($data['Correo_Electronico']) && isset($data['Id_Rol']) && isset($data['Salario']) {
    $clientePost = new ClientePost();
    $clientePost->agregarCliente($data['ID_Empleado'], $data['Nombre'], $data['Apellido'], $data['usuario'], $data['contra'], $data['Telefono'], $data['Correo_Electronico'], $data['Id_Rol'], $data['Salario']);
} else {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos o incorrectos']);
}

?>