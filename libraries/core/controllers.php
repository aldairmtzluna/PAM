<?php
    class Controllers{
        public function __construct(){
            $this->views = new Views();
            $this->loadModel();
        }

        public function loadmodel(){
            $model = get_class($this). 'model';
            $routClass = 'models/'. $model. '.php';

            if(file_exists($routClass)){
                require_once($routClass);
                $this->model = new $model();
            }
        }
    }
?>