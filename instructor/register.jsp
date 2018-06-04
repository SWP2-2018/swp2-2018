<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "register");

  if(session.getAttribute("instructor").toString().equals("0")) {
    response.sendRedirect("error.jsp");
  }

  String data = (String) session.getAttribute("error");
  String message="";
  if (data != null) {
    if (data.equals("pwERROR")) {//Passwort stimmt nicht mit Passwortwiederholen überein
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n<strong>Passwort</strong> wurde falsch wiederholt!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    } else if(data.equals("userERROR")){//User könnte nicht Erstellt werden
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n"
        + "<strong>Regestrierung</strong> des Users fehlgeschlagen!\nBitte wiederholen!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    }
  }
  pageContext.setAttribute("message", message);
  session.removeAttribute("error");

%>
<t:stdTempl>
  <jsp:attribute name="titleText"> - register</jsp:attribute>
  <jsp:body>
    <t:navbar>

      <jsp:attribute name="navText">Einstellungen</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>

    <div class="container inForm">

      <div id="register-form">

        <form action="../scripts/registerCheck.jsp" method="post" autocomplete="off">


          <div class="form-group">
            <h2 class="">Neuen Benutzer Anlegen</h2>
          </div>
          <!------ Auswahl Azubi/Ausbilder ---------->
          <div class="form-group ">
            <div class="btn-group btn-group-toggle" data-toggle="buttons" required>
              <label class="btn btn-outline-secondary  active">
                <input type="radio" name="options" value="trainee" checked> Azubi
              </label>
              <label class="btn btn-outline-secondary ">
                <input type="radio" name="options" value="instructor"> Ausbilder
              </label>
            </div>
            <div class="form-group">
              <hr/>
            </div>

            ${message}

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
              <input type="text" name="job" id="job" class="form-control input"
                     placeholder="Beruf" required>
            </div>
            <div class="form-group">
              <input type="text" name="user" id="user" class="form-control input"
                     placeholder="e-Mail" required>
            </div>

            <!------ Startdatum eingabe und Ausbildungs Jahr ---------->
            <div class="row">
              <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="form-group form-inline">
                  <label class="control-label col-4">Startdatum</label>
                  <div class="col-xs-12 col-sm-6 col-md-6">
                    <input type="date" name="start_date" id="start_date" class="form-control input" required>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="form-group">
                  <input class="form-control input " type="number" min="0" name="educational_year" id="educational_year"
                         placeholder="Ausbildungs Jahr">
                </div>
              </div>
            </div>
            <!------  eingabe ---------->

            <div class="form-group">
              <input class="form-control input " type="number" min="0" name="instructor_id" id="instructor_id"
                     placeholder="Ausbilder ID">
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
                  <input type="password" name="confirmPassword" id="confirmPassword" class="form-control input-lg"
                         placeholder="Passwort wiederholen" required>
                </div>
              </div>

            <!------ Buttons am Ende ---------->
            <div class="form-group">
              <hr/>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-block btn-primary" name="register" id="register">Registrieren
              </button>
            </div>
          </div>

        </form>

      </div>
    </div>


  </jsp:body>
</t:stdTempl>
