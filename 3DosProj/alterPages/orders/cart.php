<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title> my cart </title>

</head>
<body>
<?php
include '../../shared/navbar.php';
include '../../shared/config.php';
include '../../shared/authcust.php';
$custId = $_SESSION['id'];
if (isset($_POST['checkOut'])) {
    $select = "SELECT * FROM `cart` where custId='$custId'";
    $check = mysqli_query($conn, $select);
    $rows = mysqli_num_rows($check);
    while($rows>0){
    $show = mysqli_fetch_array($check);
    $totalPrice = $show['price'];
    $prodQuan = $show['prodQuan'];
    $custId = $show['custId'];
    $prodId = $show['prodId'];
    $insert = "INSERT INTO `order` VALUES (NULL , '$totalPrice' ,'$prodQuan' ,'$custId', '$prodId')";
    $query = mysqli_query($conn, $insert);
    $del="DELETE FROM `cart` WHERE custId=$custId";
    $qu=mysqli_query($conn,$del);
    header('location:myorders.php');
    $rows--;
}
}
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $delete = "DELETE FROM `cart` WHERE id=$id";
    mysqli_query($conn, $delete);
}
$select = "SELECT product.proName,cart.price,cart.prodQuan,cart.id 
    FROM `cart`
    INNER JOIN product ON cart.prodId=product.id 
    where custId='$custId'";
$s = mysqli_query($conn, $select);
?>
<head>
    <title>Cart</title>
</head>
<body>
    <form action="cart.php" method="post">
        <div class="container col-10 mt-5">
            <table class="table bg-light  table-hover">
                <thead class="table-dark">
                    <th>id</th>
                    <th>name</th>
                    <th>total price</th>
                    <th>quantity</th>
                    <th>Action</th>
                </thead>
                <?php
                  $totprice=0;
                foreach ($s as $data) {
                ?>
                    <tr>
                        <td> <?php echo $data['id']; ?> </td>
                        <td> <?php echo $data['proName']; ?> </td>
                        <td><?php echo $data['price']; ?></td>
                        <td><?php echo $data['prodQuan']; ?></td>   
                        <td><a href="cart.php?delete=<?php echo $data['id']; ?>" class="btn btn-danger">Delete</a>
                        <?php
                        $totprice+=$data['price'];
                        ?>
                    </tr>
                <?php } ?>
                <tr>
                    <td colspan="4" style="text-align :right;"> <b>Total Price : </b></td>
                    <td> <?php echo $totprice; ?></td>
                    </tr>
                <div class="d-grid gap-2 col-6 mx-auto mt-5">
                <button type="submit" class="btn btn-outline-success" name="checkOut">Check Out</button>
                </div>
    </form>

</body>

</html>
<?php
include '../../shared/script.php';
?>