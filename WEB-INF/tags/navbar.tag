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
        <%
        if(session.getAttribute("username").toString().equals("azubi")){

          if(request.getAttribute("page").toString()!="userPage"){
        %>
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
          if(request.getAttribute("page").toString()!="correctionPage"){
        %>
        <li class="nav-item">
          <a class="nav-link" href="correctionPage.jsp"><i class="fa fa-cog" ></i>Korrektur</a>
        </li>
        <%
          }
        %>

          <li class="nav-item">
            <a class="nav-link" href="logout.jsp"><i class="fa fa-cog" ></i>Logout - ${name}</a>
          </li>
        <%
        }
        else{
        %>
          <li class="nav-item">
            <a class="nav-link" href="allReports.jsp"><i class="fa fa-cog" ></i>Alle Berichte</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="userPageTrainee.jsp"><i class="fa fa-cog" ></i>Auszubildende-Test</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.jsp"><i class="fa fa-cog" ></i>Logout - ${name}</a>
          </li>
        <%
        }
        %>
        <jsp:doBody/>
      </ul>
    </div>

  </div>
</nav>
