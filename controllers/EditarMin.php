<?php

    class EditarMin extends Controllers{
        public function __construct(){
            parent::__construct();
             //se verifica que se haya iniciado sesion para ver el portal
             session_start();
             if(empty($_SESSION['login'])){
                  //Obten el valor de $SERVER['HTTP_HOST]
                  $host = $_SERVER['HTTP_HOST'];

                  //Contruye la url de la redirección con la variable incluida
                  $url = "http://" .$host;
                   header('location:' .$url.'/PAM');
             }
        }

        public function editarMin ($params){
            $data['page_id'] = 'p_minutas';
            $data['page_title'] = '.:Editar Minuta:.';
            $data['page_tag'] = 'minutas';
            $data['page_name'] = 'Editar Minuta';
            $data['page_scripts']='<script src="'.assets().'js/editarMin.js"></script><script type="text/javascript" src="'.assets().'js/plugins/bootstrap-select.min.js"></script>'; 
            $this->views->getView($this, 'editarMin', $data);
        }

        //obtener info de la minuta
        public function getMinuta($idMinuta){
            $intIdMinuta = intval(strClean($idMinuta));
            if($intIdMinuta>0){
                $arrData = $this->model->selectMinuta($intIdMinuta);
                if(empty($arrData))	{
					$arrResponse = array('status' => false, 'msg' => 'Minuta no existente en la base de datos');
                }
                else{
                    $arrResponse = array('status' => true, 'data' => $arrData);
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
           die();
        }

        //obtener participantes por select
        public function getSelectParticipantes(){
            $options ='';
            $arrData= $this->model->selectParticipantesC();
            if(count($arrData) > 0){
                for($i=0; $i < count($arrData); $i++){
                    $options .='<option value="'.$arrData[$i]['participante_id'] .'">'.$arrData[$i]['participante_nom']. '</option> ';
                }
            }
            echo $options;
            die();
        }

        public function setMinuta() {
            require_once "helpers/DB_conection.php";
            if ($_POST) {
                $error_minutas = false;
                $error_acuerdos = false;
                $strDesarrollo = $_POST['observacion'];
                $intIdMinuta = intval($_POST['idMinuta']);
                $strTitulosA = $_POST['tituloA'];
                $strFechasA = $_POST['fechaA'];
                $strResponsables = $_POST['responsable'];
                
                // Manipulación de array de responsables para obtener los participantes
                // Quitamos los participantes repetidos
                $participantes = array_unique($_POST['responsable']);
                
                // Convertimos el array en la cadena que se guardará en la DB
                $participantesDB = implode(',', $participantes); // De array a cadena
        
                if (empty($strDesarrollo)) {
                    $arrResponse = array('status' => false, 'msg' => 'Todos los campos de la tabla "minutas" son obligatorios');
                    $error_minutas = true;
                }
        
                if (empty($strTitulosA) || empty($strFechasA) || empty($strResponsables)) {
                    $arrResponse = array('status' => false, 'msg' => 'Todos los campos de la tabla "acuerdos" son obligatorios');
                    $error_acuerdos = true;
                }
        
                if (!$error_minutas && !$error_acuerdos) {
                    $request_min_up = $this->model->updateMinuta($strDesarrollo, $participantesDB, $intIdMinuta);
                    $ipUser = $_SERVER['REMOTE_ADDR'];
                    $accion = 5;
                    if ($request_min_up > 1) {
                        $this->model->historial($_SESSION['userData']['user_id'], $accion, $ipUser);
                    }
                        foreach ($_POST['idAc'] as $ids) 
                        {
                            $titulo=mysqli_real_escape_string($DB_conection, $_POST['tituloA'][$ids]);
                            $fecha=mysqli_real_escape_string($DB_conection, $_POST['fechaA'][$ids]);
                            $responsable=mysqli_real_escape_string($DB_conection, $_POST['responsable'][$ids]);

                            // Quitamos los participantes repetidos
                            $participantesB = array_unique($_POST['responsable']);
                            
                            // Convertimos el array en la cadena que se guardará en la DB
                            $participantesBD = implode(',', $participantesB); // De array a cadena
                    
                            $actualizar=$DB_conection->query("UPDATE acuerdos SET acuerdo_titulo='$titulo', acuerdo_fecha_entrega='$fecha',
                             acuerdo_responsable='$participantesBD' WHERE acuerdo_id='$ids'");
                        }
                        $accion = 10;
                        if ($actualizar > 1) {
                            $this->model->historial($_SESSION['userData']['user_id'], $accion, $ipUser);
                        }
        
                    $arrResponse = array('status' => true, 'msg' => 'La minuta y acuerdos se han actualizado correctamente');
                } else {
                    $arrResponse = array("status" => false, "msg" => 'No fue posible modificar la información de la DB');
                }
        
                echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
                die();
            }
        }
        
        
        
        

        public function setInvitado(){
            //dep($_POST);
            
            if($_POST){             
                if (empty($_POST['nombre']) || empty($_POST['email']) || empty($_POST['cargoI']) || empty($_POST['titulo']) ){
                    $arrResponse= array('status' => false, 'msg' => 'Todos los campos son obligatorios');
                }
                else if(strlen(trim($_POST['nombre'])) <8 ){   
                    $arrResponse= array('status' => false, 'msg' => 'Introduce el nombre completo del invitado');
                }
                else if(!esMail($_POST['email'])){
                    $arrResponse= array('status' => false, 'msg' => 'Escribe una dirección de correo valida');
                }
                else{
                    //declaracion de variables recibidas por POST
                    $strNombre =  ucwords(strtolower(strClean($_POST['nombre'])));
                    $strMail = strtolower(strClean($_POST['email']));
                    $intTipo = intval($_POST['listStatus']);
                    $intTitulo = intval($_POST['titulo']);
                    $intCargo = intval($_POST['cargoI']);

                    //se manda la peticion al metodo insert que revisara si el email ya esta registrado en la DB             
                    $request_inv = $this->model->insertInvitado($strNombre, $strMail, $intTipo, $intTitulo, $intCargo);
                    $accion= 27; //Registrar invitado;
                    $ipUser= $_SERVER['REMOTE_ADDR']; //se obtiene la ip del usuario para registrar desde donde se realizo la accion
                    
                    //mandamos respuesta 
                    if($request_inv >0){
                        $this->model->historial($_SESSION['userData']['user_id'], $accion, $ipUser);
                        $arrResponse = array('status' => true, 'msg' => 'El nuevo participante se ha agregado correctamente');
                    }
                    else if($request_inv == 0){
                        $arrResponse = array('status' => false, 'msg' => 'El correo electrÓnico ya esta registrado');
                    }
                    else{
                        $arrResponse = array("status" => false, "msg" => 'No fue posible agregar información a la DB');
                    }
                } //end else post
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            } //end if POST
            die();
        }//end function   
            
    } //end class