<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="tablePojos.Report" %>

<%@ page import ="java.util.List"%>

<%@ page import="services.ReportService" %>
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
    ausgabe = ausgabe + "<a href=\"newReport.jsp\" class=\"list-group-item list-group-item-action";
    if(lrs.get(i).getStatus() == 1){
      ausgabe = ausgabe + " list-group-item-warning";
    }
    else if(lrs.get(i).getStatus() == 2){
      ausgabe = ausgabe + " list-group-item-danger";
    }
    ausgabe = ausgabe + " text-center\">" + lrs.get(i).getDate() + "</a>";
  }

  request.setAttribute("berichte", ausgabe);

 // request.setAttribute("bericht", "<a href=\"newReport.jsp\" class=\"list-group-item list-group-item-action\">Bericht</a>");
 // request.setAttribute("bWarning", "<a href=\"#\" class=\"list-group-item list-group-item-action list-group-item-warning\">Bericht</a>");
 // request.setAttribute("bDanger", "<a href=\"#\" class=\"list-group-item list-group-item-action list-group-item-danger\">Bericht</a>");
  //col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-4
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

