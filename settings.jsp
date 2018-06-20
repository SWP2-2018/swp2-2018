<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp" %>




<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "settings");

  //Registerbutton nur beim Ausbilder erstellen
  pageContext.setAttribute("register", "");
  if (Integer.parseInt(session.getAttribute("instructor").toString()) == 1) {
    pageContext.setAttribute("register", "<form id=\"register\" action=\"instructor/register.jsp\" method=\"post\">\n" +
      "  <input type =\"Submit\" name=\"SubmitType\" id=\"trainee\" value=\"Azubi Registrieren\" class=\"btn btn-block btn-setting\">\n" +
      "  <input type =\"Submit\" name=\"SubmitType\" id=\"instructor\" value=\"Ausbilder Registrieren\" class=\"btn btn-block btn-setting\">\n" +
      "</form></br>");
  }

  //Mitteilung ob eine aendern des Passwortes erfolgreich wer oder nicht.
  String data = (String) session.getAttribute("settingsData");
  String message = "";
  if (data != null) {
    if (data.equals("badPWData")) {//Bei schlechten Daten beim PW Change
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\nEin <strong>Passwort</strong> war falsch!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if (data.equals("goodPWData"))//Bei guten Daten beim PW Change
    {
      message += "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\nPasswort erfolgreich ge&aumlndert"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if (data.equals("goodREGData"))//Bei erfolgreichen Registrieren
    {
      message += "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n<strong>User</strong> erfolgreich Registriert"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    }
  }

  String errdata = (String) session.getAttribute("error");
  if (errdata != null) {
    if (errdata.equals("pwERROR")) {//Passwort stimmt nicht mit Passwortwiederholen überein
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n<strong>Passwort</strong> wurde falsch wiederholt!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if(errdata.equals("userERROR")){//User könnte nicht Erstellt werden
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n"
        + "<strong>Registrierung</strong> des Users fehlgeschlagen!\nBitte wiederholen!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    }
  }

  pageContext.setAttribute("message", message);
  session.removeAttribute("settingsData");//Daten nach Prüfung leeren.
  session.removeAttribute("error");
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Einstellungen</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Einstellungen</jsp:attribute>
    </t:navbar>

    <div class="container inForm">
        ${message}
        ${register}
          <button type="button" class="btn btn-block btn-setting" data-toggle="modal"
             data-target="#password-modal" name="btn-changePw">Passwort &aumlndern</button>
    </div>

    <!--Modal Passwordaendern -->
    <div class="modal hide" id="password-modal">
      <div class="container pwModal inForm">
        <form action="scripts/passwordChangeCheck.jsp" method="post" autocomplete="off">
          <div class=" justify-content-lg-center inForm">
            <!---  <div class="col-12 col-sm-10 col-md-8 ">--->
            <div class="form-group">
              <h2 class="modaltitle">Password &auml;ndern</h2>
            </div>
            <div class="form-group">
              <hr/>
            </div>
            <!------ Passwort eingabe ---------->
            <div class="form-group">
              <input type="password" name="oldpassword" class="form-control "
                     placeholder="Altes Passwort" required>
            </div>
            <div class="form-group">
              <input type="password" name="password" class="form-control "
                     placeholder="Neues Passwort" required>
            </div>
            <div class="form-group">
              <input type="password" name="confirmPassword" class="form-control "
                     placeholder="Wiederhole Passwort" required>
            </div>


            <!------ Buttons am Ende ---------->
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="form-group">
                  <button type="submit" class="btn btn-block btn-setting" name="pwSave" id="pwSave" value="Submit">
                    Speichern
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

  </jsp:body>
</t:stdTempl>
