<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText" fragment="true" %>


<!--Modal Passwordaendern -->
<div class="modal hide" id="password-modal">
  <div class="container pwModal inForm">
    <form action="" method="post">
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
          <input type="password" name="password" id="password" class="form-control "
                 placeholder="Neues Passwort" required>
        </div>
        <!------ Buttons am Ende ---------->
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="form-group">
              <button type="submit" class="btn btn-block btn-primary" name="pwSave" id="pwSave" value="Submit">Speichern
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


<!-----Nav Bar----->
<nav class="navbar navbar-expand-md navbar-dark sticky-top">
  <div class="container-fluid">



    <a class="navbar-brand" href="">
      <jsp:invoke fragment="navText"/>
    </a>

    <div class="navbar-header">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
              aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

    </div>

    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav ml-auto">


        <%
          if (request.getAttribute("page").toString() == null) {
            response.sendRedirect("error.jsp");
          }

          String ausgabe = "";

          if (!(request.getAttribute("page").toString().equals("login") || request.getAttribute("page").toString().equals("logout"))) {


            if (session.getAttribute("instructor").toString().equals("0")) {
              request.setAttribute("pages", new String[]{"userPageTrainee", "allReportsPage", "allCorrectionPage"});
              request.setAttribute("bez", new String[]{" &Uuml;bersicht", " Alle Berichte", " Korrektur"});
              request.setAttribute("icon", new String[]{"user", "clipboard-list", "redo-alt"});

            } else if (session.getAttribute("instructor").toString().equals("1")) {
              request.setAttribute("pages", new String[]{"userPageInstructor", "newReportsPage", "allTraineesPage"});
              request.setAttribute("bez", new String[]{" &Uuml;bersicht", " Neue Berichte", " Auszubildende"});
              request.setAttribute("icon", new String[]{"user", "clipboard", "users"});

            } else {
              response.sendRedirect("error.jsp");
            }

            request.setAttribute("folder", "");

            if(request.getAttribute("page").toString().equals("editReport")){
              if(Integer.parseInt(session.getAttribute("instructor").toString()) == 0){
                request.setAttribute("folder", "trainee/");
              }else{
                request.setAttribute("folder", "instructor/");
              }
            }

            String[] pages = (String[]) request.getAttribute("pages");
            String[] bez = (String[]) request.getAttribute("bez");
            String[] icon = (String[]) request.getAttribute("icon");

            //Alle anderen Buttons
            for (int i = 0; i < pages.length; i++) {
              ausgabe = ausgabe + "<li class=\"nav-item\"> <a class=\"nav-link";
              if (request.getAttribute("page").toString().equals(pages[i])) {
                ausgabe = ausgabe + " disabled";
              }
              ausgabe = ausgabe + "\" href=\"" + request.getAttribute("folder").toString() + pages[i] +
                ".jsp\"><i class=\"fa fa-" + icon[i] + "\">" + bez[i] + "</i></a></li>";
            }
            //Einstellungen DropDown Menue und Logout Button
            ausgabe = ausgabe
              + " <li class=\"dropdown\"> "
              + " <a class=\"nav-link\" type=\"button\" id=\"dropdownMenuButton\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
              + " <i class=\"fa fa-cogs\"> Einstellungen </i> </a>"
              + " <div class=\"dropdown-menu \" aria-labelledby=\"dropdownMenuButton\">"
              + " <a class=\"dropdown-item btn\" data-toggle=\"modal\" data-target=\"#password-modal\">Passwort erneuern</a>"
              + " </div> </li>"
              + " <li class=\"nav-item\"> <a class=\"nav-link \" href=\"../logout.jsp\"><i class=\"fa fa-sign-out-alt\"> Logout - " + session.getAttribute("user").toString() + " </i> </a> </li>";
            request.setAttribute("anzeige", ausgabe);
          }

        %>

        ${anzeige}


      </ul>
    </div>
    <jsp:doBody/>

  </div>
</nav>


