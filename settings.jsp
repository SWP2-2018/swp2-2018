<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "settings");

  //Registerbutton nur beim Ausbilder erstellen
  pageContext.setAttribute("register", "");
  if (Integer.parseInt(session.getAttribute("instructor").toString()) == 1) {
    pageContext.setAttribute("register", "<a href=\"register.jsp\" type=\"button\" class=\"btn btn-block btn-setting\" name=\"btn-register\">Registrierung</a>");
  }

  //Mitteilung ob eim aendern des Passwortes erfolgreich wer oder nicht.
  String data = (String) session.getAttribute("messageData");
  String message="";
  if (data != null) {
    if (data.equals("badData")) {//Bei schlechten Daten
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">Ein <strong>Passwort</strong> war falsch!"
        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span>"
        + "</button></div>";
    }
    else if(data.equals("goodData"))//Bei guten Daten
    {
      message += "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">Passwort erfolgreich ge&aumldert"
        + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span>"
        + "</button></div>";
    }

  }
  pageContext.setAttribute("message", message);
  session.setAttribute("messageData", null);//Daten nach Prüfung auf leeren.

%>

<!--Modal Passwordaendern -->
<div class="modal hide" id="password-modal">
  <div class="container pwModal inForm">
    <form action="scripts/passwordChangeCheck.jsp" method="post" autocomplete="off">
      <div class=" justify-content-lg-center inForm">
        <!---  <div class="col-12 col-sm-10 col-md-8 ">--->
        <div class="form-group">
          <h2 class="">Password &auml;ndern</h2>
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
              <button type="submit" class="btn btn-block btn-setting" name="pwSave" id="pwSave" value="Submit">Speichern
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


<t:stdTempl>
  <jsp:attribute name="titleText"> - Einstellungen</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Einstellungen</jsp:attribute>
    </t:navbar>

    <div class="container inForm">
        ${register}

      <a href="register.jsp" type="button" class="btn btn-block  btn-setting" data-toggle="modal"
         data-target="#password-modal" name="btn-changePw">Passwort &aumlndern</a>
        ${message}


    </div>

  </jsp:body>
</t:stdTempl>
