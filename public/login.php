<?php include "files/header.php";?>
<?php

$username = $_POST['username'];
$password = $_POST['password'];


if (isset($_POST['login'])){
    if (empty($username) && empty($password)){
        echo 'Tous les champs sont obligatoires';
    }else
    {
        $select_u = $db->prepare("SELECT * FROM users WHERE username ='".$username."' AND password = '".$password."'");
        $select_u->execute();
        $fetch = $select_u->fetch();



        $id = $fetch['id'];
        $username = $fetch['username'];
        $password = $fetch['password'];

        setcookie("id",$id,time()+60+60+48);
        setcookie("login",1,time()+60+60+48);

        echo 'OK';
    }
}



?>
<style>
    html,
    body {
        height: 100%;
    }

    body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: auto;
    }
    .form-signin .checkbox {
        font-weight: 400;
    }
    .form-signin .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

</style>
<main class="form-signin">
    <form method="post" >
        <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
        <h1 class="h3 mb-3 fw-normal">Se connecter</h1>
        <label for="inputEmail" class="visually-hidden">Username</label>
        <input type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="" name="username">
        <label for="inputPassword" class="visually-hidden">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Mot de passe" required="" name="password">

        <button class="w-100 btn btn-lg btn-primary" type="submit" name="login">Se connecter</button>
        <p class="mt-5 mb-3 text-muted">© Luzinelab-2020</p>
    </form>
</main>

<?php include "files/footer.php";?>