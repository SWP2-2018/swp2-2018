<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ page import ="java.util.List"%>

<%@ page import="services.ReportService" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>

<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","newReportsPage");

  ReportService rs = new ReportService();
  UserService us = new UserService();

  User uInstructor = us.getByUserName(session.getAttribute("user").toString());

  List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getId());

  String ausgabe = "";

  for (int i = 0; i < lTraineeUsers.size(); i++) {
    List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());

    if(lrs.size() > 0){

      for (int j = 0; j < lrs.size(); j++) {
        ausgabe = ausgabe + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">";
        ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(j).getId() + "\" />";
        ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(j).getStatus() + "\" />";
        ausgabe = ausgabe + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht: " + lTraineeUsers.get(i).getLast_name() +
          ", " + lrs.get(j).getDate() +  "\"class=\"list-group-item list-group-item-action list-group-item-primary text-center\"></form>";
      }
    }
  }

  request.setAttribute("berichte", ausgabe);


%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Neue Berichte</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neue Berichte</jsp:attribute>
    </t:navbar>
    <div class="inForm">
      <ul class="list-group">

          ${berichte}

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

