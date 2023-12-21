<script>
  function cargar_contenido(contenedor,contenido){
      $("#"+contenedor).load(contenido);
    }
</script>
<!-- <script src="js/sweetalert2/sweetalert2.js"></script> -->
<script src="../js/sweetalert2/sweetaler2.js"></script>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<!-- <script type="text/javascript" src="../js/Chart.bundle.min.js"></script> -->
<!-- <script src="../js/chart.min.js"></script> -->
<script src="../js/chart.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
<script src="../js/Chart.bundle.js"></script>
<!-- <script src="../js/jquery.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js" integrity="sha512-7U4rRB8aGAHGVad3u2jiC7GA5/1YhQcQjxKeaVms/bT66i3LVBMRcBI9KwABNWnxOSwulkuSXxZLGuyfvo7V1A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="../js/proceso.js"></script>
<script src="../js/menu.js"></script>
<script src="../js/dropdown_perfil.js"></script>
<script src="../Datatables/datatables.min.js"></script>
<!-- <script src="../js/bootstrap.min.js"></script> -->
<!-- <script src="../js/bootstrap-5.3.2.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<!-- <script src="Datatables/DataTables-1.13.6/js/dataTables.bootstrap4.min.js"></script> -->
<script src="../Datatables/Buttons-2.4.2/js/buttons.bootstrap4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
  </script>
<script src="../js/select2/js/select2.min.js"></script>


<script src="../js/jquery-knob/jquery.knob.min.js"></script>
<!-- <script src="../js/sparklines/sparkline.js"></script> -->
<script>
  nueva_graf();
      graficos_sm();
      graf_animado();
  $(document).ready(function() {
    // $('.js-example-basic-single').select2();
    listar_combo_rol();
});
  
    function AbrirmodalRegistro(){
    $('#modal_registrar').modal('show');
    }
    function AbrirmodalRegistroUsu(){
    $('#modal_registrar_user').modal('show');
    }
    function AbrirmodalCrearmodulo(){
    $('#registrar_modulo').modal('show');
    }
    function AbrirmodalCrearopcion(){
      $('#registrar_opcion').modal('show');
    }
    
  

</script>