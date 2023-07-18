<?php
    include_once 'helpers/DB_conection.php';

    $id= $_GET['id'];
    //$id= 3;
    /*MINUTAS*/
    $queryMin="SELECT m.minuta_id, m.minuta_titulo as titulo, m.minuta_desarrollo as desarrollo, m.minuta_lugar as lugar, DATE_FORMAT(`minuta_fecha`,'%d/%m/%Y') as fecha , m.minuta_hora as hora, m.minuta_hora_cierre as hora_cierre, m.minuta_participantes as participantes,
    c.cargo_nom as unidad FROM minutas as m
    INNER JOIN cargos as c ON m.minuta_unidad_admin= c.cargo_id WHERE m.minuta_id=$id";
    $minutas = $DB_conection->query($queryMin);
    $minuta = $minutas->fetch_assoc();

    /*Acuerdos*/
    $queryAc ="SELECT a.acuerdo_id, a.acuerdo_titulo as titulo, DATE_FORMAT(a.acuerdo_fecha_entrega, '%d/%m/%Y') as fecha,
    p.participante_nom as nombre FROM acuerdos as a 
    INNER JOIN participantes as p ON a.acuerdo_responsable= p.participante_id
    WHERE acuerdo_minuta=$id;";

    $acuerdos = $DB_conection->query($queryAc);

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
        <link href="https://framework-gb.cdn.gob.mx/applications/cms/favicon.png" rel="shortcut icon">
        <link href="http://localhost/PAM/frame/css/main.css" rel="stylesheet">
        <link href="http://localhost/PAM/resources/css/styles.css" rel="stylesheet">

</head>
<body>       
    <main class="container">
        <table>
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td class="logo">
                        <img src="http://localhost/PAM/resources/logos/logo-full-sict.png">
                    </td>
                </tr>

                <tr>
                    <td class="text-center">
                        <b>Unidad de Administración y Finanzas</b>
                    </td>
                </tr>

                <tr>
                    <td class="text-center">
                        <b>Unidad de Tecnologías de Información y Comunicaciones</b>
                    </td>
                </tr>
                
                <tr>
                    <td class="text-center">
                        <b><?php echo $minuta['unidad']?></b>
                    </td>
                </tr>

                <tr>
                    <td class="separar">
                    </td>
                </tr>

                <tr>
                    <td class="text-center">
                        <b><?php echo $minuta['titulo']?></b>
                    </td>
                </tr>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                 <tr>
                    <td class="text-center tab-reporte">
                        <b>Fecha</b>
                    </td>

                    <td class="text-center tab-reporte">
                        <b>Hora apertura / Hora cierre</b>
                    </td>

                    <td class="text-center tab-reporte">
                        <b>Lugar</b>
                    </td>
                </tr>
        
                <tr id="info-minuta">
                    <td class="cell-reporte text-center">
                        <b><?php echo $minuta['fecha']?></b>
                    </td>
                    <td class="cell-reporte text-center">
                        <b><?php echo $minuta['hora']?> / <?php echo $minuta['hora_cierre']?></b>
                    </td>
                    <td class="cell-reporte text-center">
                        <b><?php echo $minuta['lugar']?></b>
                    </td>
                </tr>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                 <tr>
                    <td class="separar">
                    </td>
                </tr>

                <tr>
                    <td class="text-center">
                        <b>Desarrollo de la sesión</b>
                    </td>
                </tr>
        
                <tr id="info-desarrollo">
                    <td class="text-left">
                    <?php echo $minuta['desarrollo']?>
                    </td>
                </tr>

                <tr>
                    <td class="separar">        
                    </td>
                </tr>
            </tbody>
        </table>


        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                 <tr>
                    <td class="text-center tab-reporte">
                        <b>Acuerdos y compromisos</b>
                    </td>
                </tr>
            </tbody>
        </table>

        <table  class="reporte">
            <thead>
            </thead>
            <tbody>
                <?php 
                    foreach ($acuerdos as $acuerdo){ ?>
                        <tr id="info-acuerdos">
                    
                            <td class="cell-reporte text-left">
                                <b><?php echo $acuerdo['titulo']?></b>
                            </td>
                            <td class="cell-reporte text-center">
                                <b><?php echo $acuerdo['nombre']?></b>
                            </td>
                            <td class="cell-reporte text-center">
                                <b><?php echo $acuerdo['fecha']?></b>
                            </td>
                        </tr>   
                    <?php } ?>
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
                    <td class="text-center tab-reporte">
                        <b>Unidad de Tecnologías de Información y Comunicaciones</b>
                    </td>
                </tr>
                <?php
                        $arrPart = explode(',', $minuta['participantes']);
                        //echo $arrUrl[0];
                        foreach ($arrPart as $participante){
                            $serv='query'.$participante;
                            $serv="SELECT p.participante_nom as nombre, c.cargo_nom as cargo, t.titulo_abr as titulo
                            FROM participantes as p
                            INNER JOIN titulos as t ON p.participante_titulo = titulo_id
                            INNER JOIN cargos as c ON p.participante_cargo= cargo_id
                            WHERE participante_id=$participante";
                            $info = $DB_conection->query($serv);
                            $user = $info->fetch_assoc();
                            $printR= "<b>". $user['titulo']. " ".  $user['nombre']. "</b><br/>".$user['cargo'];                                                 
                ?>
                <tr>
                    <td class="cell-reporte text-left">
                        <?php echo $printR; ?>
                    </td>
                </tr>
                <?php } ?>
                <tr>
                    <td class="separar"></td>
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