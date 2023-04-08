<?php 

  // > To save data in the section
  session_start();

  // ! Connection String
  $conn = mysqli_connect(
    'localhost',  // * server
    'root',       // * user
    '',           // * password
    'pink_data'   // * database
  );

  // > Connection Testing 
  // if (isset($conn)) {
  //   echo "Database is connected";
  // }
?>