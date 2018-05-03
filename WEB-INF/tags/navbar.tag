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


        <!-- Legt die Listenelemente der navbar je nach Seite(page) und User(Azubi/Auszubildender) fest. -->
        <!--Sollte eine Seite ohne Attribute aufgerufen das eine navbar haben sollte wird auf die error.jsp weitergeleitet -->
        <%
          if (request.getAttribute("page").toString() == null) {
        %>
        response.sendRedirect("error.jsp");
        <%
          }
          // Überprüfe ob der User einem Azubi (instructor == 0) enspricht
          if (session.getAttribute("instructor").toString().equals("0")) {
        %>

        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("userPageT")) {
        %>
          disabled
        <%
          }
        %>
         " href=" userPageTrainee.jsp"><i class="fa fa-user"></i> &Uuml;bersicht</a>
        </li>
        <!-----Ende eines Elements----->


        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("allReportsPage")) {
        %>
          disabled
        <%
          }
        %>
         " href=" allReportsPage.jsp"><i class="fa fa-clipboard-list "></i> Alle Berichte</a>
        </li>
        <!-----Ende eines Elements----->


        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("correctionPage")) {
        %>
          disabled
        <%
          }
        %>
         " href=" allCorrectionPage.jsp"><i class="fa fa-redo-alt"></i> Korrektur</a>
        </li>
        <!-----Ende eines Elements----->


        <%
          //Die Elemente für einen Ausbilder(instructor == 1)
        } else if (session.getAttribute("instructor").toString().equals("1")) {

        %>


        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("userPageI")) {
        %>
          disabled
        <%
          }
        %>
         " href=" userPageInstructor.jsp"><i class="fa fa-user"></i> &Uuml;bersicht</a>
        </li>
        <!-----Ende eines Elements----->


        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("newReports")) {
        %>
          disabled
        <%
          }
        %>
         " href=" newReportsPage.jsp"><i class="fa fa-clipboard"></i> Neue Berichte</a>
        </li>
        <!-----Ende eines Elements----->


        <!-----Start eines Elements----->
        <li class="nav-item">
          <a class="nav-link
        <%
          //Disabled Listenelemente im falle das die dazugehörende Seite angezeigt wird.
          if (request.getAttribute("page").toString().equals("allTrainees")) {
        %>
          disabled
        <%
          }
        %>
         " href=" allTraineesPage.jsp"><i class="fa fa-users"></i> Auszubildende</a>
        </li>
        <!-----Ende eines Elements----->

        <%
          }
        %>

        <!-----Elemente die alle benötigen----->
        <li class="nav-item">
          <a class="nav-link " href="../logout.jsp"><i class="fa fa-sign-out-alt"></i> Logout - ${user}</a>
        </li>

      </ul>
    </div>
    <jsp:doBody/>
  </div>
</nav>
