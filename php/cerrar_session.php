<?php
session_start();
session_destroy();
header('Location: ../Login/index.php');
// header('Location: ../Login_v16/login.php');
?>