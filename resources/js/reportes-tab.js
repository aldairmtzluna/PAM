
var tableReportes;
document.addEventListener('DOMContentLoaded', function(){
    tableReportes =$('#table-reportes').dataTable({
        'aProcessing' : true,
        'aServerSide': true,
        'language':{
            //'url': 'https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json'
            'lengthMenu': 'Ver _MENU_ regs. por pag.',
            'info': 'página _PAGE_ de _PAGES_',
            'infoEmpty': 'No se encontraron resultados',
            'infoFiltered': '(filtrada de _MAX_ regs.',
            'loadingRecords': 'Cargando...',
            'processing': 'Procesando...',
            'search': '<span class="glyphicon glyphicon-search"></span> Buscar ',
            'zeroRecords': 'No se encontraron registros que coincidan con tu busqueda :(',
            'paginate': {
                'next': 'Sig.',
                'previous': 'Ant.'
            }
        },
        'ajax': {
            'url': ' '+base_url+'listaRep/getReportes',
            'dataSrc': ''
        },
        //columnas de la tabla 
        'columns': [
            {'data':'titulo'},
            {'data':'fecha'},
            {'data':'receptor'},
            {'data':'estado'},
            {'data':'minuta_actions'}
        ],
        'resonsieve': 'true',
        'bDestroy': true,
        'iDisplayLength': 10
    }); 

    //validacion del formulario y que el campo de User no sea menor a 5 letras y mayor a 15
    var formUser = document.querySelector("#formUser");
    formUser.onsubmit = function(e) {
        e.preventDefault();
        //Declaracion de variables del formulario
        var strNombre = document.querySelector('#tNombre').value;
        var strAp_p = document.querySelector('#tApe_p').value;
        var strAp_m = document.querySelector('#tApe_m').value;
        var strMail = document.querySelector('#tMail').value;

        var minimo =3;
        var limite = 15;
        if(strNombre== '' || strAp_p== '' || strAp_m== '' ||strMail==''){    
            Swal.fire({
                width: '35%',
                icon: 'error',
                title: '<h3>Oops...</h3>',
                html: '<h4>Todos los campos son obligraorios</h4>',
                confirmButtonColor: '#13322B',
                confirmButtonText: '<h5>Aceptar</h5>'
            });
            return false;
        }

        let elementsValid = document.getElementsByClassName('.valid');
        for(let i=0; i<elementsValid.length; i++){
            if(elementsValid[i].classList.contains('.form-control-error')){
                Swal.fire({
                    width: '35%',
                    icon: 'error',
                    title: '<h3>Oops...</h3>',
                    html: '<h4>La información en los campos no es la apropiada</h4>',
                    confirmButtonColor: '#13322B',
                    confirmButtonText: '<h5>Aceptar</h5>'
                });
                return false;
            }
        }
    }   //end function(e){       
});

$('#table-reportes').DataTable();

window.addEventListener('load', function(){
    fntEditRep();
    fntDelRep();

}, false);


//funcion para editar la informacion de usuario
function fntEditRep(){
    var btnEditRep = document.querySelectorAll('.bEditRep');
    btnEditRep.forEach(function(btnEditRep){
        btnEditRep.addEventListener('click', function(){
            //mostrar la informacion del User por su idUser
            var idReporte = this.getAttribute('rl');
            var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            var ajaxUrl = base_url+'editarRep/getReporte/'+idReporte;
            request.open('GET', ajaxUrl, true);
            request.send();
        });
    });
}

//borrar User
function fntDelRep(){
    var btnDropUser = document.querySelectorAll('.bDelUser');
    btnDropUser.forEach(function(btnDropUser){
        btnDropUser.addEventListener('click', function(){
            var idUser = this.getAttribute('rl');
            Swal.fire({
                width: '35%',
                reverseButtons: true,        
                heightAuto: true,
                footer: '<label class="barraTitle">Eliminar Usuario</label>',
                html: '<h5 class="acomodoText top-espacio">¿Deseas inactivar a este usuario? <br/>Al hacer esto el usuario no podrá iniciar sesión.</h5>',
                showCancelButton: true,
                cancelButtonText: '<span class="glyphicon glyphicon-remove-sign"></span> Cancelar',
                confirmButtonText: '<span class="glyphicon glyphicon-ok-sign"></span> Aceptar',
                customClass: {
                    confirmButton: 'btn btn-primary espacio',
                    cancelButton: 'btn btn-default espacio'
                  },
                  buttonsStyling: false
            }).then((result) => {
                if(result.isConfirmed){
                    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                    var ajaxUrl = base_url+'usuarios/delUser/';
                    var strData ='idUser='+idUser;
                    request.open("POST", ajaxUrl, true);
                    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    request.send(strData);
                    request.onreadystatechange = function(){
                        if(request.readyState == 4 && request.status == 200){
                            var objData= JSON.parse(request.responseText);
                            if(objData.status){
                                Swal.fire({
                                    width: '35%',
                                    icon:'success',
                                    title: '<h3>Listo!</h3>',
                                    html: '<h4>'+objData.msg+'</h4>',
                                    confirmButtonColor: '#13322B',
                                    confirmButtonText: '<h5>Aceptar</h5>'
                                });
                                tableUsuarios.api().ajax.reload(function(){
                                    fntEditRep();
                                    fntDelRep();
                                    
                                });
                                //alert('cuaja '+ajaxUrl+strData);
                            }
                            else{
                                Swal.fire({
                                    width: '35%',
                                    icon: 'error',
                                    title: '<h3>Oops...</h3>',
                                    html: `<h4>`+objData.msg+'</h4>',
                                    confirmButtonColor: '#13322B',
                                    confirmButtonText: '<h5>Aceptar</h5>'
                                });
                            }//end objSatus
                        }//end request
                    }
                }
            });//end then
        });
    });
}