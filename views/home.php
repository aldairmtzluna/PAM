<?php
	//Obten el valor de $SERVER['HTTP_HOST]
	$host = $_SERVER['HTTP_HOST'];

	//Contruye la url de la redirección con la variable incluida
	$url = "http://" .$host;
	header('location:' .$url. '/PAM/login');
	exit;