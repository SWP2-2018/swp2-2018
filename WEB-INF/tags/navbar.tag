<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText" fragment="true" %>


<nav class="navbar navbar-expand-md navbar-dark sticky-top">
  <div class="container-fluid">

    <!-----Ueberschrift----->
    <a class="navbar-brand" href=""><jsp:invoke fragment="navText"/></a>

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

          String[] tmp = {"userPageTrainee", "allReportsPage", "allCorrectionPage"};
          request.setAttribute("pagesTr", tmp);
          tmp = new String[]{"&Uuml;bersicht", "Alle Berichte", "Korrektur"};
          request.setAttribute("bezTr", tmp);
          tmp = new String[]{"userPageInstructor", "newReportsPage", "allTraineesPage"};
          request.setAttribute("pagesIn", tmp);
          tmp = new String[]{"&Uuml;bersicht", "Neue Berichte", "Auszubildende"};
          request.setAttribute("bezIn", tmp);

          String ausgabe = "";

          if(!(request.getAttribute("page").toString().equals("login") || request.getAttribute("page").toString().equals("logout"))){

            String[] pages = new String[1];
            String[] bez = new String[1];


            if (session.getAttribute("instructor").toString().equals("0")) {
              pages = (String[]) request.getAttribute("pagesTr");
              bez = (String[]) request.getAttribute("bezTr");

            }else if(session.getAttribute("instructor").toString().equals("1")){
              pages = (String[]) request.getAttribute("pagesIn");
              bez = (String[]) request.getAttribute("bezIn");
            }

            if(pages.length != 1) {
              for (int i = 0; i < pages.length; i++) {
                ausgabe = ausgabe + "<li class=\"nav-item\"> <a class=\"nav-link";
                if (request.getAttribute("page").toString().equals(pages[i])) {
                  ausgabe = ausgabe + " disabled";
                }
                ausgabe = ausgabe + "\" href=\"" + pages[i] + ".jsp\"><i class=\"fa fa-user\"></i>" + bez[i] + "</a>";
              }
            }
            ausgabe = ausgabe + " <li class=\"nav-item\"> <a class=\"nav-link \" href=\"../logout.jsp\"><i class=\"fa fa-sign-out-alt\"> </i> Logout - " + session.getAttribute("user").toString() + "</a> </li>";
            request.setAttribute("anzeige", ausgabe);
          }

        %>

        ${anzeige}

      </ul>
    </div>
    <jsp:doBody/>
  </div>
</nav>
