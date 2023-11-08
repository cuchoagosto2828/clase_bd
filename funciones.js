function saludar() {
    alert('¡Hola! Bienvenido a mi página web.');
}
function ejemplo() {
    var usu = document.getElementById("yourUsername").value;
    var contra = document.getElementById("yourPassword").value;
    
    const apiUrl = 'http://localhost/mini_market/clase_bd/webService/ejemploPost.php'; // Reemplaza con tu URL
  
    const jsonData = {
        username: usu,
        password: contra
    };
    
    fetch(apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(jsonData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Red de respuesta no ok');
        }
        return response.json();
    })
    .then(data => {
        console.log('Respuesta del servidor:', data);
        if (data.success) {
            // Si las credenciales son correctas, redirigir al index.php
            window.location.href = 'index.php';
        } else {
            // Si las credenciales son incorrectas, mostrar un mensaje de error
            alert(data.message);
        }
    })
    .catch(error => {
        console.error('Error al enviar la solicitud:', error);
        alert('Hubo un error al procesar la solicitud. Por favor, inténtalo de nuevo.');
    });
}