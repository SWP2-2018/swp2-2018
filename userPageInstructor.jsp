<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page","userPageI");
%>

<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Übersicht</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>

  </jsp:body>
</t:stdTempl>

