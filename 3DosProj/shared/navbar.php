<?php
session_start();
if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
    header('location:/3DosProj/alterPages/signin/signin.php');
}
?>

<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Antonio:wght@100&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>

<body style="background-color: #e1d89f;">
    <div class="py-2 bg-white"><img src="/3DosProj/img/Logo.png" width="100px" style="display:block;margin-left: auto;margin-right: auto;" alt="logo"></div>
    <nav class="navbar navbar-expand-lg px-4 py-3 " style="background-color: #2e0f15;">
        <a class="navbar-brand text-light" href="/3DosProj/index.php">Agennda Store</a>

        <?php if (isset($_SESSION['section'])) { ?>
            <div class=" collapse navbar-collapse" id="navbarNavDropdown" style="background-color: #2e0f15;">

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Buy
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item " href="/3DosProj/alterPages/books.php"> Books</a></li>
                            <li><a class="dropdown-item" href="/3DosProj/alterPages/music.php"> Music</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-light" href="/3DosProj/alterPages/orders/cart.php"><i class="bi bi-cart3"></i> Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-light" href="/3DosProj/alterPages/orders/myorders.php"><i class="bi bi-list-check"></i> Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-light" href="/3DosProj/alterPages/myprofile/profile.php"><i class="bi bi-person-circle"></i> Profile</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">

                    <form method="GET">
                        <button type="submit" name="logout" class="mt-3 mx-3 border-0 btn btn-outline-light btn-sm">Log Out</button>
                    </form>
                </ul>
            </div>
        <?php } ?>
    </nav>