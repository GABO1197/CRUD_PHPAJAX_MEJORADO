<?php
session_start();
if(!isset($_SESSION['S_ID'])){
  header('Location: ../Login/index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php include "scripts/links.php";?>
</head>
<style>
  .swal2-popup{
    font-size: 2rem !important;
  }
</style>
<body>
<div class="container_menu">
    <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
    <div class="contenedor_barra">
        <div class="barra">
                <nav class="navegacion">
                  <div class="profile-container">
                      <div class="profile-trigger" id="profile-trigger">
                          <img src="../img/pngwing.com.png" alt="Perfil">
                      </div>
                      <div class="profile-menu" id="profile-menu">
                          <div class="menu-content">
                              <ul>
                                  <li>
                                      <div class="circular-div">
                                          <img src="../img/pngwing.com.png" alt="Perfil">
                                      </div>
                                      <span><?php echo $_SESSION['S_USER'];?></span>
                                  </li>
                              </ul>
                          </div>
                          <!-- Duplicamos el contenido del menú -->
                          <div class="menu-content">
                              <a href="../php/cerrar_session.php"><button id="special-button"><span>Cerrar Session</span>/a>
                          </div>
                      </div>
                  </div>
                </nav>
          </div>
    </div>
    
    <div id="sidebar">
      <a href="principal.php" ><i class="fab fa-js fa-lg" style="color:yellow; width:50px;"></i>PROYECTO</a>
      <div class="sidebar-links">
        <div class="menu-link">
          <a href="principal.php"><i class="fas fa-home"></i>Inicio </a>
        </div>
        <?php include "menu/menu.php"?>
        <div class="menu-link">
          <a href="../php/cerrar_session.php"><i class="fas fa-home"></i>Cerrar sesion </a>
        </div>
        <button class="close-btn" onclick="toggleSidebar()">✕</button>
      </div>
    </div>
    
  </div>
<div class="content" id="main-content">
<!-- <header>
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
              // include "menu/menu.php";
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
</header> -->
    <div class="contenedor ">
      <div class="row boton_texto  gap-5 ">
          <h3>GAFICOS PRODUCTOS</h5>
          <div class="col-lg-2 ">
            <button  class="btn btn-primary" style="width:200px" onclick="AbrirmodalRegistro()"><i class="fa fa-plus-circle" aria-hidden="true"></i>Nuevo registro</button>
          </div>
          <div class="col-lg-2">
            <button  class="btn btn-primary" style="width:200px" onclick="AbrirmodalRegistroUsu()"><i class="fa fa-plus-circle" aria-hidden="true"></i>Nuevo Registro Usuario</button>
          </div>
          <div class="col-lg-2">
            <button  class="btn btn-primary" style="width:200px"  onclick="cargar_contenido('cargar_tablas','tablas/vender/vender.php')"><i class="fa fa-plus-circle" aria-hidden="true"></i>Vender</button>
          </div>
      </div>
    </div> 
<div class="contenedor3" id="cargar_tablas">
 <!-- ACA VA TODO EL CONTENIDO-->
      <?php include "scripts/graficas_sm.php";?>
      <?php include "scripts/nueva_graf.php";?>

</div>
<?php  include "modales/modales.php";?>
</div>
</body>
<?php include "scripts/scripts.php";?>
</html>









