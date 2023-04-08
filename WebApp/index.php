<?php include("db.php") ?>

<?php include("includes/header.php") ?>

<div class="container p-4">
  <div class="row">
    <div class="col-md-6 mb-4">

      <?php if(isset($_SESSION['message'])) { ?>
        <div class="alert alert-<?=$_SESSION['message_tipo']?> alert-dismissible fade show" role="alert">
          <?=$_SESSION['message']  ?>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      <?php session_unset(); } ?> 

      <div class="card card-body">
        <form action="save_product.php" method="post">
        <div class="form-group">
            <input type="number" name="id" class="form-control" placeholder="ID del producto" autofocus>
          </div>
          <div class="form-group">
            <input type="text" name="producto" class="form-control mt-2" placeholder="Nombre">
          </div>
          <div class="form-group">
            <input type="text" name="tipo" class="form-control mt-2" placeholder="Tipo">
          </div>
          <div class="form-group">
            <textarea name="detalles" rows="3" class="form-control mt-2" placeholder="Detalles"></textarea>
          </div>
          <div class="form-group">
            <input type="number" name="precio" class="form-control mt-2" placeholder="Precio" step="0.01">
          </div>
          <div class="d-grid gap-2">
              <input type="submit" class="btn btn-primary mt-3" name="save_product" value="Guardar">
          </div>
        </form>
      </div>
    </div>
    <div class="col-md-16">
        <table class="table table-bordered">
          <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Detalles</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <?php 
              // * Query
              $query = "SELECT * FROM Producto";
              $result_product =  mysqli_query($conn, $query);

              while($row = mysqli_fetch_array($result_product)) { ?>
              <tr>
                <td> <?php echo $row['id_producto']?> </td>
                <td> <?php echo $row['nombre_producto']?> </td>
                <td> <?php echo $row['tipo_producto']?> </td>
                <td> <?php echo $row['detalles_producto']?> </td>
                <td> <?php echo $row['costo_producto']?> </td>
                <td class="d-grid gap-2 d-md-flex">
                    <a href="edit_product.php?id_producto=<?php echo $row['id_producto']?>" class="btn btn-dark m-1">
                      <i class="fa-solid fa-pen"></i>
                    </a>
                    <a href="delete_product.php?id_producto=<?php echo $row['id_producto']?>" class="btn btn-danger m-1">
                      <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
              </tr>
            <?php }?>
          </tbody>
        </table>
    </div>
  </div>
</div>

<?php include("includes/footer.php") ?>


    
