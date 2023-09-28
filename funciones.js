function saludar() {
    alert('¡Hola! Bienvenido a mi página web.');
}
document.getElementById("login-form").addEventListener("submit", function(event) {
    event.preventDefault(); // Previene el envío predeterminado del formulario
    window.location.href = "plantilla.html"; // Redirige a la página "plantilla.html"
});