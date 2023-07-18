<?php
    class Portal extends Controllers{
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

        public function portal ($params){
            $data['page_id'] = 'p_portal';
            $data['page_title'] = '.:Portal PAM-SICT:.';
            $data['page_tag'] = 'Portal';
            $data['page_name'] = 'portal';
            $this->views->getView($this, 'portal', $data);
        }
    }
?>