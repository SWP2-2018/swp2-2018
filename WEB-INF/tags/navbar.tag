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
        <jsp:doBody/>
      </ul>
    </div>

  </div>
</nav>
