<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ page import ="java.util.List"%>

<%@ page import="services.ReportService" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "allReportsPage");

  ReportService rs = new ReportService();
  UserService us = new UserService();

  User user = us.getByUserName(session.getAttribute("user").toString());

  List<Report> lrs = rs.getAllByUserId(user.getId());

  String ausgabe = "";

  for (int i = 0; i < lrs.size(); i++) {
    ausgabe = ausgabe + "<form id=\"reports\" action=\"newReport.jsp\" method=\"post\">";
    ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(i).getId() + "\" />";
    ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(i).getStatus() + "\" />";
    ausgabe = ausgabe + "<input type =\"Submit\" name=\"Date\" value=\"Wochenbericht vom " + lrs.get(i).getDate() + "\"class=\"list-group-item list-group-item-action";
    if(lrs.get(i).getStatus() == 1){
      ausgabe = ausgabe + " list-group-item-warning";
    }
    else if(lrs.get(i).getStatus() == 2){
      ausgabe = ausgabe + " list-group-item-danger";
    }
    ausgabe = ausgabe + " text-center\">";
    ausgabe = ausgabe + "</form>";
  }

  request.setAttribute("berichte", ausgabe);

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

        ${berichte}

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

