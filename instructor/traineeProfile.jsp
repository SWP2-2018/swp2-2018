<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page errorPage="../error.jsp"%>

<%@ page import="services.ReportService" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="java.util.List" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "traineeProfile");

  ReportService rs = new ReportService();
  List<Report> lrs = rs.getAllByStatusAndUserID(2, Integer.parseInt(request.getParameter("traineeID")));


//Erstellt Elemente für die noch offenen Berichte
  String openReportsList = "";
  for (int i = 0; i < lrs.size(); i++) {
    openReportsList = openReportsList
      + "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">"
      + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(i).getId() + "\" />"
      + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(i).getStatus() + "\" />"
      + "<input type =\"Submit\" name=\"Date\" value=\"Wochenbericht vom " + lrs.get(i).getDate() + "\"class=\"list-group-item list-group-item-action"
      + " text-center\"></form>";
  }


  String[] cards = new String[]{"openReports"};
  String[] headline = new String[]{"Berichte zur Abnahme: " + lrs.size()};
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
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Auszubildende Profil </jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Auszubildende Profil</jsp:attribute>
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


