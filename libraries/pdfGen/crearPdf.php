<?php
// Cargamos la librería dompdf que hemos instalado en la carpeta dompdf
//require_once 'dompdf/autoload.inc.php';
function base_url() {
	$base_url='http://localhost/PAM/';
	//$base_url='http://10.33.142.92';
	return $base_url;
}
require 'vendor/autoload.php';
use Dompdf\Dompdf;
use Dompdf\Options;

//recibimos el id de la minuta
$idMin= $_GET['idMin'];
// Introducimos HTML de prueba


//direccion de la pagina donde estara el template del pdf
$html=file_get_contents_curl(base_url()."minutaPdf?id=".$idMin);


$dompdf = new Dompdf();
$options = $dompdf->getOptions();
$options->set('isRemoteEnabled', true);
$options->set('defaultFont', 'Helvetica');
$dompdf->setOptions($options);
$dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('letter');
//$dompdf->setPaper('A4', 'landscape');

// Render the HTML as PDF
$dompdf->render();

// Output the generated PDF to Browser
$fecha = date('d-m-y'); 
$random = rand(99999, 999999999);
$dompdf->stream('minuta_'.$idMin.'_'.$fecha.'_'.$random.'.pdf');

function file_get_contents_curl($url) {
	$crl = curl_init();
	$timeout = 5;
	curl_setopt($crl, CURLOPT_URL, $url);
	curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($crl, CURLOPT_CONNECTTIMEOUT, $timeout);
	$ret = curl_exec($crl);
	curl_close($crl);
	return $ret;
}