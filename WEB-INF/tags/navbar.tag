<%@tag description="navbar" pageEncoding="UTF-8" %>
<%@attribute name="navText" fragment="true" %>

<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">


  <div class="container-fluid">
    <a class="navbar-brand visible-xs-inline-block" href="">
      <jsp:invoke fragment="navText"/>
    </a>

    <div class="navbar-header">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
              aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

    </div>

    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav mr-auto">


        <!-- Legt die Listenelemente der navbar je nach Seite(page) und User(Azubi/Auszubildender) fest. -->
        <!--Sollte eine Seite ohne Attribute aufgerufen das eine navbar haben sollte wird auf die error.jsp weitergeleitet -->
        <%
          if(request.getAttribute("page").toString()==null) {
        %>
          response.sendRedirect("error.jsp");
        <%
          }

          // Überprüfe ob der User einem Azubi (instructor == 0) enspricht
        if(session.getAttribute("username").toString().equals("azubi")){

          //Lässt Listenelemente aus, je nachdem welchse Seite aufgerufen wird
          if(request.getAttribute("page").toString()!="userPageT"){
        %>
          <!-- Erzeugt Listenelement das auf die Bezeichnete Seite Verlinkt -->
          <li class="nav-item">
            <a class="nav-link" href="userPageTrainee.jsp"><i class="fa fa-cog" ></i>&Uuml;bersicht</a>
          </li>
        <%
          }
          if(request.getAttribute("page").toString()!="allReports"){
        %>
        <li class="nav-item">
          <a class="nav-link"  href="allReportsPage.jsp"><i class="fa fa-cog" ></i>Alle Berichte</a>
        </li>
        <%
          }
          if(request.getAttribute("page").toString()!="userPageI"){
        %>
        <li class="nav-item">
          <a class="nav-link" href="correctionPage.jsp"><i class="fa fa-cog" ></i>Korrektur</a>
        </li>
        <%
          }
            //Die Buttons für einen Ausbilder(instructor == 1)
        }else if (session.getAttribute("username").toString().equals("ausbilder")){
          if(request.getAttribute("page").toString()!="userPageI"){
            %>
            <li class="nav-item">
              <a class="nav-link" href="userPageInstructor.jsp"><i class="fa fa-cog" ></i>&Uuml;bersicht</a>
            </li>
            <%
              }
              if(request.getAttribute("page").toString()!="newReports"){
            %>
            <li class="nav-item">
              <a class="nav-link"  href="newReportsPage.jsp"><i class="fa fa-cog" ></i>Neue Berichte</a>
            </li>
            <%
              }
              if(request.getAttribute("page").toString()!="allTrainees"){
            %>
            <li class="nav-item">
              <a class="nav-link" href="allTraineesPage.jsp"><i class="fa fa-cog" ></i>Auszubildende</a>
            </li>
            <%
          }
        }
        %>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp"><i class="fa fa-cog" ></i>Logout - ${name}</a>
        </li>
        <jsp:doBody/>
      </ul>
    </div>

  </div>
</nav>
