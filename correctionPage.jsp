<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","correctionPage");
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Korrekturen</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Korrekturen</jsp:attribute>
    </t:navbar>
    <div class=" col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-4  "  >
      <ul class="list-group ">
        <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Bericht</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Bericht</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-warning">Bericht</a>
        <a href="#" class="list-group-item list-group-item-action list-group-item-danger">Bericht</a>

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

