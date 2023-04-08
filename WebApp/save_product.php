<?php
  include("db.php");
  // ! Connection Validation
  if (isset($_POST['save_product'])){
    $id = $_POST['id'];
    $producto = $_POST['producto'];
    $detalles = $_POST['detalles'];
    $tipo = $_POST['tipo'];
    $precio = $_POST['precio'];

    // > Data Testing
    // echo $producto;
    // echo $tipo;
    // echo $detalles;
    // echo $precio;

    $query = "INSERT INTO Producto (id_producto, nombre_producto, detalles_producto, tipo_producto, costo_producto) VALUES ('$id','$producto', '$detalles', '$tipo', '$precio')";
    
    // Executing
    $result = mysqli_query($conn, $query);

    if(!$result) {
      die("Query Failed!");
    } 

    $_SESSION['message'] = "Producto guardado correctamente!" ;
    $_SESSION['message_tipo'] = "success" ;

    header("Location: index.php");
  }
?>