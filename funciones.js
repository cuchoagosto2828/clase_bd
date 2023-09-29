function saludar() {
    alert('¡Hola! Bienvenido a mi página web.');
}
function validar(){
    var usu = document.getElementById("yourUsername");
    var contra = document.getElementById("yourPassword");
    console.log("usu "+ usu.value ); // Agrega esta línea para verificar

    window.location.href = "index.php";
}