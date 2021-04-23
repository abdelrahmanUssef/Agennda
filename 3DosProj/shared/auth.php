<?php
$section=$_SESSION['section'];
if($section=="admin" || $section=="employee"){

}
else{
header('location:/3DosProj/alterPages/signin/signin.php');
}

?>