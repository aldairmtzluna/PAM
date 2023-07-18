<?php
    class CargosModel extends Mysql{
        public $intIdCargo;
        public $strCargo;
        public $intTipo;

        public function __construct(){
            parent::__construct();
        }

        //consultar todos los cargos de la DB
        public function selectCargos(){
            $sql="SELECT * FROM cargos";
            $request = $this->select_all($sql);
            return $request;
        }
        //consultar todos los cargos internos de la DB
        public function selectCargosUtic(){
            $sql="SELECT * FROM cargos WHERE cargo_tipo = 1";
            $request = $this->select_all($sql);
            return $request;
        }
        //consultar cargo de usuario
        public function selectCargo(int $idcargo){
            $this->intIdCargo = $idcargo;
            $sql="SELECT * FROM cargos WHERE cargo_id = $this->intIdCargo";
            $request = $this->select($sql);
            return $request;
        }

        //guardar cargos
        public function insertCargo(string $cargo, int $tipo){
            $return ='';
            $this->strCargo =$cargo;
            $this->intTipo =$tipo;
            $sql ="SELECT * FROM cargos WHERE cargo_nom='{$this->strCargo}';";
            $request = $this->select_all($sql);
            
            if(empty($request)){
                $query_insert = "INSERT INTO cargos(cargo_nom, cargo_tipo) VALUES(?,?);";
                $arrData = array($this->strCargo, $this->intTipo);
                $request_insert= $this->insert($query_insert, $arrData);
                $return = $request_insert;
            }
            else{
                $return = 0;
            }
            return $return;
        }

        //actualizar registro 
        public function updateCargo(int $idcargo, string $cargo, int $tipo){
            $this->intIdCargo = $idcargo;
            $this->strCargo = $cargo;
            $this->intTipo = $tipo;
            $sql="SELECT * FROM cargos WHERE cargo_nom= '$this->strCargo' AND cargo_id != $this->intIdCargo";
            $request=$this->select_all($sql);

            if(empty($request)){
                $sql="UPDATE cargos SET cargo_nom =?, cargo_tipo= ? WHERE cargo_id= $this->intIdCargo";
                $arrData= array($this->strCargo, $this->intTipo);
                $request= $this->update($sql, $arrData);
            }
            else{
                $request= 0;
            }
            return $request;
        }

        //borrar rol
        public function deleteCargo(int $idcargo){
            $this->intIdCargo = $idcargo;
            $sql ="SELECT user_rol FROM usuarios WHERE user_rol= $this->intIdCargo";
            $request= $this->select_all($sql);
            if(empty($request)){
                $sql = "UPDATE cargos SET rol_estado=? WHERE cargo_id= $this->intIdCargo";
                $arrData = array(2);
                $request= $this->update($sql, $arrData);
                if($request){
                    $request=1;
                }
                else{
                    $request=2;
                }
            }
            else{
                $request= 0;
            }
            return $request;
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