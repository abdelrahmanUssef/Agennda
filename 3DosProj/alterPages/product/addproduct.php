<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title> Add category </title>
</head>
<?php
include '../../shared/config.php';
include '../../shared/sidebar.php';
$update=false;

/// to insert into product database
if (isset($_POST['send'])) {
    $name = $_POST['proName'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $adminId = $_POST['idAdmin'];
    $quantity = $_POST['prodQuantity'];
    $categoryId = $_POST['idCat'];
/// to input an image
    $imageName = $_FILES['image']['name'];
    $imageType = $_FILES['image']['type'];
    $imageTmp = $_FILES['image']['tmp_name'];
    $location="";
    move_uploaded_file($imageTmp , $location . $imageName);

    $insert = "INSERT INTO `product` values (NULL , '$name' ,'$description','$price','$imageName','$adminId','$categoryId','$quantity')";
    $i = mysqli_query($conn, $insert);
    header('location:product.php');

}
///update///
if(isset($_GET['update'])){
    $id=$_GET['update'];
$update=true;
    $select="SELECT * FROM `product` Where id=$id";
    $s=mysqli_query($conn,$select);
    $row=mysqli_fetch_array($s);
    $name=$row['proName'];
    $description2=$row['description'];
    $price=$row['price'];
    $image=$row['image'];
    $adminId2=$row['adminId'];
    $categoryId2=$row['categoryId'];
    $prodQuantity=$row['prodQuantity'];
if(isset($_POST['update'])){
    
    $name=$_POST['proName'];
    $description3=$_POST['description'];
    $price=$_POST['price'];
    $adminId2=$_POST['idAdmin'];
    $catId=$_POST['idCat'];
    $prodQuantity=$_POST['prodQuantity'];
$update="UPDATE `product` SET `proName`='$name',`description`='$description3',`price`= $price,`adminId`=$adminId2
,`categoryId`=$catId,`prodQuantity`=$prodQuantity WHERE id=$id";  
$i=mysqli_query($conn,$update);
if($i){
    header('location:product.php');
}
}
}
?>
<h1 class="text-center text-info display-2"> <?php if($update==true){echo"UPDATE";}else{echo"ADD";}?> PRODUCT </h1>
<div class="container col-5 mt-5">
    <form method="POST" enctype="multipart/form-data">
        <div class="form-group">

            <label for="name">product name</label>
            <input name="proName"value="<?php if($update==true){echo$name;}else{echo'';}?>" type="text" class="form-control" id="name"  required>
            <label for="description">description</label>
            <input name="description" value="<?php if($update==true){echo$description2;}else{echo'';}?>" type="text" class="form-control" id="description"  required>
            <label for="quantity">Quantity</label>
            <input name="prodQuantity"value="<?php if($update==true){echo$prodQuantity;}else{echo'';}?>" type="text" class="form-control" id="quntity"  required>
            <label for="price">Price</label>
            <input name="price" type="number" min="1" value="<?php if($update==true){echo$price;}else{echo'';}?>" class="form-control" id="price"  required>
            <?php if($update==false){  ?>
            <label for="exampleInputEmail1">Image</label>
            <input name="image"  type="file" class="form-control"  id="exampleInputEmail1"  required>
            <?php } ?>
            <label for="inputGroupSelect01">Admin</label>
            <select name="idAdmin"  class="form-select" aria-label="Default select example" id="inputGroupSelect01">
                <?php
                $select = "SELECT * FROM `admin` ";
                $result = mysqli_query($conn, $select);
                foreach($result as $row){
                    echo "<option value='" . $row['id'] . "'>" . $row['id'] . "-" . $row['adminName'] . "</option>";
                }
                ?>
            </select>
            <label for="inputGroupSelect01">categoryId</label>
            <select name="idCat" class="form-select" aria-label="Default select example" id="inputGroupSelect01">
                <?php
                $select = "SELECT * FROM `subcat` ";
                $result = mysqli_query($conn, $select);
                foreach($result as $row){
                    echo "<option value='" . $row['id'] . "'>" . $row['id'] . "-" . $row['subname'] . "</option>";
                }
                ?>
            </select>
            <?php if ($update==false){?>
       <br> <button type="submit" name="send" class="btn btn-primary">Done </button>
            <?php }else {?>
     <br>  <button type="submit" name="update" class="btn btn-primary">Update</button>
            <?php }?>
        </div>
       
    </form>