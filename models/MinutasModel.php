<?php
    class MinutasModel extends Mysql{
        public $intIdUser;
        public $strFechaMin;
        public $strHoraMin;
        public $strHoraCMin;
        public $strLugar;
        public $strTituloMin;
        public $intUnidadAd;
        public $strDesarrollo;
        public $strParticipantes;
        public $strArchivo;
        public $strTituloA;
        public $strFechaA;
        public $intResponsable;
        public $intIdMinuta;

        public function __construct(){
            parent::__construct();
        }

       
        //los cargos, usuarios y titulos se consultan usando sus respectivos metodos llamadados desde el js minutas.js


        //guardar minuta
        public function insertMinuta(string $fechaMin, string $horaMin, string $horaCMin, string $lugar, string $tituloMin, 
        int $unidadAd, string $desarrollo, string $participantes, string $archivo,  int $idMinuta){
            $return ='';
            $this->strFechaMin = $fechaMin;
            $this->strHoraMin = $horaMin;
            $this->strHoraCMin = $horaCMin;
            $this->strLugar = $lugar;
            $this->strTituloMin = $tituloMin;
            $this->intUnidadAd = $unidadAd;
            $this->strDesarrollo = $desarrollo;
            $this->strParticipantes = $participantes;
            $this->strArchivo = $archivo !== null ? $archivo : '';
            $this->intIdMinuta = $idMinuta;
            $return=0;
            $sql ="SELECT minuta_id FROM minutas WHERE minuta_id=$this->intIdMinuta;";
            $request = $this->select_all($sql);
            
            if(empty($request)){
                $query_insert = "INSERT INTO minutas(minuta_fecha, minuta_hora, minuta_hora_cierre, minuta_lugar, minuta_titulo, minuta_unidad_admin, 
                minuta_desarrollo, minuta_participantes, minuta_archivo) VALUES(?,?,?,?,?,?,?,?,?);";
                $arrData = array($this->strFechaMin, $this->strHoraMin, $this->strHoraCMin, $this->strLugar, $this->strTituloMin, $this->intUnidadAd, 
                $this->strDesarrollo, $this->strParticipantes, $this->strArchivo);
                $request_insert= $this->insert($query_insert, $arrData);
                $return = $request_insert;
            }
            else{
                $return = 0;
            }
            return $return;
        }

        //consultar el ultimo id de minuta registrado
        public function selectIdMinuta(){
            $sql="SELECT MAX(minuta_id) AS id FROM minutas;";
            $request = $this->select($sql);
            return $request;
        }

        //consultar participantes para mostrar en  pantalla de minutas
        public function selectParticipantesC(){
            $sql="SELECT t.titulo_abr, p.participante_nom, p.participante_mail, 
            p.participante_id FROM participantes as p
            INNER JOIN titulos as t ON p.participante_titulo = t.titulo_id 
            INNER JOIN cargos as c ON p.participante_cargo = c.cargo_id WHERE participante_estado=1";
            $request = $this->select_all($sql);
            return $request;
        }

        //guardar acuerdos
        public function insertAcuerdo(string $tituloA, string $fechaA, int $responsable, int $idMinuta){
            $return ='';
            $this->strTituloA =$tituloA;
            $this->strFechaA =$fechaA;
            $this->intResponsable =$responsable;
            $this->intIdMinuta = $idMinuta;
            $return=0;

            $query_insert = "INSERT INTO acuerdos(acuerdo_titulo, acuerdo_fecha_entrega, acuerdo_responsable, acuerdo_minuta) VALUES(?,?,?,?);";
            $arrData = array($this->strTituloA, $this->strFechaA, $this->intResponsable, $this->intIdMinuta);
            $request_insert= $this->insert($query_insert, $arrData);
            $return = $request_insert;

            if($return){
                $return = 1;  
            }
            else{
                $return = 0;
            }
            return $return;
        }

        //se envia correo electronico
        public function sendMail(int $idPartcipante, int $idMinuta){
            $return ='';
            $this->intIdParticipante = $idParticipante;
            $this->intIdMinuta = $minuta;
        
            include_once 'helpers/DB_conection.php';

            /*DESTINATARIO*/
            $queryDestinario="SELECT participante_nom as nombre, participante_mail as mail FROM participantes WHERE participante_id=$this->intIdParticipante";
            $destinarios = $DB_conection->query($queryDestinatario);
            $destinatario = $destinarios->fetch_assoc();

            /*MINUTAS*/
            $queryMinuta="SELECT m.minuta_id, m.minuta_titulo as titulo, m.minuta_desarrollo as desarrollo, m.minuta_lugar as lugar, DATE_FORMAT(`minuta_fecha`,'%d/%m/%Y') as fecha , m.minuta_hora as hora, m.minuta_hora_cierre as hora_cierre, m.minuta_participantes as participantes,
                c.cargo_nom as unidad FROM minutas as m
                INNER JOIN cargos as c ON m.minuta_unidad_admin= c.cargo_id WHERE m.minuta_id=$this->intIdMinuta";
            $minutas = $DB_conection->query($queryMinuta);
            $minuta = $minutas->fetch_assoc();

            /*Acuerdos*/
            $queryAcuerdos ="SELECT a.acuerdo_id, a.acuerdo_titulo as titulo, DATE_FORMAT(a.acuerdo_fecha_entrega, '%d/%m/%Y') as fecha,
                p.participante_nom as nombre FROM acuerdos as a 
                INNER JOIN participantes as p ON a.acuerdo_responsable= p.participante_id
                WHERE acuerdo_minuta=$this->intIdMinuta;";
            $acuerdos = $DB_conection->query($queryAcuerdos);

            $asunto='Información sobre la minuta: ' .$minuta['titulo'];
            $infoMinuta='Hola! '. $destinatario['nombre']. ' se te ha agregado como participante de la siguiente minuta: <br/>'
                .'<b>INFORMACIÓN DE LA MINUTA</b> <br/>'
                .'<b>Titulo: </b>'.$minuta['titulo']. ' <br/>'
                .'<b>Lugar: </b>'.$minuta['lugar']. ' <br/>'
                .'<b>Fecha: </b>'.$minuta['fecha']. ' <br/>'
                .'<b>Hora apertura: </b>'.$minuta['hora']. '<b> / Hora de cierre: </b>' .$minuta['hora_cierre'] .'<br/>'
                .'<b>Desarrollo de la minuta: </b><br/>'
                .$minuta['desarrollo'] .'<br/>'
                .'<b>ACUERDOS Y COMPROMISOS</b> <br/>';

            //sacar acuerdos y compromisos
            foreach ($acuerdos as $acuerdo){
                $infoAcuerdos='';
                $infoAcuerdos.='<b>Acuerdo: </b>' .$acuerdo['titulo']. '<br/>'
                .'<b>Responsable: </b>' .$acuerdo['nombre'] .'<br/>'
                .'<b>Fecha Entrega. </b>' .$acuerdo['fecha'] .'<br/>||||||||||||||||||||||||||||||||||||||||||||||||||<br/>';
            } 

            //sacar los participantes
            $arrPart = explode(',', $minuta['participantes']);
            foreach ($arrPart as $participante){
                $printR='';
                $serv='query'.$participante;
                $serv="SELECT p.participante_nom as nombre, c.cargo_nom as cargo, t.titulo_abr as titulo
                    FROM participantes as p
                    INNER JOIN titulos as t ON p.participante_titulo = titulo_id
                    INNER JOIN cargos as c ON p.participante_cargo= cargo_id
                    WHERE participante_id=$participante";
                $info = $DB_conection->query($serv);
                $user = $info->fetch_assoc();
                $printR.= "<b>". $user['titulo']. " ".  $user['nombre']. "</b><br/>".$user['cargo'];                                                 
            } 

            //mensaje completo para enviar correo
            $mensaje= $infoMinuta .$infoAcuerdos .$printR;

            if($mail && $nombre){
                $mensaje="Hola $nombre: <br/>Se te informa que se te agregado como participante l sig enlace: <a href='$url'>Click Aqui</a>";
                enviarMail($destinatario['mail'], $destinatario['nombre'], $asunto, $mensaje);
            }
        }
            

        //guardar invitado
        public function insertInvitado(string $nombre, string $mail, int $tipo, int $titulo, int $cargo){
            $return ='';
            $this->strNombre = $nombre;
            $this->strMail = $mail;
            $this->intTipo = $tipo;
            $this->intTitulo = $titulo;
            $this->intCargo = $cargo;
            $return=0;

            $sql ="SELECT participante_mail FROM participantes WHERE participante_mail='$this->strMail';";
            $request = $this->select_all($sql);
            
            if(empty($request)){
                $query_insert = "INSERT INTO participantes(participante_nom, participante_mail, participante_tipo, participante_titulo, participante_cargo) VALUES(?,?,?,?,?);";
                $arrData = array($this->strNombre, $this->strMail, $this->intTipo, $this->intTitulo, $this->intCargo);
                $request_insert= $this->insert($query_insert, $arrData);
                $return = $request_insert;
            }
            else{
                $return = 0;
            }
            return $return;
        }

         //registrar accion hecha
         public function historial(int $idUser, int $idAccion, string $ipUser){
            $return ='';
            $this->intIdUser =$idUser;
            $this->intIdAccion =$idAccion;
            $this->strIpUser =$ipUser;
            $return=0;

            $query_insert = "INSERT INTO historial(hist_user, hist_accion, hist_ip) VALUES(?,?,?);";
            $arrData = array($this->intIdUser, $this->intIdAccion, $this->strIpUser);
            $request_insert= $this->insert($query_insert, $arrData);
            $return = $request_insert;

            if($return){
                $return = 1;  
            }
            else{
                $return = 0;
            }
            return $return;
        }
    }
?>