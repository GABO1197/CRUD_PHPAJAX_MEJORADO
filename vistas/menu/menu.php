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
          //  $listado.="<li class='nav-item dropdown'>
          //  <a href='#' class='nav-link text-secondary'   data-bs-toggle='dropdown'>
          //   ".$fila['icono']." ".$fila['nombre_modulo']."
          //  </a> ";
           
          //   $listado.="<div class='dropdown-menu'>";           
            
          //   $sqlr="SELECT opciones.idopcion, opciones.ruta, opciones.nombre_opcion FROM  opciones  WHERE  opciones.modulo=".$fila['idmodulo']." and opciones.estatus='S'  order by opciones.modulo, opciones.orden";
          //   $resultado2=$conexion->query($sqlr);
          //   $fila2="";
          //   while($fila2=$resultado2->fetch_array())
          //     {
                
          //     //  $ruta="../vistas".$fila2[1];
              
          // $listado.="<a class='dropdown-item' onclick='cargar_contenido(\"cargar_tablas\",\"".$fila2[1]."\")' >".$fila2[2]."</a>";
          //     }
          //     $listado.="</div></li>";
          $listado.="<div class='menu-link'><a href='#'><i class='".$fila['icono']."'></i>".$fila['nombre_modulo']."</a>";
            $listado.="<div class='sub-menu'><div class='card'><div class='card-body'>";    
            $sqlr="SELECT opciones.idopcion, opciones.ruta, opciones.nombre_opcion FROM  opciones  WHERE  opciones.modulo=".$fila['idmodulo']." and opciones.estatus='ACTIVO'  order by opciones.modulo, opciones.orden";
            $resultado2=$conexion->query($sqlr);
            $fila2="";
            while($fila2=$resultado2->fetch_array())
              {
              
                 $listado.="<a href='#' onclick='cargar_contenido(\"cargar_tablas\",\"".$fila2[1]."\")'>".$fila2[2]."</a>";
              }
              $listado.="</div></div></div></div>";
         }
         echo $listado;
?>
<!-- <div class="menu-link">
          <a href="#"><i class="fas fa-home"></i>Inicio </a>
          <div class="sub-menu">
            <a href="#"><i class="fas fa-star"></i>Subenlace 1.1</a>
            <a href="#"><i class="fas fa-cog"></i>Subenlace 1.2</a>
            <a href="#"><i class="fas fa-info-circle"></i>Subenlace 1.3</a>
          </div>
</div> -->