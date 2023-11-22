<?php

include 'CRUD/CRUD.php';

class ClientePost {

    function __construct() {
        // Constructor vacío si no necesitas inicializar nada
    }

    function agregarCategoria($ID_Categoria, $Nombre_Categoria) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();
                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Consulta preparada para agregar un nuevo cliente
                $sql = "INSERT INTO categorias (ID_Categoria, Nombre_Categoria) 
                        VALUES (:idcategorias, :ID_Categoria, :Nombre_Categoria)";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':idCategoria', $idCategoria, PDO::PARAM_INT);
                $stmt->bindParam(':nombrecategoria', $nombrecategoria, PDO::PARAM_STR);
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

if (isset($data['ID_Categoria']) && isset($data['Nombre_categoria']) ) {
    $clientePost = new ClientePost();
    $clientePost->agregarCliente($data['ID_Categoria'], $data['Nombre_categoria']);
} else {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos o incorrectos']);
}

?>