<?php
  include("db.php");
  if(isset($_GET['id_producto'])) {
    $id = $_GET['id_producto'];
    $query = "SELECT * FROM Producto WHERE id_producto = $id";

    $result = mysqli_query($conn, $query);

    if(mysqli_num_rows($result) == 1) {
      $row = mysqli_fetch_array($result);

      $idn = $row['id_producto'];
      $nombre = $row['nombre_producto'];
      $tipo = $row['tipo_producto'];
      $detalles = $row['detalles_producto'];
      $precio = $row['costo_producto'];
      
    } 
  }

  if(isset($_POST['update'])) {
    $idn = $_POST['idn']; // ? Possible error $_GET: Resuelto, el error únicamente es visible con el método $_GET.

    // * I used the $id variable because is my inmutable value, it helps me to identified the current id. Then, I saved the id that will change in another variable called $idn.

    $producto = $_POST['producto'];
    $detalles = $_POST['detalles'];
    $tipo = $_POST['tipo'];
    $precio = $_POST['precio'];

    // > Testing
    // echo $idn;
    // echo $producto;
    // echo $detalles;
    // echo $tipo;
    // echo $precio;


    $query = "UPDATE Producto SET id_producto = '$idn', nombre_producto = '$producto', detalles_producto = '$detalles', tipo_producto = '$tipo', costo_producto = '$precio' WHERE id_producto = $id";

    mysqli_query($conn, $query);

    $_SESSION['message'] = "Producto actualizado correctamente!" ;
    $_SESSION['message_tipo'] = "info" ;
    header("Location: index.php");

  }

?>

<?php include("includes/header.php"); ?>

<div class="container p-4">
  <div class="row">
    <div class="col-med-4 mx-auto">
      <div class="card card-body">
        <div class="alert alert-info" role="alert">
          Para actualizar la información - ¡Todos los campos deben estar completos!
        </div>
        <form action="edit_product.php?id_producto=<?php echo $_GET['id_producto']; ?>" method="post">
          <div class="form-group">
            <input type="number" name="idn" value="<?php echo $idn?>" 
            class="form-control" placeholder="Agrega un identificador">
            <input type="text" name="producto" value="<?php echo $nombre?>" class="form-control mt-2" placeholder="Agrega el nombre del producto">
            <input type="text" name="tipo" value="<?php echo $tipo?>" class="form-control mt-2" placeholder="Agrega el tipo de platillo">
            <input type="number" name="precio" value="<?php echo $precio?>" class="form-control mt-2" placeholder="Agrega el precio del platillo">
          </div>
          <div class="form-group">
            <textarea name="detalles" rows="3" class="form-control mt-2" placeholder="Agrega una descripción"><?php echo $detalles; ?></textarea>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-primary mt-2" name="update">
              Actualizar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<?php include("includes/footer.php"); ?>
