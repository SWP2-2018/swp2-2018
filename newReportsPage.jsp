<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","newReports");
%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Neu Berichte</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Neu Berichte</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>

  </jsp:body>
</t:stdTempl>

