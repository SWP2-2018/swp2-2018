<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText" fragment="true" %>


<nav class="navbar navbar-expand-md navbar-dark sticky-top">
  <div class="container-fluid">

    <!-----Ueberschrift----->
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

            String[] pages = (String[]) request.getAttribute("pages");
            String[] bez = (String[]) request.getAttribute("bez");
            String[] icon = (String[]) request.getAttribute("icon");

            //Alle anderen Buttons
            for (int i = 0; i < pages.length; i++) {
              ausgabe = ausgabe + "<li class=\"nav-item\"> <a class=\"nav-link";
              if (request.getAttribute("page").toString().equals(pages[i])) {
                ausgabe = ausgabe + " disabled";
              }
              ausgabe = ausgabe + "\" href=\"" + pages[i] + ".jsp\"><i class=\"fa fa-" + icon[i] + "\">" + bez[i] + "</i></a></li>";
            }
            //Einstellungen DropDown Menue und Logout Button
            ausgabe = ausgabe
              + " <li class=\"dropdown\"> <a class=\"btn nav-link\" type=\"button\" id=\"dropdownMenuButton\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
              + " <i class=\"fa fa-cogs\">   Einstellungen </i> </a>"
              + " <div class=\"dropdown-menu \" aria-labelledby=\"dropdownMenuButton\">"
              + " <a class=\"dropdown-item \" data-toggle=\"modal\" data-target=\"#password_modal\">Passwort erneuern</a>"
              + " </div> </li>"
              + " <li class=\"nav-item\"> <a class=\"nav-link \" href=\"../logout.jsp\"><i class=\"fa fa-sign-out-alt\"> Logout - " + session.getAttribute("user").toString() + " </i> </a> </li>";
            request.setAttribute("anzeige", ausgabe);
          }

        %>

        ${anzeige}


      </ul>
    </div>

    <div class="modal" id="password_modal">
      <div class="modal-header">
        <h3>Change Password <span class="extra-title muted"></span></h3>
      </div>
      <div class="modal-body form-horizontal">
        <div class="control-group">
          <label for="current_password" class="control-label">Current Password</label>
          <div class="controls">
            <input name="current_password" type="password">
          </div>
        </div>
        <div class="control-group">
          <label for="new_password" class="control-label">New Password</label>
          <div class="controls">
            <input name="new_password" type="password">
          </div>
        </div>
        <div class="control-group">
          <label for="confirm_password" class="control-label">Confirm Password</label>
          <div class="controls">
            <input name="confirm_password" type="password">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button href="#" class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button href="#" class="btn btn-primary" id="password_modal_save">Save changes</button>
      </div>
    </div>
    <jsp:doBody/>
  </div>
</nav>
