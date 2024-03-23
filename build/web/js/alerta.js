document.addEventListener("DOMContentLoaded", function() {
    // Obtener el elemento del mensaje de error
    var mensajeErrorDiv = document.getElementById('mensajeError');

    // Verificar si el mensaje de error existe y luego ocultarlo después de 2 segundos
    if (mensajeErrorDiv) {
        setTimeout(function() {
            mensajeErrorDiv.style.display = 'none';
        }, 2000); // 2000 milisegundos = 2 segundos
    }
});

function mostrarAlertaInicioSesionExitoso() {
    window.alert('Inicio de sesión exitoso');
    console.log();
}
function validarFormulario() {
    var usuario = document.getElementById("usuario").value;
    var contraseña = document.getElementById("contrasena").value;
    var mensajeErrorDiv = document.getElementById('mensajeError');

    if (usuario.trim() === '' || contraseña.trim() === '') {
        mensajeErrorDiv.style.display = 'block'; // Mostrar mensaje de error
        return false; // Evitar el envío del formulario
    }

    return true; // Permitir el envío del formulario
}