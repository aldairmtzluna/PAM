<?php
require_once "helpers/DB_conection.php";
   

// Consulta SQL para obtener los datos
$query = "SELECT participante_id, participante_nom FROM participantes";

// Ejecutar la consulta
$resultado = $DB_conection->query($query);

// Obtener los datos y guardarlos en un array
$datos = array();
while ($fila = $resultado->fetch_array(MYSQLI_BOTH)){
    $datos[] = $fila;
}

// Devolver los datos como JSON
echo json_encode($datos);