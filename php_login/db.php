<?php
// Definir conexión
  $server = 'localhost';
  $username = 'root';
  $password = '';
  $database = "php_login_database";

  try {
    $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
  } catch(PDOException $e) {
    die('Connected Fail!:'.$e->getMessage());
  }

?>