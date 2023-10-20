<?php

include 'CRUD/CRUD.php';

class EjemploPost {

    function __construct() {
        
    }

    function verificarCredenciales($username, $password) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();

                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Usar una consulta preparada para verificar las credenciales
                $sql = "SELECT * FROM empleados WHERE usuario = :username AND contra = :password";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':username', $username, PDO::PARAM_STR);
                $stmt->bindParam(':password', $password, PDO::PARAM_STR);
                $stmt->execute();

                if ($stmt->rowCount() > 0) {
                    $response["success"] = true;
                    $response["message"] = "Credenciales válidas.";
                } else {
                    $response["success"] = false;
                    $response["message"] = "Credenciales no válidas.";
                }

            } else {
                // Si no es una solicitud POST, devolver un mensaje de error
                header('HTTP/1.1 405 Method Not Allowed');
                $response["success"] = false;
                $response["message"] = 'Método no permitido.';
            }

        } catch (PDOException $e) {
            $response["success"] = false;
            $response["message"] = "Error: " . $e->getMessage();
        }

        // Devolver la respuesta en formato JSON
        header('Content-Type: application/json');
        echo json_encode($response);
    }
}

// Leer el JSON enviado en la solicitud
$data = json_decode(file_get_contents("php://input"), true);

// Crear una instancia de la clase 'EjemploPost'
$ejemploPost = new EjemploPost();

// Llamar a la función 'verificarCredenciales' para manejar la solicitud POST
$ejemploPost->verificarCredenciales($data['username'], $data['password']);

?>

