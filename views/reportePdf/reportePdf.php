<?php
    include_once 'helpers/DB_conection.php';

    $id= $_GET['id'];
    //$id= 3;
    /*Reportes*/
    $queryRep="SELECT rep.reporte_id, rep.reporte_titulo as titulo, DATE_FORMAT(`reporte_fecha_incidente`,'%d/%m/%Y') as fechaInc, rep.reporte_incidente as incidente, rep.reporte_caso as caso, rep.reporte_consentimiento as consentimiento, rep.reporte_etiqueta as etiqueta, rep.reporte_modelo as modelo, rep.reporte_fabricante as fabricante, rep.reporte_num_serie as numSerie, rep.reporte_descripcion as descripcion, rep.reporte_disp_final as disposicion, DATE_FORMAT(`reporte_fecha_final`,'%d/%m/%Y') as fechaFinal,
    recep.receptor_nom as receptor FROM reportes as rep
    INNER JOIN receptores as recep ON rep.reporte_persona= recep.receptor_id WHERE rep.reporte_id=$id";
    $reportes = $DB_conection->query($queryRep);
    $reporte = $reportes->fetch_assoc();

    /*Evidencia*/
    $queryEv ="SELECT evidencia_origen as origen, DATE_FORMAT(evidencia_fecha, '%d/%m/%Y') as fecha, evidencia_razon as razon, evidencia_destino as destino FROM evidencias WHERE evidencia_reporte=$id;";
    $evidencias = $DB_conection->query($queryEv);
    $evidencia = $evidencias->fetch_assoc();

/*MINUTAS
SELECT m.minuta_id, m.minuta_titulo, m.minuta_desarrollo, m.minuta_lugar, DATE_FORMAT(`minuta_fecha`,'%d/%m/%Y') as Fecha , minuta_hora, minuta_hora_cierre,
c.cargo_nom FROM minutas as m
INNER JOIN cargos as c ON m.minuta_unidad_admin= c.cargo_id WHERE m.minuta_id=4;

*/

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $data['page_title']; ?></title>
        <!-- CSS --
        <link href="https://framework-gb.cdn.gob.mx/applications/cms/favicon.png" rel="shortcut icon">
        <link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
        <link href="http://localhost/PAM/resources/css/styles.css" rel="stylesheet">
        -->
        <link href="<?php echo assets_full(); ?>img/icons/favicon.png" rel="shortcut icon">
        <link href="<?php echo frame_full(); ?>css/main.css" rel="stylesheet">
        <link href="<?php echo assets_full(); ?>css/styles.css" rel="stylesheet">

</head>
<body>       
    <main class="container">
    <table  border="1" style=”width:100%;”>
        <colgroup>
			<col style="width: 33%"/>
			<col style="width: 33%"/>
			<col style="width: 33%"/>
			
		</colgroup>
			<thead>
            </thead>
            <tbody>
				<tr>
					<td class="text-center" rowspan="2">
                        <img src="<?php echo assets_full(); ?>logos/logo-sict.jpg" whidth="30" height="30">
                    </td>

					<td class="text-center" colspan="2">
                        <b><?php echo strtoupper('Secretaria de Infraestructura Comunicaciones y Transportes');?><br>
                        Unidad de Administración y Finanzas</b><br>
                        Unidad de Tecnologías de Información y Comunicaciones
                    </td>

				    <td class="text-center" rowspan="2">
                        <img src="<?php echo assets_full(); ?>logos/rfm.png" whidth="50" height="90">
                    </td>
				</tr>
                
				<tr>
					<td class="text-center" colspan="2">
                        Formato de entrega de Evidencias <br>
                        Cadena de Custodia
                    </td>  
				</tr>
			</tbody>
       
        </table>
<br>

        <table class="reporte">
            <thead>
            </thead>
            <tbody>
                 <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Fecha</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Tipo de Incidente</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Caso</b>
                    </td>
                </tr>
                
                <tr id="info-reporte">
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['fechaInc'];?></b>
                    </td>

                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['incidente'];?></b>
                    </td>

                    <td class="cell-reporte text-center">
                        <b><?php  echo $reporte['caso']?></b>
                    </td>
                </tr>
                    
                <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Requiere Consentimiento</b>
                    </td>

                    <td  class="text-center tab-reporteEv">
                        <b>Firma de Consentimiento</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Etiqueta</b>
                    </td>
                </tr>
                
                <tr id="info-reporte">
                    <td  class="cell-reporte text-center">
                        <b>
                            <?php
                                if($reporte['consentimiento']==1){
                                    $consentimiento='SI';
                                }
                                else if ($reporte['consentimiento']==0){
                                    $consentimiento='NO';
                                }
                                echo $consentimiento;
                            ?>
                        </b>
                    </td>

                    <td width="50" height="60" class="cell-reporte text-center">
                        <b></b>
                    </td>

                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['etiqueta'] ?></b>
                    </td>

                </tr>

                <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Modelo</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Fabricante</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Número de Serie</b>
                    </td>
                </tr> 
          
                <tr id="info-reporte">
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['modelo'];?></b>
                    </td>
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['fabricante'];?></b>
                    </td>
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['numSerie'];?></b>
                    </td>
                </tr>
            </tbody>
        </table> 

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Descripción</b>
                       
                    </td>
                </tr>
                <tr>
                    <td class="cell-reporte text-left">
                    <?php echo nl2br($reporte['descripcion']); ?>
                    </td>
                </tr> 
            </tbody>
        </table> 

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                <tr>
                  <td class="text-center tab-reporteEv">
                        <b>Persona que recibe la Evidencia </b>
                  </td> 

                  <td class="text-center tab-reporteEv">
                        <b>Firma</b>
                  </td> 
                </tr>

        
                <tr id="info-reporte">
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['receptor']; ?></b>
                    </td>
                    <td width="50" height="60" class="cell-reporte text-center">
                        <b></b>
                    </td>
                   
                </tr>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
            <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Cadena de Custodia</b>
                       
                    </td>
                </tr>
            </tbody>
        </table>


        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
            <?php
                $printR='';
                foreach ($evidencias as $evidencia){
                    $printR.= '<tr>
                        <td class="text-center tab-reporteEv">
                            <b>Origen/Inicio</b>
                        </td>
                
                        <td class="text-center tab-reporteEv">
                            <b>Fecha</b>
                        </td>
                    
                        <td class="text-center tab-reporteEv">
                            <b>Razón</b>
                        </td>
                    
                        <td class="text-center tab-reporteEv">
                            <b>Destino/Final</b>
                        </td>
                    </tr> 

                    <tr id="info-reporte">
                        <td class="cell-reporte text-center">
                            <b>'.$evidencia["origen"].'</b>
                        </td>
                        <td class="cell-reporte text-center">
                            <b>'.$evidencia['fecha'].'</b>
                        </td>
                        <td class="cell-reporte text-center">
                            <b>'.$evidencia['razon'].'</b>
                        </td>
                        <td class="cell-reporte text-center">
                            <b>'.$evidencia['destino'].'</b>
                        </td>
                    </tr>';                                           
                }
                echo $printR;
          ?>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                
                 <tr>
                    <td class="text-center tab-reporteEv">
                        <b>Disposicion Final de la Evidencia</b>
                    </td>

                    <td class="text-center tab-reporteEv">
                        <b>Fecha</b>
                    </td>
                </tr>

                <tr id="info-reporte">
                    <td width="50" height="40" class="cell-reporte text-center">
                        <b><?php echo $reporte['disposicion'] ?></b>
                    </td>
                    <td class="cell-reporte text-center">
                        <b><?php echo $reporte['fechaFinal'] ?></b>
                    </td>  
                </tr>
               
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td class="separar"></td>
                </tr>
                 <tr>
                    <td class="col-md-12 pie-pag-logo">
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td class="separar"></td>
                </tr>
                 <tr>
                    <td class="text-left pie-pag">
                        Avenida de los Insurgentes Sur 1089, Colonia Noche Buena, C. P. 03720<br/>
                        Alcadía Benito Juárez, CDMX
                    </td>

                    <td class="text-right pie-pag">
                        Tel: 01(55)5723 9300<br/>
                        www.gob.mx/sct
                    </td>
                </tr>
            </tbody>
        </table>
    </main>
        
</body>
</html>