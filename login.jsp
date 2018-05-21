<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "login");

  //Mitteilung falls Daten beim einloggen nicht gepasst haben.
  String data = (String) session.getAttribute("messageData");
  String message="";
  if (data != null) {
    if (data.equals("badData")) {//Bei schlechten Daten
      message += "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n<strong>Username</strong> oder <strong>Passwort</strong> war falsch!"
        + "\n<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n<span aria-hidden=\"true\">\n&times;\n</span>\n"
        + "</button>\n</div>\n";
    }
  }
  pageContext.setAttribute("message", message);
  session.removeAttribute("messageData");//Daten nach Prüfung löschen.

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
    </div>



  </jsp:body>
</t:stdTempl>

