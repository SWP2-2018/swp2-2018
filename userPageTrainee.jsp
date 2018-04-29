<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>



 <%
  if (session.getAttribute("username")!=null) {
    String name = session.getAttribute("username").toString();
    request.setAttribute("name",name);
  }else{
    response.sendRedirect("error.jsp");
  }
%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Übersicht</jsp:attribute>
      <jsp:body>
        <li class="nav-item">
          <a class="nav-link" href="allReports.jsp"><i class="fa fa-cog" ></i>Alle Berichte</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp"><i class="fa fa-cog" ></i>Logout - ${name}</a>
        </li>

      </jsp:body>
    </t:navbar>

  </jsp:body>
</t:stdTempl>

