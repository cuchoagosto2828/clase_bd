<?php

include 'CRUD/CRUD.php';

class ClientePost {

    function __construct() {
        // Constructor vacío si no necesitas inicializar nada
    }

    function agregarProducto($idProducto, $nombreProducto, $descripcion, $Precio, $idCategoria) {
        $response = array();

        try {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();
                $conexion = new conexion();
                $pdo = $conexion->conect();

                // Consulta preparada para agregar un nuevo cliente
                $sql = "INSERT INTO productos (ID_Producto, Nombre_Producto, Descripcion, Precio, ID_Categoria) 
                        VALUES (:idProducto, :nombreProducto, :descripcion, :Precio, :idCategoria)";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':idProducto', $idProducto, PDO::PARAM_INT);
                $stmt->bindParam(':nombreProducto', $nombreProducto, PDO::PARAM_STR);
                $stmt->bindParam(':descripcion', $descripcion, PDO::PARAM_STR);
                $stmt->bindParam(':Precio', $Precio, PDO::PARAM_STR);
                $stmt->bindParam(':idCategoria', $idCategoria, PDO::PARAM_STR);
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

if (isset($data['ID_Producto']) && isset($data['Nombre_Producto']) && isset($data['Descripcion']) && isset($data['Precio']) && isset($data['ID_Categoria'])) {
    $clientePost = new ClientePost();
    $clientePost->agregarCliente($data['ID_Producto'], $data['Nombre_Producto'], $data['Descripcion'], $data['Precio'], $data['ID_Categoria']);
} else {
    echo json_encode(['success' => false, 'message' => 'Datos incompletos o incorrectos']);
}

?>