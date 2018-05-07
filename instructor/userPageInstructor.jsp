<%@ page import="services.ReportService" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>


<%@ page import ="java.util.List"%>


<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "userPageInstructor");

  try(UserService us = new UserService()) {
  ReportService rs = new ReportService();


  User uInstructor = us.getByUserName(session.getAttribute("user").toString());

  List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getId());

  String openReportsList = "";

  for (int i = 0; i < lTraineeUsers.size(); i++) {
    List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());

    if(lrs.size() > 0){

      for (int j = 0; j < lrs.size(); j++) {
        openReportsList = openReportsList + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
         + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(j).getId() + "\" />"
         + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(j).getStatus() + "\" />"
         + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht: " + lTraineeUsers.get(i).getLast_name() +
          ", " + lrs.get(j).getDate() +  "\"class= \"col-xs-1 list-group-item list-group-item-action list-group-item-primary text-center\"></form>";
      }
    }
  }



  String[] cards = new String[]{"openReports"};
  String[] headline = new String[]{"Offene Berichte: "};
  String[] lists = new String[]{openReportsList};

  String output = "";


  //Accordeon Abschnitt zusammen setzen
  for (int i = 0; i <= cards.length - 1; i++) {
    output = output
      + "<div class=\"card\">"
      + "<div class=\"card-header btn-secondary btn\" id=\""
      + cards[i]
      + "\" data-toggle=\"collapse\" data-target=\"#collapse"
      + cards[i]
      + "\" aria-expanded=\"false\" aria-controls=\"collapseOpenReports\">"
      + "<a class=\"btn \">"
      + headline[i]
      + "</a></div>"
      + "<div id=\"collapse"
      + cards[i]
      + "\" class=\"collapse\" aria-labelledby=\""
      + cards[i]
      + "\" data-parent=\"#accordion\">"
      + "<div class=\"card-body\">"
      + lists[i]
      + "</div></div></div>"
    ;
  }
  request.setAttribute("cards", output);
  }
%>




<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Übersicht</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>
    <div id="accordion">
      <div class="userPageList">
          ${cards}
      </div>
    </div>


  </jsp:body>
</t:stdTempl>

