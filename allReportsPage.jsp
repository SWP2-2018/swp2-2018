<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>



<%
  request.setAttribute("page","allReports");
%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Alle Berichte</jsp:attribute>
  <jsp:body>
    <t:navbar>

      <jsp:attribute name="navText">Alle Berichte</jsp:attribute>
      <jsp:body>
        <head>
          <style>
            .berichte{
              visibility: hidden;
            @include invisible;
            }
          </style>
        </head>
      </jsp:body>
    </t:navbar>

    <div class="panel panel-primary" id="result_panel">
      <div class="panel-body">
        <ul class="list-group">

          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Bericht</a>
          <a href="#" class="list-group-item list-group-item-action">Bericht</a>
        </ul>
      </div>
    </div>
  </jsp:body>
</t:stdTempl>

