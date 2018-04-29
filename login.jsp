<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Berichtsheft Digital - Anmelden</title>

</head>

<body>

<div class="container">

    <div id="login-form">

        <form action="loginCheck.jsp" method="post" autocomplete="off">

            <div class="col-12 col-sm-10 col-md-8">
                <div class="form-group">
                    <h2 class="">Anmelden</h2>
                </div>

                <div class="form-group">
                    <hr/>
                </div>

                <!------ Nutzername eingabe ---------->

                <div class="form-group">
                    <input type="text" name="username" id="username" class="form-control input"
                           placeholder="Nutzername" required>
                </div>

                <!------ Passwort eingabe ---------->

                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg"
                           placeholder="Passwort" required>
                </div>

                <!------ Buttons am Ende ---------->

                <div class="form-group">
                    <button type="submit" class="btn    btn-block btn-primary" name="signup" id="reg" value="Submit">Login
                    </button>
                </div>
                <div class="form-group">
                    <hr/>
                </div>
                <div class="form-group">
                    <a href="register.jsp" type="button" class="btn btn-block btn-success" name="btn-login">Registrierung</a>
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>
