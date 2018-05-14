<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


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
    <h1>Logout was done successfully.</h1>
    You will be redirected in a few seconds.
  </jsp:body>
</t:stdTempl>

<%
  session.removeAttribute("user");
  session.removeAttribute("password");
  session.invalidate();
  response.setHeader("Refresh", "3;url=index.jsp");
%>
