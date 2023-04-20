
<?php
  session_start();
  require 'db.php';

  if (isset($_SESSION['usuario_id'])) {
    $records = $conn->prepare('SELECT id, email, password FROM usuario WHERE id = :id');
    $records->bindParam('id',$_SESSION['usuario_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC); 

    $usuario = null;

    if (count($results) > 0) {
      $usuario = $results;
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pink Restaurant</title>
    <!-- fuentes -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@200;400;500;600&family=Montserrat:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Estilos -->
    <link rel="stylesheet" href="assets/css/styles.css" >
  </head>
  <body>
    <?php require 'partials/header.php'?>

    <?php if(!empty($usuario)): ?>
      <section class="current-section">
        <div>
          <p>¡Bienvenido <?= $usuario['email'] ?>! </p>
          <p>Te encuentras dentro de la aplicación.</p>
          <a href="logout.php">Cerrar Sesión</a>
          <a href="/php_crud_mysql/index.php">Ver Base de Datos</a>
        </div>
      </section>
    <?php else: ?>
    <section class="initial-section">
      <div>
      <h1>Regístrate a la aplicación</h1>
      <p><strong>PinkRestaurant</strong> es una interfaz que te permite manipular los datos almacenados en una base de datos de manera fácil y eficiente. Además, garantiza que se realicen las operaciones necesarias en los datos de manera segura y consistente.
      </p>
      <a href="login.php">Login</a> o
      <a href="signup.php">signup</a>
      </div>
    </section>
    <?php endif; ?>
  </body>
</html>