<?php

include 'CRUD/CRUD.php';

class EjemploPost {

    function __construct() {
        
    }

    function insertarUsuario($username, $password) {
        try {
            // Comprobar si la solicitud es POST
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $crud = new crud();

                $conexion = new conexion();
                $username = $conexion->conect()->quote($username);
                $password = $conexion->conect()->quote($password);
                
                $sql = "INSERT INTO ejemplo (nombre, contra) VALUES ($username, $password)";
                $response = $crud->insertar($sql);

            } else {
                // Si no es una solicitud POST, devolver un mensaje de error
                header('HTTP/1.1 405 Method Not Allowed');
                echo 'Método no permitido.';
            }
        } catch (PDOException $e) {
            $response = array(
                "success" => false,
                "message" => "Error: " . $e->getMessage()
            );
            // Devolver la respuesta en formato JSON en caso de error
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    }
}

// Crear una instancia de la clase 'EjemploPost'
$ejemploPost = new EjemploPost();
// Llamar a la función 'insertarUsuario' para manejar la solicitud POST
$ejemploPost->insertarUsuario($_POST['username'], $_POST['password']);