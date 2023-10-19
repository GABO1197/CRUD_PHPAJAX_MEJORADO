<?php
session_start();
if(!isset($_SESSION['S_ID'])){
  // header('Location: ../Login_v16/login.php');
  header('Location: ../Login/index.php');

}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">    
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/chart.min.css">
    <link rel="stylesheet" href="../css/Chart.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- <link rel="stylesheet" href="css/adminlte.min.css"> -->
    <link rel="stylesheet" href="../css/stilos.css">
    <link rel="stylesheet" href="../css/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../Datatables/DataTables-1.13.6/css/dataTables.bootstrap5.min.css">
    <!-- <link rel="stylesheet" href="Datatables/Buttons-2.4.2/css/buttons.bootstrap5.min.css"> -->
    <!-- <link href="https://cdn.datatables.net/v/ju/dt-1.13.6/af-2.6.0/b-2.4.2/r-2.5.0/sc-2.2.0/sl-1.7.0/datatables.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="../Datatables/datatables.min.css">
    <link rel="stylesheet" href="../js/select2/css/select2.min.css">
    <!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.jqueryui.min.css">
    <script src="https://code.jquery.com/jquery-1.7.1.min.js"></script> -->
    <!-- <script src="https://cdn.datatables.net/v/ju/dt-1.13.6/af-2.6.0/b-2.4.2/r-2.5.0/sc-2.2.0/sl-1.7.0/datatables.min.js"></script> -->
</head>
<style>
  .swal2-popup{
    font-size: 2rem !important;
  }
</style>
<body>
    <header>
        <div class="px-3 py-2  ">
          <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start" >
              <a href="principal.php" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
              <i class="fab fa-js fa-4x" style="color: #ffd500;"></i>
              </a>
              <ul class="nav  col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
              <li>
                  <a href="principal.php" class="nav-link text-secondary">
                    <svg class="bi d-block mx-auto mb-1"xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 576 512"width="24" height="24"><style>svg{fill:#00276b}</style><path d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg>
                    Home
                    
                  </a>
                </li>
            
            <?php
              include "menu/menu.php";
            ?>
                <li>
                  <a href="../php/cerrar_session.php" class="nav-link text-secondary">
                    <svg class="bi d-block mx-auto mb-1" width="24" height="24" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 640 512"><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H392.6c-5.4-9.4-8.6-20.3-8.6-32V352c0-2.1 .1-4.2 .3-6.3c-31-26-71-41.7-114.6-41.7H178.3zM528 240c17.7 0 32 14.3 32 32v48H496V272c0-17.7 14.3-32 32-32zm-80 32v48c-17.7 0-32 14.3-32 32V480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32V352c0-17.7-14.3-32-32-32V272c0-44.2-35.8-80-80-80s-80 35.8-80 80z"/></svg>
                    Cerrar Session
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
    </header>

    <div class="contenedor ">
      <div class="row boton_texto  gap-5 ">
          <h3>GAFICOS PRODUCTOS</h5>
          <div class="col-lg-2 ">
            <button  class="btn btn-primary" style="width:200px" onclick="AbrirmodalRegistro()"><i class="fa fa-plus-circle" aria-hidden="true"></i>Nuevo registro</button>
          </div>
          <div class="col-lg-2">
            <button  class="btn btn-primary" style="width:200px" onclick="AbrirmodalRegistroUsu()"><i class="fa fa-plus-circle" aria-hidden="true"></i>Nuevo Registro Usuario</button>
          </div>
      </div>
    </div> 
      

<div class="contenedor3" id="cargar_tablas">
 <!-- ACA VA LA TALBA TOTALIZADA  y graficos-->
 </div>

<div class="modal fade" id="modal_editar"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar productos</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <!-- <label for="">id</label> -->
                  <input type="text" class="form-control" id="txt_id" name="txtid" placeholder="id"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">producto</label>
                  <input type="text" class="form-control" id="txt_nombre_producto_editar" name="txt_nombre_editar" placeholder="Ingrese producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">catidad producto</label>
                  <input type="txt" class="form-control" id="txt_cantidad_producto_editar" name="txt_cantidad_editar" placeholder="catidad producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">cantidad stock</label>
                  <input type="txt" class="form-control" id="txt_cantidad_stok_producto_editar" name="txt_cantidad_stok_editar" placeholder="cantidad stock"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">venta cantidad</label>
                  <input type="txt" class="form-control" id="txt_venta_cantidad_editar" name="txt_venta_cantidad_editar" placeholder="venta cantidad "><br>
                </div>
                <div class="col-lg-12">
                <label for="">fecha registro</label>
                  <input type="date" class="form-control" id="txt_fecha_procuto_editar" name="txt_fecha_procuto_editar" placeholder="fecha registro"><br>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualizaproductos()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modal_registrar"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Registrar productos</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">producto</label>
                  <input type="text" class="form-control" id="txt_nombre_producto" name="txt_nombre_producto" placeholder="Ingrese producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">catidad producto</label>
                  <input type="txt" class="form-control" id="txt_cantidad_producto" name="txt_cantidad_producto" placeholder="catidad producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">cantidad stock</label>
                  <input type="txt" class="form-control" id="txt_cantidad_stok_producto" name="txt_cantidad_stok_producto" placeholder="cantidad stock"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">venta cantidad</label>
                  <input type="txt" class="form-control" id="txt_venta_cantidad" name="txt_venta_cantidad" placeholder="venta cantidad "><br>
                </div>
                <div class="col-lg-12">
                <label for="">fecha registro</label>
                  <input type="date" class="form-control" id="txt_fecha_procuto" name="txt_fecha_procuto" placeholder="fecha registro"><br>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="registroproductos()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>
<div class="modal fade" id="modal_registrar_user"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Registrar usuario</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
              
                <div class="col-lg-12">
                  <label for="">Nombre usuario</label>
                  <input type="text" class="form-control" id="txt_nombre" name="txt_nombre" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Telefono</label>
                  <input type="txt" class="form-control" id="txt_telefono" name="txt_telefono" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Contraseña</label>
                  <input type="password" class="form-control" id="txt_pass" name="txt_pass" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Email</label>
                  <input type="email" class="form-control" id="txt_email" name="txt_email" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Rol</label>
                  <select class="form-select" aria-label="Default select example" id="txt_rol"name="txt_rol" style="width: 100%;">
                  </select>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="registroUsuario()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>

<div class="modal fade" id="modal_editar_user"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar usuario</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">ID</label>
                  <input type="text" class="form-control" id="txt_id_editar_usu" name="txt_id_editar_usu"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Nombre usuario</label>
                  <input type="text" class="form-control" id="txt_nombre_editar" name="txt_nombre_editar" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Telefono</label>
                  <input type="txt" class="form-control" id="txt_telefono_editar" name="txt_telefono_editar" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Contraseña</label>
                  <input type="password" class="form-control" id="txt_pass_editar" name="txt_pass_editar" placeholder="pass"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Email</label>
                  <input type="email" class="form-control" id="txt_email_editar" name="txt_email_editar" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Rol</label>
                  <select class="form-select" aria-label="Default select example" id="txt_rol_editar"name="txt_rol_editar" style="width: 100%;">
                  </select>
                </div>
                <!-- <div class="col-lg-12">
                  <label for="">Estatus</label>
                  <input type="txt" class="form-control" id="txt_estatus_editar" name="txt_estatus_editar" placeholder="rol "><br>
                </div> -->
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualiza_user()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>

<div class="modal fade" id="registrar_modulo"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Crear modulo</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            
            <div class="modal-body">
                
                <div class="col-lg-12">
                  <label for="">Nombre Modulo</label>
                  <input type="text" class="form-control" id="txt_nombre_modulo" name="txt_nombre_modulo" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Posicion del Modulo</label>
                  <input type="txt" class="form-control" id="txt_posicion_modulo" name="txt_posicion_modulo" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">icono svg</label>
                  <!-- <input type="text" class="form-control" id="txt_icono" name="txt_icono" placeholder="icono"> -->
                  <textarea class="form-control" aria-label="With textarea" type="text" class="form-control" id="txt_icono" name="txt_icono" placeholder="icono"></textarea>
                  <br>
                </div>
                
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="crearmodulo()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>
</body>
<script>
  function cargar_contenido(contenedor,contenido){
      $("#"+contenedor).load(contenido);
    }
</script>
<!-- <script src="js/sweetalert2/sweetalert2.js"></script> -->
<script src="../js/sweetalert2/sweetaler2.js"></script>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/Chart.bundle.min.js"></script>
<script type="text/javascript" src="../js/chart.min.js"></script>
<script src="../js/Chart.bundle.js"></script>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js" integrity="sha512-7U4rRB8aGAHGVad3u2jiC7GA5/1YhQcQjxKeaVms/bT66i3LVBMRcBI9KwABNWnxOSwulkuSXxZLGuyfvo7V1A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../js/proceso.js"></script>
<script src="../Datatables/datatables.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- <script src="Datatables/DataTables-1.13.6/js/dataTables.bootstrap4.min.js"></script> -->
<script src="../Datatables/Buttons-2.4.2/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/select2/js/select2.min.js"></script>
<script>
  $(document).ready(function() {
    $('.js-example-basic-single').select2();
    listar_combo_rol();
});
  //  traerdatos();
  //  traerdatoshabilitado();
  //  traerdatosdeshabilitado();
    // informeacciones();
    // informeacciones_cargarauto();
    function AbrirmodalRegistro(){
    $('#modal_registrar').modal('show');
    }
    function AbrirmodalRegistroUsu(){
    $('#modal_registrar_user').modal('show');
    }
    function AbrirmodalCrearmodulo(){
    $('#registrar_modulo').modal('show');
    }
    
    // function drop(){
    //   $('#myDropdown').on('show.bs.dropdown');
    // }

</script>
</html>