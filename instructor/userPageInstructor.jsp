<%@ page import="services.ReportService" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>


<%@ page import ="java.util.List"%>
<%@ page import="services.ReportRevisionService" %>
<%@ page import="tablePojos.Report_Revision" %>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "userPageInstructor");

  try(UserService us = new UserService()) {
  ReportService rs = new ReportService();
  ReportRevisionService rrs = new ReportRevisionService();
  User uInstructor = us.getByUserName(session.getAttribute("user").toString());
  List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getId());
  int countOpenReports = 0;
  int countDeclinedReports = 0;
  int countImprovedReports = 0;

  //--------------------------------- OPEN REPORTS ----------------------------------------------------
  // status == 2
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
        countOpenReports++;
      }
    }
  }

    //--------------------------------- DECLINED REPORTS -------------------------------------------------
    // status == 3
    String declinedReportList = "";
    for (int i = 0; i < lTraineeUsers.size(); i++) {
      List<Report> lrs = rs.getAllByStatusAndUserID(3, lTraineeUsers.get(i).getId());
      if(lrs.size() > 0){
        for (int j = 0; j < lrs.size(); j++) {
          declinedReportList = declinedReportList + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
            + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(j).getId() + "\" />"
            + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(j).getStatus() + "\" />"
            + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht: " + lTraineeUsers.get(i).getLast_name() +
            ", " + lrs.get(j).getDate() +  "\"class= \"col-xs-1 list-group-item list-group-item-action list-group-item-primary text-center text-white bg-danger\"></form>";
          countDeclinedReports++;
        }
      }
    }

    //--------------------------------- IMPROVED REPORTS -------------------------------------------------
    // status == 2 && rev-number > 1
    String improvedReportList = "";
    for (int i = 0; i < lTraineeUsers.size(); i++) {
      List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());
      if(lrs.size() > 0){
        for (int j = 0; j < lrs.size(); j++) {
          List<Report_Revision> reportRevisions = rrs.getAllByReportId(lrs.get(j).getId());
          if(reportRevisions.size() > 1) {
            improvedReportList = improvedReportList + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
              + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(j).getId() + "\" />"
              + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(j).getStatus() + "\" />"
              + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht: " + lTraineeUsers.get(i).getLast_name() +
              ", " + lrs.get(j).getDate() + "\"class= \"col-xs-1 list-group-item list-group-item-action list-group-item-primary text-center\"></form>";
            countImprovedReports++;
          }
        }
      }
    }


  String[] cards = new String[]{"openReports", "declinedReports", "improvedReports"};
  String[] headline = new String[]{
    "Offene Berichte: " + countOpenReports,
    "Abgelehnte Berichte: " + countDeclinedReports,
    "Verbesserte Berichte: " + countImprovedReports
  };
  String[] lists = new String[]{openReportsList, declinedReportList, improvedReportList};

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

