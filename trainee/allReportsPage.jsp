<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import ="java.util.List"%>
<%@page import="java.util.ArrayList" %>

<%@page import="services.ReportService" %>
<%@page import="tablePojos.Report" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>


<%
  //Setz Attribut für die navbar
  request.setAttribute("page", "allReportsPage");

  try(ReportService rs = new ReportService(); UserService us = new UserService()) {

    User user = us.getByEmail(session.getAttribute("email").toString());

    //Liste mit allen Reports des Users
    List<Report> lrs = rs.getAllByUserId(user.getId());

    List<List<Report>> allListReports = new ArrayList();
    allListReports.add(lrs);

    request.setAttribute("listReports", allListReports);
  }
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Alle Berichte</jsp:attribute>
  <jsp:body>
    <t:navbar>

      <jsp:attribute name="navText">Alle Berichte</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>
    <div class="inForm">
      <ul class="list-group">

        <t:formList>
          <jsp:attribute name="formList">0</jsp:attribute>
        </t:formList>


      </ul>
      <div>
        <br><br><hr>
      </div>
      <div>
        <div class="col-md-3"></div>
        <div class="col-md-6">
          <p class="list-group-item-success">Angenommene Berichte</p>
          <p class="list-group-item-primary">Offene Berichte</p>
          <p class="list-group-item-danger">Abgelehnte Berichte</p>
          <p class="list-group-item-warning">Abgegebene Berichte</p>
        </div>
        <div class="col-md-3">
        </div>
      </div>
    </div>

  </jsp:body>
</t:stdTempl>

