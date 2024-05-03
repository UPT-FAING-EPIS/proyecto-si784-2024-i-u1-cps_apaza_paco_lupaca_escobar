<?php 
function conectarse()
{
    // Utiliza la función getenv() para obtener las variables de entorno
    $host = getenv("localhost");
    $user = getenv("root");
    $password = getenv("");
    $database = getenv("agenda_jobs");

    // Se conecta a la base de datos con las variables de entorno
    if(!($link = mysqli_connect($host, $user, $password, $database))) {
        echo "Error conectando a la base de datos."; 
        exit();
    }
    return $link;
}
?>