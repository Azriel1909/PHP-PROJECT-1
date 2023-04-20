<?php
// ! Requerir acceso a la base de datos
  require 'db.php';

  $message = '';

  if(!empty($_POST['email']) && !empty($_POST['password'])) {
    $sql = "INSERT INTO usuario (email, password) VALUES (:email, :password)";
    // Preparando la consulta
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $_POST['email']);
    // * Cifrando los datos
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password);

    if($stmt->execute()){
      $message = "Usuario creado correctamente.";
    } else {
      $message = "Ocurrió un error.";
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <!-- fuentes -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@200;400;500;600&family=Montserrat:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Estilos -->
    <link rel="stylesheet" href="assets/css/styles.css" >
  </head>
  <body>
    <?php require 'partials/header.php'?>
    <section class="sign-section">

    <?php if(!empty($message)): ?>
      <p class="mensaje"> <?= $message ?></p>
    <?php endif; ?>

    <h1>Sign Up</h1>
    <span class="flip-section" >o si ya tienes una cuenta...<a href="login.php">Log In</a></span>
      <form action="signup.php" method="post">
        <input type="text" name="email" placeholder="Ingresa tu email">
        <input type="password" name="password" placeholder="Ingresa tu contraseña">
        <input type="password" name="confirm_password" placeholder="Confirma tu contraseña">
        <input type="submit" value="Enviar">
      </form>
    </section>
  </body>
</html>