<?php
$idusuario=$_POST['idusuario'];
$user=$_POST['user'];
$pass=$_POST['pass'];
session_start();
$_SESSION['S_ID']=$idusuario;
$_SESSION['S_USER']=$user;
$_SESSION['S_PASS']=$pass;

?>