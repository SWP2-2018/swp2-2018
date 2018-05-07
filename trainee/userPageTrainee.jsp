
<%@page import="services.UserService" %>
<%@ page import="services.ReportService" %>

<%@page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>

<%@ page import ="java.util.List"%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<%
  request.setAttribute("page", "userPageTrainee");


  UserService us = new UserService();
  User user = us.getByUserName(session.getAttribute("user").toString());
  ReportService rs = new ReportService();
  List<Report> lrs = rs.getAllByStatusAndUserID(1,user.getId());
  List<Report> lrsC = rs.getAllByStatusAndUserID(3,user.getId());






//Erstellt Elemente für die noch offenen Berichte
  String openReportsList = "";
  for (int i = 0; i < lrs.size(); i++) {
    openReportsList = openReportsList + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
      + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(i).getId() + "\" />"
      + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(i).getStatus() + "\" />"
      + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht vom " + lrs.get(i).getDate() + "\"class=\"list-group-item list-group-item-action"
      + " text-center\"></form>";
  }

  //Erstellt Elemente für die zu Korrigierenden Berichte
  String openCorrectionList = "";
  for (int i = 0; i < lrsC.size(); i++) {
    openCorrectionList = openCorrectionList
      + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
      + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrsC.get(i).getId() + "\" />"
      + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrsC.get(i).getStatus() + "\" />"
      + "<input type =\"Submit\" name=\"Date\" value=\"Wochenbericht vom " + lrsC.get(i).getDate() + "\"class=\"list-group-item list-group-item-danger list-group-item-action"
      + " text-center\"></form>";
  }



  String[] cards = new String[]{"openReports", "openCorrection", "someThing"};
  String[] headline = new String[]{"Offene Berichte: "+ lrs.size(), "Noch zu Korregieren: "+ lrsC.size() , "someThing"};
  String[] lists = new String[]{openReportsList, openCorrectionList, "someThing"};

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
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">&Uuml;bersicht</jsp:attribute>
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

