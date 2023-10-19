<?php
   require_once('./php/conexion.php');
   session_start();
   $ComandoSql="SELECT * FROM modulos where estatus='S' order by orden";
    // echo $ComandoSql;
   // $Resultado=
   $listado="";
  //  $conta=0;
       $resultado=$conexion->query($ComandoSql);
       while($fila=$resultado->fetch_array())
         {
           $listado.="<li class='nav-item dropdown'>
           <a href='#' class='nav-link text-secondary'   data-bs-toggle='dropdown'>
            ".$fila['icono']."
            ".$fila['nombre_modulo']."
           </a>";
           
            $listado.="<div class='dropdown-menu'>";           
            
            $sqlr="SELECT opciones.idopcion, opciones.ruta, opciones.nombre_opcion FROM  opciones  WHERE  opciones.modulo=".$fila['idmodulo']." and opciones.estatus='S'  order by opciones.modulo, opciones.orden";
            // echo $sqlr;
            $resultado2=$conexion->query($sqlr);

            while($fila2=$resultado2->fetch_array())
              {
                // echo $fila2[1];
              //  $ruta="../vistas/tablas".$fila2[1];
              //  $spl=$fila[1];
              //  echo "<li><i class='fa fa-puzzle-piece'></i><a href='#' onclick='ajax(\"../modulos/".$fila2[1]."\",".$fila2[0].")'>".$fila2[2]."</a></li>";
              $listado.="<a class='dropdown-item' href='#1' ".$fila2[1].">".$fila2[2]."</a>";
              }
              
              $listado.="</div></li>";
              
         }
         echo $listado;
?>