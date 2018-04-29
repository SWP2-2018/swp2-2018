<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","newReports");
%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Neue Berichte</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neue Berichte</jsp:attribute>
    </t:navbar>
  </jsp:body>
</t:stdTempl>

