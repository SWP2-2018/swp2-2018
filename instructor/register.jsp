<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "register");

  if(session.getAttribute("instructor").toString().equals("0")) {
    response.sendRedirect("../error.jsp");
  }

  if(request.getParameter("SubmitType").toString().equals("Azubi Registrieren")){
    pageContext.setAttribute("type", "Azubi");
    pageContext.setAttribute("eduYears", "<div class=\"row\">\n" +
      "              <div class=\"col-xs-12 col-sm-6 col-md-6\">\n" +
      "                <div class=\"form-group form-inline\">\n" +
      "                  <label class=\"control-label col-4\" id=\"educationYears\">Startdatum</label>\n" +
      "                  <div class=\"col-xs-12 col-sm-6 col-md-6\">\n" +
      "                    <input type=\"date\" name=\"start_date\" id=\"start_date\" class=\"form-control input\" required>\n" +
      "                  </div>\n" +
      "                </div>\n" +
      "              </div>\n" +
      "              <div class=\"col-xs-12 col-sm-6 col-md-6\">\n" +
      "                <div class=\"form-group\">\n" +
      "                  <input class=\"form-control input \" type=\"number\" min=\"0\" name=\"educational_year\" id=\"educational_year\"\n" +
      "                         placeholder=\"Ausbildungs Jahr\">\n" +
      "                </div>\n" +
      "              </div>\n" +
      "            </div>");
  }else{
    pageContext.setAttribute("type", "Ausbilder");
    pageContext.setAttribute("eduYears", "<input type=\"hidden\" name=\"start_date\" id=\"start_date\" value=\"1900-01-01\" >\n" +
      "<input type=\"hidden\" name=\"educational_year\" id=\"educational_year\" value=\"0\">");
  }

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
            <h2 class="">Neuen ${type} Anlegen</h2>
          </div>
          <!------ Auswahl Azubi/Ausbilder ---------->
          <input type="hidden" name="type" id="type_User" value="${type}">
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
                     placeholder="Email" required>
            </div>

            <!------ Startdatum eingabe und Ausbildungs Jahr ---------->
            ${eduYears}
            <!------  eingabe ---------->

            <div class="form-group">
              <input class="form-control input " type="number" min="0" name="instructor_id" id="instructor_id"
                     placeholder="ID des Ausbildungsbereichs">
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
