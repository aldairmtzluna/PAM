<?php
    class Minutas extends Controllers{
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

        public function minutas ($params){
            $data['page_id'] = 'p_minutas';
            $data['page_title'] = '.:Crear Minuta:.';
            $data['page_tag'] = 'minutas';
            $data['page_name'] = 'Crear Minuta';
            $data['page_scripts']='<script src="'.assets().'js/minutas.js"></script><script type="text/javascript" src="'.assets().'js/plugins/bootstrap-select.min.js"></script>'; 
            $this->views->getView($this, 'minutas', $data);
        }

        //obtener el ultimo id de la minuta
        public function getIdMinuta(){
			$idMin ='';
            $arrData= $this->model->selectIdMinuta();
            if(count($arrData) > 0){
                    $idMin .='<input type="hidden" id="idMin" name="idMin" value="'.$arrData['id']+1 .'"/>';
            }
            echo $idMin;
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

        public function setMinuta(){
            //dep($_POST);
            
            if($_POST){
                //Revalidación de los datos enviados
                #REvisamos que los datos del  formulario esten completos
                if (empty($_POST['fechaMin']) || empty($_POST['hora']) || empty($_POST['horaC']) || empty($_POST['lugar']) || empty($_POST['tituloMin']) || empty($_POST['cargo']) || empty($_POST['observacion']) || empty($_POST['tituloA']) || empty($_POST['fechaA']) || empty($_POST['responsable']) ){
                    $arrResponse= array('status' => false, 'msg' => 'Todos los campos son obligatorios');
                }
                else{
                    //declaracion de variables recibidas por POST
                    $strFechaMin =  $_POST['fechaMin'];
                    $strHora = $_POST['hora'];
                    $strHoraC = $_POST['horaC'];
                    $strLugar =  $_POST['lugar'];
                    $strTituloMin = $_POST['tituloMin'];
                    $intUnidadAd = intval($_POST['cargo']);
                    $strDesarrollo = $_POST['observacion'];
                    $strTitulosA = $_POST['tituloA'] ;
                    $strFechasA = $_POST['fechaA'];
                    $strResponsables = $_POST['responsable'];
                    $intIdMinuta = intval($_POST['idMin']);
 //CREACIÓN DE CARPETA DE MINUTAS 
 $urlDB = '';
 //variables para conseguir año y mes y hacer directorios
 $anho=strftime('%Y');
 $mes= ['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'][date('n')-1];

 //Subir la prueba al servidor
 //restringimos que solo queremos documentos con extension pdf
 $extension = array('application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.openxmlformats-officedocument.presentationml.presentation');
 //convertir bytes a Unidades de almacenamiento de archivo
 $TB = pow(1024, 4);  // = 1TB en bytes
 $GB = pow(1024, 3);  // = 1GB en bytes
 $MB = pow(1024, 2);  // = 1MB en bytes
 //ponemos el limite máximo que debe pesar cada archivo en MB
 $docSize= $MB * 5;
 $p=1;

 //verificamos los archivos y evitamos que suba cualquier documento si alguno pesa mas de 50MB
 foreach ($_FILES['archivoOficio']['tmp_name'] as $key => $value){
     if($_FILES['archivoOficio']['size'][$key] > $docSize){
         $arrResponse = array('status' => false, 'msg' => 'La prueba no puede pesar más de 50MB');
         echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
         exit();
     }
 }

 //volvemos a recorrer el $_files ahora para guardar la minuta
 foreach ($_FILES['archivoOficio']['tmp_name'] as $key => $value){
 /*Validamos que el archivo exista
     if($_FILES['archivoOficio']['error'][$key]>0 ){
         //mandamos un mensaje notificando que se envio el formulario sin cargar ninguna minuta
         $arrResponse = array('status' => false, 'msg' => 'ERROR No seleccionaste ningún archivo');
         echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
         exit();
     }*/
     if(in_array($_FILES['archivoOficio']['type'][$key], $extension)){  
         $root='../PAM/resources/';                    //regresamos al directorio raiz
         $oficiosDir=$root.'minutas';    //Creamos la carpeta oficios en la carpeta raiz si no existe
         if(!is_dir($oficiosDir)){
             mkdir($oficiosDir);
         }
         $idDir=$oficiosDir.'/'.$_SESSION['userData']['user_id'].'/';     //Creamos la carpeta del usuario si no existe
         if(!is_dir($idDir)){
             mkdir($idDir);
         }
         $anhoDir=$oficiosDir.'/'.$_SESSION['userData']['user_id'].'/'.$anho;   //Creamos la carpeta del año en curso
         if(!is_dir($anhoDir)){
             mkdir($anhoDir);
         }
         $urlDir=$oficiosDir.'/' .$_SESSION['userData']['user_id'] .'/'.$anho. '/'.$mes.'/';    //Creamos la carpeta del mes del año en curso
         if(!is_dir($urlDir)){
             mkdir($urlDir);
         }
         //NOMBRE DEL ARCHIVO MINUTA
         $txt = 'minuta';
         $fecha = date('d-m-y'); 
         $random = rand(99999, 999999999);
         //Extraemos la extension del oficio
         $ext = pathinfo($_FILES['archivoOficio']['name'][$key], PATHINFO_EXTENSION);
         $urlDoc =$urlDir.$fecha.'_'.$random. $txt.'.'.$ext;
     
         if(!file_exists($urlDoc)){
             $oficioUrl=@move_uploaded_file($_FILES['archivoOficio']['tmp_name'][$key], $urlDoc);    
             $urlDB .= ',resources/minutas/'.$anho.'/'.$mes.'/'.$fecha.''.$random. $txt.'.'.$ext;

         }
     }

     
     /*else{
         $arrResponse = array('status' => false, 'msg' => 'Extensión no valida: Solo se acepta archivo Word, Excel, Power Point o PDF'); 
         echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
         exit();               
     }*/
 } //fin Foreach
/*if($urlDB){
$request_min = $this->model->insertMinuta($strFechaMin, $strHora, $strHoraC, $strLugar, $strTituloMin, $intUnidadAd, $strDesarrollo, $participantesDB, $intIdMinuta, $urlDB);
$accion= 4; //Crear minuta;
$ipUser= $_SERVER['REMOTE_ADDR']; //se obtiene la ip del usuario para registrar desde donde se realizo la accion


 //Revisar, para mostrar el archvio que se subioejemplo en oficio...
/* if($urlDB){
     $request_ofi = $this->model->insertOficio($_SESSION['userData']['user_id'], $intIdDestinatario, $intIdCargoD, $intIdEmpD, $intIdRemitente, $intIdCargoR, $intIdEmpR, $strFechaElab, $strFechaRecep, $strAsunto, $strNumOfi, $strObservacion, $urlDB, $intIdOficio);
     $ipUser= $_SERVER['REMOTE_ADDR']; //se obtiene la ip del usuario para registrar desde donde se realizo la accion
     $accion= 51; //subir oficio
 }*/ 
                    //manipulacion de array de responsables para obtener los participantes
                    //quitamos los participantes repetidos
                    $participantes = array_unique($_POST['responsable']);

                    //convertimos el array en la cadena que se guardara en la DB
                    $participantesDB = implode(',', $participantes); //De array a cadena

                    //$participantes = json_encode($_POST['responsable']); //De array a cadena en json

                    //Se envia el mail a los paticipantes de la minuta
                    //for($p=0; $p<sizeof($participantes); $p++){
                    //    $this->model->sendMail($participantes[$p], $intIdMinuta);          
                    //} //end

                    if (!empty($_FILES['archivoOficio']['name'][0])) {
                        // Se ha seleccionado un archivo, así que se guarda el primer archivo seleccionado
                         //NOMBRE DEL ARCHIVO MINUTA
                        $txt = 'minuta';
                        $fecha = date('d-m-y'); 
                        $random = rand(99999, 999999999);
                        //Extraemos la extension del oficio
                        $ext = pathinfo($_FILES['archivoOficio']['name'][$key], PATHINFO_EXTENSION);
                        $urlDoc = $fecha.'_'.$random. $txt.'.'.$ext;
                        // También puede verificar si el tamaño del archivo es mayor a cero antes de llamar a la función insertMinuta()
                    } else if (!empty($_POST['archivoOficioVacio'])) {
                        // No se ha seleccionado ningún archivo, así que se pasa un valor vacío a la función insertMinuta()
                        $urlDoc = '';
                    }
                    //se manda la peticion al metodo insert que revisara si el email ya esta registrado en la DB             
                    $request_min = $this->model->insertMinuta($strFechaMin, $strHora, $strHoraC, $strLugar, $strTituloMin,
                    $intUnidadAd, $strDesarrollo, $participantesDB, $urlDoc, $intIdMinuta);
                    $accion= 4; //Crear minuta;
                    $ipUser= $_SERVER['REMOTE_ADDR']; //se obtiene la ip del usuario para registrar desde donde se realizo la accion
                    
                    //mandamos respuesta 
                    if($request_min > 1){
                        $this->model->historial($_SESSION['userData']['user_id'], $accion, $ipUser);
                        $arrResponse = array('status' => true, 'msg' => 'La minuta y acuerdos se han agregado correctamente'
                    );
                        for($i=0; $i<sizeof($strTitulosA); $i++){
                           $this->model->insertAcuerdo($strTitulosA[$i], $strFechasA[$i], $strResponsables[$i], $intIdMinuta);
                           $accion= 9;  //crearAcuerdo
                           $this->model->historial($_SESSION['userData']['user_id'], $accion, $ipUser);
                        } //end
                    }
                    else if($request_min == 0){
                        $arrResponse = array('status' => false, 'msg' => 'Extensión no valida: Solo se acepta archivo Word, Excel, Power Point o PDF');
                    }
                    else{
                        $arrResponse = array("status" => false, "msg" => 'No fue posible agregar información a la DB ');
                    }
                } //end else post
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            } //end if POST
            die();
        }//end function archivoOficio[]

        public function setInvitado(){
            //dep($_POST);
            
            if($_POST){
                //Revalidación de los datos enviados
                #REvisamos que los datos del  formulario esten completos
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