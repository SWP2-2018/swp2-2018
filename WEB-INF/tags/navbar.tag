<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText"%>

<%@tag import="services.UserService" %>
<%@tag import="tablePojos.User" %>

<!-----Nav Bar----->
<nav class="navbar navbar-expand-md navbar-dark sticky-top">
  <div class="container-fluid">

    <a class="navbar-brand" >
      <div class="navbar-title">
        <img src="../style/icons/icon.svg"   width="60">
        ${navText}
      </div>
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
          if (request.getAttribute("page").toString() != null) {
            String ausgabe = "";

            if (!(request.getAttribute("page").toString().equals("login") || request.getAttribute("page").toString().equals("logout"))) {
              try (UserService us = new UserService()) {
                User user = us.getByEmail(session.getAttribute("email").toString());

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

                if (request.getAttribute("page").toString().equals("editReport")
                  || request.getAttribute("page").toString().equals("settings")
                  || request.getAttribute("page").toString().equals("legalNotice")){

                  if (Integer.parseInt(session.getAttribute("instructor").toString()) == 0) {
                    request.setAttribute("folder", "trainee/");
                  } else {
                    request.setAttribute("folder", "instructor/");
                  }
                }

                String[] pages = (String[]) request.getAttribute("pages");
                String[] bez = (String[]) request.getAttribute("bez");
                String[] icon = (String[]) request.getAttribute("icon");

                //Alle anderen Buttons
                for (int i = 0; i < pages.length; i++) {
                  ausgabe += "<li class=\"nav-item\">\n<a class=\"nav-link";
                  if (request.getAttribute("page").toString().equals(pages[i])) {
                    ausgabe += " disabled";
                  }
                  ausgabe += "\" href=\"" + request.getAttribute("folder").toString() + pages[i] +
                    ".jsp\">\n<i class=\"fa fa-" + icon[i] + "\">\n</i>" + bez[i] + "</a>\n</li>";
                }
                //Einstellungen DropDown Menue und Logout Button
                ausgabe += " <li class=\"nav-item\">\n <a class=\"nav-link\" href=\"../settings.jsp\"><i class=\"fa fa-cogs\"> </i> Einstellungen</a>\n </li>\n"
                  + " <li class=\"nav-item\">\n <a class=\"nav-link\" href=\"../scripts/logout.jsp\">\n<i class=\"fa fa-sign-out-alt\">\n</i>\n<strong>  Logout - "
                  + user.getLast_name() + " </strong>\n</a>\n</li>\n";
                request.setAttribute("anzeige", ausgabe);
              }
            }
          }else {
            response.sendRedirect("error.jsp");
          }
        %>

        ${anzeige}

      </ul>
    </div>
    <jsp:doBody/>
  </div>
</nav>

