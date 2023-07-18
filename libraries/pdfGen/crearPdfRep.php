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
$idRep= $_GET['idRep'];
// Introducimos HTML de prueba


//direccion de la pagina donde estara el template del pdf
$html = "<style>
@font-face {
  font-family: 'OpenSans-Regular';
  font-style: normal;
  font-weight: normal;
  src: url(http://" . $_SERVER['SERVER_NAME']."/dompdf/fonts/OpenSans-Regular.ttf) format('truetype');
}
@font-face {
  font-family: 'OpenSans-Bold';
  font-style: normal;
  font-weight: 700;
  src: url(http://" . $_SERVER['SERVER_NAME']."/dompdf/fonts/OpenSans-Bold.ttf) format('truetype');
}

table thead tr td{
    font-family: 'OpenSans-Bold';
}
table tbody tr td{
    font-family: 'OpenSans-Regular';
}
</style>";
$html.=file_get_contents_curl(base_url()."reportePdf?id=".$idRep);


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
$dompdf->stream('reporte_'.$idRep.'_'.$fecha.'_'.$random.'.pdf');

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