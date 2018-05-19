<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp"%>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "logout");
%>
<t:stdTempl>
  <jsp:attribute name="titleText"> - Logout</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Logout</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>
    </br>
    <p class="h1 text-center">Logout was done successfully.</p>
    <p class="text-center">You will be redirected in a few seconds.</p>
  </jsp:body>
</t:stdTempl>

<%
  session.removeAttribute("user");
  session.removeAttribute("password");
  session.invalidate();
  response.setHeader("Refresh", "3;url=login.jsp");
%>
