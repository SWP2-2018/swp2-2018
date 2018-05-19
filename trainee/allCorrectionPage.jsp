<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import ="java.util.List"%>
<%@page import="java.util.ArrayList" %>

<%@page import="services.ReportService" %>
<%@page import="services.UserService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>

<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","allCorrectionPage");

  ReportService rs = new ReportService();
  UserService us = new UserService();

  User user = us.getByUserName(session.getAttribute("user").toString());

  List<Report> lrs = rs.getAllByStatusAndUserID(3, user.getId());

  List<List<Report>> allListReports = new ArrayList<>();
  allListReports.add(lrs);

  request.setAttribute("listReports", allListReports);

%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Korrekturen</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Korrekturen</jsp:attribute>
    </t:navbar>
    <div class="inForm">
      <ul class="list-group">

        <t:formList>
          <jsp:attribute name="formList">0</jsp:attribute>
        </t:formList>

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

