<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Berichtsheft Digital - Registrieren</title>


</head>

<body>

<div class="container">

    <div id="login-form">

        <form method="post" autocomplete="off">

            <div class="col-12 col-sm-10 col-md-8">
                <div class="form-group">
                    <h2 class="">Neuen Benutzer Anlegen</h2>
                </div>

                <div class="form-group">
                    <hr/>
                </div>

                <!------ Vor-Nachname eingabe ---------->
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="first_name" id="first_name" class="form-control input"
                                   placeholder="Vorname" required>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="last_name" id="last_name" class="form-control input"
                                   placeholder="Nachname" required>
                        </div>
                    </div>
                </div>

                <!------ Beruf, Nutzername eingabe ---------->
                <div class="form-group">
                    <input type="text" name="profession" id="profession" class="form-control input"
                           placeholder="Beruf" required>
                </div>

                <div class="form-group">
                    <input type="text" name="user_name" id="user_name" class="form-control input"
                           placeholder="Nutzername" required>
                </div>


                <!------ Datum eingabe und Azubi/Ausbilder auswahl ---------->
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="date" name="start_date" id="start_date" class="form-control input"
                                   placeholder="DD.MM.YYYY" required>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <div class="btn-group btn-group-toggle" data-toggle="buttons" required>
                                <label class="btn btn-outline-secondary  active">
                                    <input type="radio" name="options" id="option1" checked> Azubi
                                </label>
                                <label class="btn btn-outline-secondary ">
                                    <input type="radio" name="options" id="option2"> Ausbilder
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <!------ Passwort eingabe ---------->
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="password" name="password" id="password" class="form-control input-lg"
                                   placeholder="Passwort" required>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="password" name="password_confirmation" id="password_confirmation"
                                   class="form-control input-lg" placeholder="Passwort wiederholen" required>
                        </div>
                    </div>
                </div>
                <!------ Buttons am Ende ---------->
                <div class="form-group">
                    <button type="submit" class="btn    btn-block btn-primary" name="signup" id="reg">Registrieren
                    </button>
                </div>
                <div class="form-group">
                    <hr/>
                </div>
                <div class="form-group">
                    <a href="index.jsp" type="button" class="btn btn-block btn-success" name="btn-login">zum Login</a>
                </div>
            </div>

        </form>

    </div>
</div>

</body>
</html>
