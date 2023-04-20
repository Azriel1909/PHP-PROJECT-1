<?php
  include("db.php");
  
  if(isset($_GET['id_producto'])) {
    $id = $_GET['id_producto'];
    $query = "DELETE FROM Producto WHERE id_producto = $id";
    $result = mysqli_query($conn, $query);

    if(!$result) {
      die("Query Failed!");
    } 
    
    $_SESSION['message'] = "Producto eliminado correctamente!" ;
    $_SESSION['message_tipo'] = "warning" ;
    header("Location: index.php");
  }
?>