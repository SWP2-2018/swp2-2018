<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ page import="tablePojos.Report" %>

<%@ page import ="java.util.List"%>

<%@ page import="services.ReportService" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>

<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","allCorrectionPage");

  ReportService rs = new ReportService();
  UserService us = new UserService();

  User user = us.getByUserName(session.getAttribute("user").toString());

  List<Report> lrs = rs.getAllByUserId(user.getId());

  String ausgabe = "";

  for (int i = 0; i < lrs.size(); i++) {
    if(lrs.get(i).getStatus() != 0) {
      ausgabe = ausgabe + "<a href=\"newReport.jsp\" class=\"list-group-item list-group-item-action";
      if (lrs.get(i).getStatus() == 1) {
        ausgabe = ausgabe + " list-group-item-warning";
      } else if (lrs.get(i).getStatus() == 2) {
        ausgabe = ausgabe + " list-group-item-danger";
      }
      ausgabe = ausgabe + " text-center\">" + lrs.get(i).getDate() + "</a>";
    }
  }

  request.setAttribute("bericht", ausgabe);
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Korrekturen</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Korrekturen</jsp:attribute>
    </t:navbar>
    <div class="inForm">
      <ul class="list-group">

        ${bericht}

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

