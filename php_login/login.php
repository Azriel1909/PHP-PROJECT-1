<?php

  session_start();

  require 'db.php';

  if (!empty($_POST['email']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT id, email, password FROM usuario WHERE email=:email' );
    $records->bindParam(':email',$_POST['email']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);
    $message = '';

    if (count($results) > 0 && password_verify($_POST['password'], $results['password'])){
      $_SESSION['usuario_id'] = $results['id'];
      header('location: /php_login');
    } else {
      $message = 'Credenciales incorrectas';
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- fuentes -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@200;400;500;600&family=Montserrat:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Estilos -->
    <link rel="stylesheet" href="assets/css/styles.css" >
  </head>
  <body>
    <?php require 'partials/header.php'?>
    <section class="log-section">

    <?php if(!empty($message)): ?>
      <p class="mensaje"> <?= $message ?></p>
    <?php endif; ?>
    
    <h1>Log In</h1>
    <span class="flip-section">o crea una nueva cuenta...<a href="signup.php">Sign Up</a></span>
    
      <form action="login.php" method="post">
        <input type="text" name="email" placeholder="Ingresa tu email">
        <input type="password" name="password" placeholder="Ingresa tu contraseña">
        <input type="submit" value="Enviar">
      </form>
    </section>
  </body>
</html>