<?php
  include "../php/conexion.php";
   session_start();
   $ComandoSql="SELECT
   modulos.idmodulo, 
   modulos.nombre_modulo, 
   modulos.orden, 
   modulos.estatus, 
   modulos.icono
 FROM
   modulos
   where estatus='S' order by orden";
    // echo $ComandoSql;
   // $Resultado=
   $listado="";
  //  $conta=0;
       $resultado=$conexion->query($ComandoSql);
       while($fila=$resultado->fetch_array())
         {
           $listado.="<li class='nav-item dropdown'>
           <a href='#' class='nav-link text-secondary'   data-bs-toggle='dropdown'>
            ".$fila['icono']." ".$fila['nombre_modulo']."
           </a> ";
           
            $listado.="<div class='dropdown-menu'>";           
            
            $sqlr="SELECT opciones.idopcion, opciones.ruta, opciones.nombre_opcion FROM  opciones  WHERE  opciones.modulo=".$fila['idmodulo']." and opciones.estatus='S'  order by opciones.modulo, opciones.orden";
            $resultado2=$conexion->query($sqlr);
            $fila2="";
            while($fila2=$resultado2->fetch_array())
              {
                
              //  $ruta="../vistas".$fila2[1];
              
              $listado.="<a class='dropdown-item'  ".$fila2[1].">".$fila2[2]."</a>";
              }
              $listado.="</div></li>";
         }
         echo $listado;
?>