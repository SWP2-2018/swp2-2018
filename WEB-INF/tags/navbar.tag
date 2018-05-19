<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText"%>

<!-----Nav Bar----->
<nav class="navbar navbar-expand-md navbar-dark sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="">
      <img src="../style/icons/icon.svg" class="img-rounded"  height="50">
      ${navText}
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
                ||request.getAttribute("page").toString().equals("register")
                ||request.getAttribute("page").toString().equals("settings"))
              {

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
                ausgabe = ausgabe + "<li class=\"nav-item\"> <a class=\"nav-link";
                if (request.getAttribute("page").toString().equals(pages[i])) {
                  ausgabe = ausgabe + " disabled";
                }
                ausgabe = ausgabe + "\" href=\"" + request.getAttribute("folder").toString() + pages[i] +
                  ".jsp\"><i class=\"fa fa-" + icon[i] + "\"></i>"+ bez[i] +"</a></li>";
              }
              //Einstellungen DropDown Menue und Logout Button
              ausgabe = ausgabe
                + " <li class=\"nav-item\"> <a class=\"nav-link\" href=\"../settings.jsp\"><i class=\"fa fa-cogs\"> </i> Einstellungen</a> </li>"
                + " <li class=\"nav-item\"> <a class=\"nav-link\" href=\"../logout.jsp\"><i class=\"fa fa-sign-out-alt\"> </i><strong>  Logout - " + session.getAttribute("user").toString() + " </strong></a> </li>";
              request.setAttribute("anzeige", ausgabe);
            }
          }
          else{
            response.sendRedirect("error.jsp");
          }

        %>

        ${anzeige}


      </ul>
    </div>
    <jsp:doBody/>

  </div>
</nav>


