<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>


<!-- Setzte Attribute Page für die navbar -->
<%
  session.removeAttribute("email");
  session.removeAttribute("password");
  session.invalidate();
  response.sendRedirect("../login.jsp");
%>
