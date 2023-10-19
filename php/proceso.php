<?php 
require_once('conexion.php');
/////////////////////////funcion para buscar grafica por fecha
    if ($_POST['NombreProceso'] == "REPORTEETAPASACCIONES")
  {
    $fecha1=$_POST["fecha1"];
     $fecha2=$_POST["fecha2"];
     $etapas=$_POST["etapas"];
     if($_POST["fecha1"]!="" && $_POST["fecha2"]!="")
     {
     $fecha1=date('Y-m-d H:i:s',strtotime($_POST["fecha1"]));
     $fecha2=date('Y-m-d H:i:s',strtotime($_POST["fecha2"]));
    //  $condicion=" and fecha between '".$fecha1."' and '".$fecha2."'";
     }
     //  echo $estado;
     $sqlr="CALL SP_DATOSGRAFICO_PARAMETRO('$fecha1','$fecha2')";
    //  echo $sqlr;
    $campos=array();
     if ($Resultado = $conexion->query($sqlr)) {
        while ($fila = $Resultado->fetch_array()) {
        $campos[]=$fila;
        }
        echo json_encode($campos);
        }
        else
         {
           echo "ERROR";
         }
  }

//////////////////////////777traer todos los datos de la bd grafica auto
    if ($_POST['NombreProceso'] == "REPORTEETAPASACCIONES_auto")
    {
        $sql="SELECT
        productos.id, 
        productos.nombre, 
        productos.cantidad, 
        productos.stok, 
        productos.p_estatus,
        venta.venta_id, 
        venta.producto_id, 
        venta.vanta_cantidad, 
        venta.venta_fecharegistro
      FROM
        graficos.venta
        INNER JOIN
        graficos.productos
        ON 
        venta.venta_id = productos.id
        WHERE venta.venta_fecharegistro >= '2023-01-1' 
        AND venta.venta_fecharegistro <= '2023-12-31'
        AND venta.v_estatus=1 AND productos.p_estatus=1";
        //  echo $sqlr;
        $campos=array();
        if ($Resultado = $conexion->query($sql)) {
            while ($fila = $Resultado->fetch_assoc()) {
            $campos[]=$fila;
            }
            echo json_encode($campos);
            }
            else
            {
              echo "ERROR";
            }
    }


    ///////////////////////////datablegeneral
    if ($_POST['NombreProceso'] == "CARGARDATOS")
    {
      $sql="SELECT productos.id,  productos.nombre, productos.cantidad,  productos.stok, 
      productos.p_estatus, venta.venta_id, venta.producto_id, venta.vanta_cantidad, 
      venta.venta_fecharegistro,venta.fecha_v,productos.fecha_p FROM graficos.venta  INNER JOIN
      graficos.productos ON  venta.venta_id = productos.id  WHERE venta.venta_fecharegistro >= '2023-01-1' 
      AND venta.venta_fecharegistro <= '2023-12-31'";
      //  echo $sqlr;
      $campos=array();
      if ($Resultado = $conexion->query($sql)) {
          while ($fila = $Resultado->fetch_assoc()) {
          $campos[]=$fila;
          }
          echo json_encode($campos);
          }
          else
          {
            echo "ERROR";
          }
    }
    // datatable habilitados
    if ($_POST['NombreProceso'] == "CARGARDATOSHABILITADOS")
    {
      $sql="SELECT productos.id,  productos.nombre, productos.cantidad,  productos.stok, 
      productos.p_estatus, venta.venta_id, venta.producto_id, venta.vanta_cantidad, 
      venta.venta_fecharegistro, venta.v_estatus FROM graficos.venta  INNER JOIN
      graficos.productos ON  venta.venta_id = productos.id  WHERE venta.venta_fecharegistro >= '2023-01-1' 
      AND venta.venta_fecharegistro <= '2023-12-31' AND venta.v_estatus=1 AND productos.p_estatus=1" ;
      //  echo $sqlr;
      $campos=array();
      if ($Resultado = $conexion->query($sql)) {
          while ($fila = $Resultado->fetch_assoc()) {
          $campos[]=$fila;
          }
          echo json_encode($campos);
          }
          else
          {
            echo "ERROR";
          }
    }

    // datatable deshabilitados
    if ($_POST['NombreProceso'] == "CARGARDATOSDESHABILITADOS")
    {
      $sql="SELECT productos.id,  productos.nombre, productos.cantidad,  productos.stok, 
      productos.p_estatus, venta.venta_id, venta.producto_id, venta.vanta_cantidad, 
      venta.venta_fecharegistro, venta.v_estatus FROM graficos.venta  INNER JOIN
      graficos.productos ON  venta.venta_id = productos.id  WHERE venta.venta_fecharegistro >= '2023-01-1' 
      AND venta.venta_fecharegistro <= '2023-12-31' AND venta.v_estatus=0 AND productos.p_estatus=0" ;
      //  echo $sqlr;
      $campos=array();
      if ($Resultado = $conexion->query($sql)) {
          while ($fila = $Resultado->fetch_assoc()) {
          $campos[]=$fila;
          }
          echo json_encode($campos);
          }
          else
          {
            echo "ERROR";
          }
    }
  
// ACTUALIZAR PRODUCTOS
    if ($_POST['NombreProceso'] == "ACTUALIZARPRODUCTOS")
{
        $txtid=$_POST["id"];
        $nombre=$_POST["nombre"];
        $cantidad=$_POST["cantidad"];
        $stock=$_POST["stock"];
        $v_cantidad=$_POST["v_cantidad"];
        $v_fecha=$_POST["v_fecha"];
       


        $sqlr="CALL SP_ACTUALIZAR_PRODUCTOS ('$txtid',' $nombre','$cantidad',' $stock','$v_cantidad','$v_fecha')";
        //  echo $sqlr;
        if ($Resultado = $conexion->query($sqlr))
         {
          echo 1;
         }
         else{
          echo 0;
        }
    }


// DESHABILITAR PRODUCTOS
    if ($_POST['NombreProceso'] == "ELIMINARDATOS")
{
        $txtid=$_POST["id"];
        $sqlr="UPDATE venta ,productos SET venta.v_estatus =0, productos.p_estatus=0
        WHERE venta.venta_id = $txtid AND productos.id=$txtid";
        //  echo $_POST["id"];
        if ($Resultado = $conexion->query($sqlr))
         {
          echo 1;
         }
         else{
          echo 0;
        }
}

    // HABILITAR PRODUCTOS
    if($_POST['NombreProceso'] == "HABILITARDATOS"){
      $txtid=$_POST["id"];
      $sql="UPDATE venta ,productos SET venta.v_estatus =1, productos.p_estatus=1
      WHERE venta.venta_id = $txtid AND productos.id=$txtid";
      if($Resultado = $conexion->query($sql)){
        echo 1;
      }
      else{
        echo 0;
      }
    }

    //////REGISTRAR PRODUCTOS
    if($_POST['NombreProceso'] == "REGISTRARDATOS"){

      $nombre_p=$_POST["nombre_p"];
      $cantidad_p=$_POST["cantidad_p"];
      $stock_p=$_POST["stock_p"];
      $v_cantidad_p=$_POST["v_cantidad_p"];
      $v_fecha_p=$_POST["v_fecha_p"];
      // echo $nombre,$cantidad_p,$stock_p,$v_cantidad_p,$v_fecha_p;
      $comandosql="CALL SP_REGISTRAR_PRODUCTOS('$nombre_p','$cantidad_p','$stock_p','$v_cantidad_p','$v_fecha_p')";
      
      if($Resultado = $conexion->query($comandosql)){
        echo 1;
      }
      else{
       echo 0;
      }
      
     
    }



    ///sesiones
    if($_POST['NombreProceso'] == "SESSIONES"){
      // $idusuario=$_POST['usu_pass'];
      $user=$_POST['usu_nombre'];
      $pass_user=sha1($_POST['usu_pass']);
      $sqlsession="CALL SP_VERIFICAR_USER('$user','$pass_user')";
      // echo $sqlsession;
      $campos=array();
      if ($Resultado = $conexion->query($sqlsession)) {
          while ($fila = $Resultado->fetch_assoc()) {
                $campos[] = $fila;
          }
           $data=json_encode($campos);
              if(count($campos)>0){
                echo $data;
            }else{
                echo 0;
            }
          }
    }
// usuarios
    if($_POST['NombreProceso']=="LISTARUSU"){
      $sqluserlist="SELECT * FROM  user";
      $campos=array();
      if($Resultado=$conexion->query($sqluserlist)){
        while($fila=$Resultado->fetch_assoc()){
          $campos[]=$fila;
        }
        echo json_encode($campos);
      }else{
        echo "error";
      }
    }
// registrar usuarios
    if($_POST['NombreProceso'] == "REGISTRARDATOSUSUARIO"){

      $nombre=$_POST["nombre"];
      $telefono=$_POST["telefono"];
      $pass=sha1($_POST["pass"]);
      $correo=$_POST["correo"];
      $roll=$_POST["roll"];
      // echo $nombre,$cantidad_p,$stock_p,$v_cantidad_p,$v_fecha_p;
      $comandosql="INSERT INTO user(nombre_user,pass_user,correo,cell,rol,estatus)VALUES('$nombre','$pass','$correo','$telefono','$roll','ACTIVO')";
      
      if($Resultado = $conexion->query($comandosql)){
        echo 1;
      }
      else{
       echo 0;
      }
    }

// traer datos usu habilitados
if ($_POST['NombreProceso'] == "CARGARDATOSHABILITADOSUSU")
{
  $sql="SELECT * FROM user WHERE estatus='ACTIVO'";
  //  echo $sqlr;
  $campos=array();
  if ($Resultado = $conexion->query($sql)) {
      while ($fila = $Resultado->fetch_assoc()) {
      $campos[]=$fila;
      }
      echo json_encode($campos);
      }
      else
      {
        echo "ERROR";
      }
}
// traer datos usu deshabilitados
if ($_POST['NombreProceso'] == "CARGARDATOSDESHABILITADOSUSU")
{
  $sql="SELECT * FROM user WHERE estatus='INACTIVO'";
  //  echo $sqlr;
  $campos=array();
  if ($Resultado = $conexion->query($sql)) {
      while ($fila = $Resultado->fetch_assoc()) {
      $campos[]=$fila;
      }
      echo json_encode($campos);
      }
      else
      {
        echo "ERROR";
      }
}

// ACTULIZAR USUARIOS

if ($_POST['NombreProceso'] == "ACTUALIZAUSUARIO")
{
        $txtid=$_POST["id"];
        $nombre=$_POST["nombreusu"];
        $pass=$_POST["pass"];
        $email=$_POST["email"];
        $cell=$_POST["cell"];
        $roll=$_POST["rol"];
        
        $sqlr="CALL SP_UPDATE_USU('$txtid','$nombre','$pass','$email','$cell','$roll')";
        //  echo $sqlr;
        if ($Resultado = $conexion->query($sqlr))
         {
          echo 1;
         }
         else{
          echo 0;
        }
    }

// DESHABILITAR PRODUCTOS
if ($_POST['NombreProceso'] == "ELIMINARDATOSUSU")
{
        $txtid=$_POST["id"];
        $sqlr="UPDATE user SET estatus =0
        WHERE id_user = $txtid" ;
        //  echo $_POST["id"];
        if ($Resultado = $conexion->query($sqlr))
         {
          echo 1;
         }
         else{
          echo 0;
        }
}

    //HABILITAR PRODUCTOS
    if($_POST['NombreProceso'] == "HABILITARDATOSUSU"){
      $txtid=$_POST["id"];
      $sql="UPDATE user SET estatus =1
      WHERE  id_user = $txtid ";
      if($Resultado = $conexion->query($sql)){
        echo 1;
      }
      else{
        echo 0;
      }
    }


    // listar rol


    if($_POST['NombreProceso']=="LISTARROL"){
     $sqlrol="SELECT rol.id_rol,rol.nombre_rol FROM graficos.rol" ;
      //  echo $sqlrol;
      $campos=array();
      if ($Resultado = $conexion->query($sqlrol)) {
          while ($fila = $Resultado->fetch_assoc()) {
          $campos[]=$fila;
          }
          echo json_encode($campos);
          // $data=json_encode($campos);
          //     if(count($campos)>0){
          //       echo $data;
          //   }else{
          //       echo 0;
          //   }
          }else{
            echo 0;
          }
         
    }


    // MODIFCAR ESTATUS USUARIO
    if($_POST['NombreProceso']=="MODIFICAR_ESTATUS"){
      $id_user=$_POST['idusuario'];
      $estatus=$_POST['estatus'];
      $sqlestatus="CALL SP_MODIFICAR_ESTATUS_USUARIO('$id_user','$estatus')";
      // echo $sqlestatus;
      if($Resultado = $conexion->query($sqlestatus)){
        echo 1;
      }
      else{
        echo 0;
      }
    }


    // FUNCIOONES PARA MODULOS

    // CREAR MODULOS

    if($_POST['NombreProceso'] == "CREARMODULO"){

      $nombre_modulo=$_POST["nombre_modulo"];
      $posicion_modulo=$_POST["posicion_modulo"];
      $icono=$_POST["icono"];
      
      // echo $nombre,$cantidad_p,$stock_p,$v_cantidad_p,$v_fecha_p;
      $comandosql="INSERT INTO modulos(nombre_modulo,orden,estatus,icono)VALUES('$nombre_modulo','$posicion_modulo','S','$icono')";
      
      if($Resultado = $conexion->query($comandosql)){
        echo 1;
      }
      else{
       echo 0;
      }
    }

    // MOSTRAR MODULOS

    if($_POST['NombreProceso']=="TABLAMODULO"){
      $sqlrol="SELECT modulos.idmodulo,  modulos.nombre_modulo,  modulos.orden,  modulos.estatus,
        modulos.icono FROM  modulos" ;
       //  echo $sqlrol;
       $campos=array();
       if ($Resultado = $conexion->query($sqlrol)) {
           while ($fila = $Resultado->fetch_assoc()) {
           $campos[]=$fila;
           }
           echo json_encode($campos);
           // $data=json_encode($campos);
           //     if(count($campos)>0){
           //       echo $data;
           //   }else{
           //       echo 0;
           //   }
           }else{
             echo 0;
           }
          
     }


?>
