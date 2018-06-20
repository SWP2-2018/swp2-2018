<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>



<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "login");

  //Mitteilung falls Daten beim einloggen nicht gepasst haben.
  String data = (String) session.getAttribute("messageData");
  String message="";
  if(session.isNew()){
    message += "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">Sie wurden erfolgreich Ausgeloggt!"
      + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
      + "</button>\n</div>\n";
  }
  else if (data != null) {
    if (data.equals("badData")) {//Bei schlechten Daten
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\"><strong>Username</strong> oder <strong>Passwort</strong> war falsch!"
        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if(data.equals("pwResendGood")) {
      message += "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\"><strong>Email</strong> an sie wurde versendet!"
        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if(data.equals("pwResendBad")){
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">Es konnte keine <strong>Email</strong> versendet werden"
        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    }
  }
  session.removeAttribute("messageData");//Daten nach Prüfung löschen.
  pageContext.setAttribute("message", message);
%>
<t:stdTempl>
  <jsp:attribute name="titleText"> - Login</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Login</jsp:attribute>
    </t:navbar>

    <div class="container inForm">

      <div id="login-form">

        <form action="scripts/loginCheck.jsp" method="post" autocomplete="off">
          <div class=" justify-content-lg-center inForm" >
            <!---  <div class="col-12 col-sm-10 col-md-8 ">--->
            <div class="form-group">
              <h2 class="">Anmelden</h2>
            </div>

            <div class="form-group">
              <hr/>
            </div>

            ${message}

            <!------ Nutzername eingabe ---------->

            <div class="form-group">
              <input type="text" name="email" id="user" class="form-control"
                     placeholder="Email" required>
            </div>

            <!------ Passwort eingabe ---------->

            <div class="form-group">
              <input type="password" name="password" id="password" class="form-control "
                     placeholder="Passwort" required>
            </div>

            <!------ Buttons am Ende ---------->

            <div class="form-group">
              <button type="submit" class="btn btn-block btn-setting" name="signup" id="signup" value="Submit">Login
              </button>
            </div>
          </div>


        </form>
      </div>

    <div class=" justify-content-lg-center inForm" >

      <div class="form-group">
        <button type="button" class="btn btn-block btn-setting" data-toggle="modal"
                data-target="#password-modal" name="btn-resendPw">Passwort vergessen?</button>
      </div>


      <!--Modal Password neu Senden -->
      <div class="modal hide" id="password-modal">
        <div class="container pwModal inForm">
          <form action="scripts/resendPassword.jsp" method="post" autocomplete="off">
            <div class=" justify-content-lg-center inForm">
              <!---  <div class="col-12 col-sm-10 col-md-8 ">--->
              <div class="form-group">
                <h2 class="modaltitle">Password neu Senden</h2>
              </div>
              <div class="form-group">
                <hr/>
              </div>
              <!------ Passwort eingabe ---------->
              <div class="form-group">
                <input type="text" name="userName" class="form-control "
                       placeholder="Vorname" required>
              </div>
              <div class="form-group">
                <input type="text" name="userSurname" class="form-control "
                       placeholder="Nachname" required>
              </div>
              <div class="form-group">
                <input type="text" name="userEmail" class="form-control "
                       placeholder="Email" required>
              </div>


              <!------ Buttons am Ende ---------->
              <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <div class="form-group">
                    <button type="submit" class="btn btn-block btn-setting" name="resendPW" id="pwResend" value="Submit">
                      Abschicken
                    </button>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <button type="submit" class="btn btn-block btn-danger" data-dismiss="modal" name="close" id="close">
                    Schliessen
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>




    </div>



  </jsp:body>
</t:stdTempl>

