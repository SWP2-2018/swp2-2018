<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "settings");

  //Registerbutton nur beim Ausbilder erstellen
  pageContext.setAttribute("register", "");
  if (Integer.parseInt(session.getAttribute("instructor").toString()) == 1) {
    pageContext.setAttribute("register", "<a href=\"register.jsp\" type=\"button\" class=\"btn btn-block btn-setting\" name=\"btn-login\">Registrierung</a>");
  }
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Einstellungen</jsp:attribute>
  <jsp:body>
    <t:navbar>

      <jsp:attribute name="navText">Einstellungen</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>

    <div class="container inForm">
        ${register}
    </div>


  </jsp:body>
</t:stdTempl>
