<?php
    class Login extends Controllers{
        public function __construct(){
            //verificamos que si se ha iniciado sesion se muestr el portal
            session_start();
            if(isset($_SESSION['login'])){
               //Obten el valor de $SERVER['HTTP_HOST]
               $host = $_SERVER['HTTP_HOST'];

               //Contruye la url de la redirección con la variable incluida
               $url = "http://" .$host;
                header('location:' .$url.'/PAM/portal');
            }
            parent::__construct();
        }

        public function login ($params){
            $data['page_id'] = 'p_login';
            $data['page_title'] = '.:Inicio Sesión:.';
            $data['page_tag'] = 'Home';
            $data['page_name'] = 'home';
            $this->views->getView($this, 'login', $data);
        }

        public function loginUser(){
            //dep($_POST);
            if($_POST){
                if(empty($_POST['usuario']) || empty($_POST['password'])){
                    $arrResponse = array('status' => false, 'msg' => 'Introduce tu E-mail y contraseña');
                }
                else{
                    $strUser = strtolower(strClean($_POST['usuario']));
                    $strPass = $_POST['password'];
                    $requestUser = $this->model->loginUser($strUser, $strPass);
                    //dep($requestUser);
                    switch($requestUser){
                        case 0:
                            $arrResponse= array('status' => false, 'msg' => 'El E-mail no esta asociado a ningun usuario.');
                            break;

                        case 1:
                            //se inician las variables de sesión
                            $requestSession = $this->model->varSessions($strUser);
                            $arrData = $requestSession;
                            if($arrData['user_estado']==1){
                                $_SESSION['idUser'] = $arrData['user_id'];
                                $_SESSION['user_nom'] = $arrData['user_nom'];
                                $_SESSION['user_ap'] = $arrData['user_ap'];
                                $_SESSION['user_am'] = $arrData['user_am'];
                                $_SESSION['user_unidad'] = $arrData['user_unidad'];
                                $_SESSION['user_cargo'] = $arrData['user_cargo'];
                                $_SESSION['user_rol'] = $arrData['user_rol'];
                                $_SESSION['user_mail'] = $arrData['user_mail'];
                                $_SESSION['login'] = true;
                                //Generamos una variable de sesion con los datos del usuario para usarlos
                                $requestData = $this->model->sessionData($arrData['user_id']);
                                $_SESSION['userData'] = $requestData;     
                                $arrResponse= array('status' => true, 'msg' => 'Bienvenido');
                            }                           
                            break;

                        case 2:
                            $arrResponse= array('status' => false, 'msg' => 'Contraseña incorrecta');
                            break;

                        case 3:
                            $arrResponse= array('status' => false, 'msg' => 'Esta cuenta de usuario se encuentra inactiva');
                            break;

                        default:
                            $arrResponse= array('status' => false, 'msg' => 'Todo lo que pudo fallar ha fallado');
                            break;
                    }                    
                }
                echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
            }
            die();
        }
    }
?>