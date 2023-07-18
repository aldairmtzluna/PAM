<?php include_once (CAB); ?>
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

        <main class="container ">
            <form id="formMinuta" name="new-minuta" autocomplete="off" method="post">
            <div class="row ">
                <div class="col-md-12">
                <!--- Columna panel de creación -->
                    <div class="form-group">
                        <h4><span class="glyphicon glyphicon-tasks"></span> Detalles de la minuta</h4>                       
                    </div> 
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group op-menu">
                                <label for="calendar" class="control-label">Fecha
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <input id="fechaMin" type="date" class="form-control" name="fechaMin">
                                <small class="smallDatos form-text form-text-error hide" aria-live="polite">
                                    Este campo es obligatorio
                                </small>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group op-menu">
                                <label for="calendar" class="control-label">Hora Inicio
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <input id="hora" type="time" class="form-control" name="hora">
                                <small class="smallDatos form-text form-text-error hide" aria-live="polite">
                                    Este campo es obligatorio
                                </small>
                            </div>
                        </div>

                        
                    </div><!-- end row-->

                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group op-menu">
                                <label for="calendar" class="control-label">Lugar
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <input id="lugar" type="text" class="form-control" name="lugar">
                                <small class="smallDatos form-text form-text-error hide" aria-live="polite">
                                    Este campo es obligatorio
                                </small>
                            </div>
                        </div> 

                        <div class="col-md-6">
                            <div class="form-group op-menu">
                                <label for="calendar" class="control-label">Título
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <input id="tituloMin" type="text" class="form-control input-format " name="tituloMin">
                                <small class="smallDatos form-text form-text-error hide" aria-live="polite">
                                    Este campo es obligatorio
                                </small>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <div class="form-group op-menu">
                                <label for="unidad" class="control-label">Unidad Administrativa
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <!--carga de select con las unidades-->
                                <select id="cargoS" class="form-control input-format" data-live-search="true" name="cargo">                                 
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group op-menu">
                                <label for="" class="control-label">Desarrollo
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <textarea id="observacion" class="form-control" rows="3"name="observacion" Value=""></textarea>
                            </div>
                        </div>                           
                    </div><!-- end row-->
                </div> <!--- fin md-12-->

                <!--div control de los acuerdos-->
                
                <div class="col-md-12">
                    <h4><span class="glyphicon glyphicon-transfer"></span> Acuerdos</h4> 
                    
                </div>

                <div class="row ">
                    <div class="col-md-12">
                    <!--- Columna panel de creación -->
                        <div class="form-group">
                            <h4><span class="glyphicon glyphicon-th-list"></span> Elegir Responsables</a></h4>                        
                        </div>

                        <div class="row">
                            <div class="col-md-6" style="display: flex;">
                                
                                <select id="userS" class="i-format form-control" data-live-search="true" name="usuarios[]" 
                                style="width: 80%; height: 50px; margin-right: 10px;">
                                </select>
                               

                                <button title="AGREGAR PARTICIPANTE" role="button" class="btn-rec addP" id="addP" name="addP" ><span class="glyphicon glyphicon-plus"></span></button>
                                
                            </div>

                            
                        </div>
                    </div>
                </div>
                  
                <div class="col-md-12">                               
                                <a data-toggle="modal" data-target="#invitado" title="REGISTRAR RESPONSABLE" role="button" class="btn btn-link bAddInvitado" ><span class="glyphicon glyphicon-plus"></span> Registrar Nuevo Responsable</a>
                    </div>
                    <br></br>

                <div id="divId"></div>
                
                <div class="col-md-12 espacio1" >
                    
                    <a title="AGREGAR CADENA" id="agregar" onClick="addRow('acuerdosTable')" class="cursor"><span class="glyphicon glyphicon-plus"></span> Agregar Nuevo Acuerdo</a>
                </div>   
                <div class="row">
                    
                    <div class="col-md-1 espacio1">
                                 
                </diV> 
                </div>
                
                

                <div class="col-md-12">           
                    <!--divs Acuerdos-->
                     <table id="acuerdosTable" >
		                <thead>
		                    <tr>
		                    	<th><div class="text-center"><span class="glyphicon glyphicon-trash" title="REMOVER ACUERDO SELECCIONADO" onClick="deleteRow('acuerdosTable')"></span></div></th>
		                    	<th class="col-md-6">
		                    		<label for="titulo" class="control-label">Título
                                      <span class="asteriscoData form-text">*</span>
                                	</label>
		                    	</th>
		                    	<th class="col-md-2">
		                    		<label for="fecha" class="control-label">Fecha Compromiso
                                      <!--<span class="asteriscoData form-text">*</span>-->
                                	</label>
		                    	</th>
		                    	<th class="col-md-4">
		                    		<label for="responsable" class="control-label">Responsable
                                		<span class="asteriscoData form-text">*</span>
                                	</label>
		                    	</th>
 		                    </tr>
		                </thead>
		                <tbody>
                            <tr>
                                <td class="form-control">
		                    		<input type="checkbox" class="check" name="chk"/>
 		                    	</td>

                                <td class="col-md-6 td-a"> 			
                            		<input type="text" class="form-control tituloA" id="tituloA[]" name="tituloA[]" autocomplete="off" />
 		                		</td>

		                        <td class="col-md-2 td-a">
                            		<input type="date" class="form-control fechaA" id="fechaA[]" name="fechaA[]" autocomplete="off" />
 		                		</td>

		                    	<td class="col-md-4 td-a clone">
                              		<select class="form-control origen responsable" id="responsable[]" name="responsable[]" autocomplete="off" >

 		                			</select>
 		                		</td>
                        	</tr>
 	                    </tbody>
                    </table>

                </div><!--div acuerdos-->
            </div><!-- end row principal-->
            <!--div guardar minuta-->
                            <div class="col-md-6">
                                <div class="form-group op-menu">
                                    <label for="archivo" class="control-label">Subir archivo
                                    </label>
                 
                                    <input  type="file" class="form-control" name="archivoOficio[]" multiple accept=".pdf, .docx, .	.xlsx">
                                    <input type="hidden" name="archivoOficioVacio" value="1">
                                </div>
                            </div>
                            <div class="col-md-6">
                            <div class="form-group op-menu">
                                <label for="calendar" class="control-label">Hora Cierre
                                    <span class="asteriscoData form-text">*</span>
                                </label>
                                <input id="horaC" type="time" class="form-control" name="horaC">
                                <small class="smallDatos form-text form-text-error hide" aria-live="polite">
                                    Este campo es obligatorio
                                </small>
                            </div>
                        </div>

            <div class="col-md-12 top-buffer text-center">
                <button class="btn btn-primary" type="submit" ><span class="glyphicon glyphicon-floppy-disk" name="go"></span> Guardar Minuta</button>
            </div>
        </form>   
        </main><!--end Main Container-->
        <div class="bottom-buffer"></div>
      <!-- SECCIÓN DE VENTANAS MODALES-->
  <?php 
      getModal('invitado', $data); 
      //getModal('rolPermisos', $data); 
?>  
 <script>
    // Función para actualizar los datos del select mediante AJAX
    function actualizarSelect() {
        // Hacer la petición AJAX
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'tablaConsulta.php', true);
        xhr.onload = function() {
            // Procesar la respuesta
            var datos = JSON.parse(xhr.responseText);
            var select = document.getElementById('userS');
            // Obtener el valor seleccionado antes de actualizar el select
            var valorSeleccionado = select.value;
            select.innerHTML = '<option value="" disabled>SELECCIONE UNA OPCIÓN</option>';
            for (var i = 0; i < datos.length; i++) {
                var option = document.createElement('option');
                option.value = datos[i].participante_id;
                option.text = datos[i].participante_nom;
                select.appendChild(option);
            }
            // Establecer el valor seleccionado después de actualizar el select
            select.value = valorSeleccionado;
        };
        xhr.send();
    }

    // Actualizar los datos del select al cargar la página
    actualizarSelect();

    // Actualizar los datos del select cada vez que se haga un cambio en los datos
    setInterval(actualizarSelect, 1000);
</script>
    <?php include_once (FOOT); ?>
    