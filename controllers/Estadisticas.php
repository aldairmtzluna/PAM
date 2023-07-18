<?php
    class Estadisticas extends Controllers{
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

        public function estadisticas ($params) {
            $data['page_id'] = 'p_estadisticas';
            $data['page_title'] = '.:Estadisticas de oficios:.';
            $data['page_tag'] = 'estadisticas_oficios';
            $data['page_name'] = 'Estadisticas de oficios';
            $data['page_scripts']='<script src="'.assets().'js/estadisticas-tab.js"></script>';
            $this->views->getView($this, 'estadisticas', $data);
        }
    }

    