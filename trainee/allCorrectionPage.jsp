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

  List<Report> lrs = rs.getAllByStatusAndUserID(3, user.getId());

  String ausgabe = "";

  for (int i = 0; i < lrs.size(); i++) {
    ausgabe = ausgabe + "<form id=\"reports\" action=\"editReport.jsp\" method=\"post\">";
    ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(i).getId() + "\" />";
    ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(i).getStatus() + "\" />";
    ausgabe = ausgabe + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht vom " + lrs.get(i).getDate() +
      "\"class=\"list-group-item list-group-item-action list-group-item-danger text-center\"></form>";
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

