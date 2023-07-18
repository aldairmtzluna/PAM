<?php
    class ListaMin extends Controllers{
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

        public function listaMin ($params){
            $data['page_id'] = 'p_listaMin';
            $data['page_title'] = '.:Lista Minutas:.';
            $data['page_tag'] = 'lista minutas';
            $data['page_name'] = 'Lista Minutas';
            $data['page_scripts']='<script src="'.assets().'js/minutas-tab.js"></script><script type="text/javascript" src="'.assets().'js/plugins/bootstrap-select.min.js"></script>';
            $this->views->getView($this, 'listaMin', $data);
        }

        //mostrar todas las minutas de la DB
        public function getMinutas(){
            $arrData = $this->model->selectMinutas();
            //dep($arrData);
            for($i=0; $i<count($arrData); $i++){
                if($arrData[$i]['estado']==1){
                    $arrData[$i]['estado'] = '<span class="badge">Minuta Activa <img src="'.assets().'img/icons/1.png" width="15"></span>';
                }
                
                $arrData[$i]['minuta_actions'] ='<div class="text-center"> 
                                                        <a href="libraries/pdfgen/crearpdf.php?idMin='.$arrData[$i]['id']. '" title="GENERAR PDF" role="button" class="btn btn-default bMakeMinPDF"  rl="'.$arrData[$i]['id'].'"><img src="'.assets().'img/icons/pdf.png" width="25"></a>
                                                        <a href="minutaPdf?id='.$arrData[$i]['id']. '" target="_blank" title="VER MINUTA" role="button" class="btn btn-default bVerMin" rl="'.$arrData[$i]['id'].'"><span class="glyphicon glyphicon-eye-open"></span></a>
                                                        <a href="editarMin?id='.$arrData[$i]['id']. ' " target="_blank" title="EDITAR MINUTA" role="button" class="btn btn-default bEditMin" rl="'.$arrData[$i]['id'].'"><span class="glyphicon glyphicon-pencil"></span></a>
                                                        '//<a data-toggle="modal" data-target="#minuta" title="EDITAR MINUTA" role="button" class="btn btn-default bEditMin" rl="'.$arrData[$i]['id'].'"><span class="glyphicon glyphicon-pencil"></span></a>
                                                        //<button title="BORRAR USUARIO" role="button" class="btn btn-default bDelMin" rl="'.$arrData[$i]['id'].'"><span class="glyphicon glyphicon-trash"></span></button>
                                                    .'</div>';
            }

            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
            die();
        }

    } //end class
?>