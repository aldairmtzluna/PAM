<?php 
    include_once (CAB);
    require_once '././helpers/DB_conection.php';       
?>
<div>
    <div class="col-md-12 banner top-buffer">
        <div class="container">
            <i><label for="user" class="f-user">
                <span class="glyphicon glyphicon-tasks"></span>
                <?php echo $data['page_name']; ?>
            </label></i>
        </div>      
    </div>
</div>
<div class="container">
    <h3>Oficios subidos por día</h3>
    <hr class="red">
</div>
<main class="container">
    <table class="table table-responsive display" id="table-ofi">
        <thead>
		    <tr>
			    <th>Fecha</th>
			    <th>Registros</th>
		    </tr>
	    </thead>
        <tbody>
            <?php 
                $oficios=0;
                for($oficios; $oficios <= 29; $oficios ++){
                    $fecha = date('d/m/Y', strtotime("-$oficios days")); // Calcula la fecha restando los días correspondientes
                    $sql = 'SELECT COUNT(*)AS total, DATE_FORMAT(ofi_fechaSOFI,'."'%d/%m/%Y'".')
                    as Fecha FROM oficios WHERE ofi_fechaSOFI  = CURDATE()-'.$oficios;
                    $resultado=$DB_conection->query($sql);
                    $result =$resultado->fetch_assoc();
            ?>
            <tr>
                <td>
                    <?php 
                        if(empty($result['Fecha'])){
                            echo $fecha;
                        }else{
                            echo $result['Fecha'];
                        }
                    ?>
                </td>
                <td>
                    <?php echo $result['total']?>
                </td>
            </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
</div>   
</main>   
    <div class="top-buffer bottom-buffer"></div>
    <?php include_once (FOOT); ?>
    <script>
        $(document).ready( function () {
            $('#table-ofi').DataTable({
                'language':{
                    'lengthMenu': 'Ver _MENU_ regs. por pag.',
                    'info': 'página _PAGE_ de _PAGES_',
                    'infoEmpty': 'No se encontraron resultados',
                    'infoFiltered': '(filtrada de _MAX_ regs.',
                    'loadingRecords': 'Cargando...',
                    'processing': 'Procesando...',
                    'search': '<span class="glyphicon glyphicon-search"></span> Buscar ',
                    'zeroRecords': 'No se encontraron registros que coincidan con tu busqueda :(',
                    'paginate': {
                        'next': 'Sig.',
                        'previous': 'Ant.',
                        
                    },
                },
                'ordering': false
                /*'order':[[0,'desc']],
                /*'bProcessing': true,
                'bServerSide': true,
                'sAjaxSource': 'process_regs.php'*/
            });
        });
    </script>
