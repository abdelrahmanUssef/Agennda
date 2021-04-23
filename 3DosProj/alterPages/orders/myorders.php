<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title> My Orders </title>
</head>

<body id="body">
    <?php
    include '../../shared/navbar.php';
    include '../../shared/config.php';
    include '../../shared/authcust.php';

    $customerId = $_SESSION['id'];

    $select = " SELECT * FROM `order`WHERE custId= $customerId ";
    $s = mysqli_query($conn, $select);

    ?>
    <div class="container col-10 mt-5">
    <table class="table bg-light  table-hover">
                <thead class="table-dark">
                <th>id</th>
                <th>name</th>
                <th>price</th>
                <th>quantity</th>
                <th>total price</th>

            </thead>
            <?php
            $select = "SELECT product.proName,product.price,product.prodQuantity,order.id,order.price,order.prodQuan
                        FROM `order`
                        INNER JOIN product ON order.prodId=product.id 
                        where custId='$customerId'";
                        
            $s = mysqli_query($conn, $select);
            foreach ($s as $data) {
                $sum = $data['price'] * $data['prodQuan'];
            ?>
                <tr>
                    <td> <?php echo $data['id']; ?> </td>
                    <td> <?php echo $data['proName']; ?> </td>
                    <td> <?php echo $data['price']; ?> </td>
                    <td> <?php echo $data['prodQuan']; ?> </td>
                    <td> <?php echo $sum; ?> </td>
                         </tr>
                        <?php } ?>
        </table>
    </div>
    <?php
    include '../../shared/script.php';
    ?>