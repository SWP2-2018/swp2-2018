<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="error.jsp"%>

<%@page import="java.util.List" %>

<%@page import="services.UserService" %>
<%@page import="services.ReportService" %>
<%@page import="services.ReportRevisionService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>



<%
  //Setze Attribut page für die navbar
  request.setAttribute("page", "editReport");

  try(UserService us = new UserService(); ReportRevisionService rs = new ReportRevisionService();   ReportService reportService = new ReportService()) {

    User user = us.getByEmail(session.getAttribute("email").toString());

    //Lädt alle Reports_Revisions aus der Datenbank aus die zu der übertragenen ReportID gehören

    List<Report_Revision> rv_List = rs.getAllByReportId(Integer.parseInt(request.getParameter("reportID")));

    Report report = reportService.getById(Integer.parseInt(request.getParameter("reportID")));

    String commentPlaceholder = "Kommentar";
    String comment = "";

    if (rv_List.size() < 1) {
      response.sendRedirect("error.jsp");
    } else if (rv_List.size() > 1 && Integer.parseInt(session.getAttribute("instructor").toString()) == 1) {
     commentPlaceholder = "Letzter Kommentar: " + rv_List.get(1).getComment();
    } else if (rv_List.size() > 1) {
      comment = rv_List.get(1).getComment();
    }

    Report_Revision rv = rv_List.get(0);

    String lockFields = "";
    String lockComment = "";
    String hideComment = "";

    //Felder readonly machen in den passenden Berichten
    if (Integer.parseInt(request.getParameter("reportStatus")) == 4
      || Integer.parseInt(request.getParameter("reportStatus")) == 2) {
      lockFields = "readonly";
    } else {
      lockComment = "readonly";
    }
    //Kommentarfeld readonly machen für Azubis
    if (!(user.getInstructor() == 1 || Integer.parseInt(request.getParameter("reportStatus")) == 3)) {
      hideComment = "invisible";
    }

    // Felder readonly für Ausbilder...
    if (user.getInstructor() == 1) {
      lockFields = "readonly";
    }

    String[] labels = {"Betriebliche Tätigkeiten", "Unterweisungen, sonstige Schulungen", "Themen des Berufsschulunterrichts"};
    String[] idTextfields = {"textOperationalActivities", "textOperationalGuidance", "textVocationalTeaching"};
    String[] idHours = {"hoursOperationalActivities", "hoursOperationalGuidance", "hoursVocationalTeaching"};

    String ausgabe = "<div aria-readonly=\"true\" class=\"container\">\n<form action=\"scripts/reportCheck.jsp\" method=\"post\" autocomplete=\"off\">\n"
      + "<input type=\"hidden\" name=\"reportRevisionID\" value=\"" + rv.getId() + "\"/>\n<div class=\" justify-content-lg-center inForm\">\n";

    ausgabe += "<div class=\"form-group\"><hr/>\n</div>\n<div>\n<h4>" + request.getParameter("SubmitReport").toString()
      + "</h4>\n</div>\n<div class=\"form-group\">\n<hr/>\n</div>\n";

    //Textfelder und Stundenfelder erstellen
    for (int i = 0; i < labels.length; i++){

      ausgabe += "<div class=\"form-group\">\n<label for=\""+ idTextfields[i] + "\">" + labels[i] + "\n</label>\n"
        + "<textarea "+ lockFields + " name=\"" + idTextfields[i] + "\" id=\"textER\" class=\"form-control input\" rows=\"3\""
        + "placeholder=\"" + labels[i] + "\">\n"+ rv.getText(i) + "\n</textarea>\n</div>\n"
        + "<div class=\"form-group form-inline\">\n<label class=\"control-label col-4\">\nStunden\n</label>\n<input "
        + lockFields + " class=\"form-control\" type=\"number\" min=\"0\" name=\"" + idHours[i] + "\" id=\""
        + idHours[i] + "\" value=\"" + rv.getHour(i) + "\">\n</div>\n<div class=\"form-group\">\n<hr/>\n</div>";
    }
    //Kommentarfeld erstellen
    ausgabe += "<div class=\"form-group " + hideComment + "\">\n<label for=\"comment\">\nKommentar\n</label>\n"
      + "<textarea " + lockComment + " name=\"comment\" id=\"comment\" class=\"form-control input\" placeholder=\""
      + commentPlaceholder + "\">\n" + comment + "\n</textarea>\n</div>\n";

    ausgabe += "<div class=\"form-group\">";

    //Buttons für instuctors und trainees erstellen
    if ((byte) session.getAttribute("instructor") == 1) {
      if (report.getStatus() != 4 && report.getStatus() != 3) {
        ausgabe +=
          "<div class=\"row\">\n" +
            "<div class=\"col-md-6\">\n" +
            "<button formaction=\"scripts/reportAccepted.jsp\" type=\"submit\" class=\"btn btn-block btn-success\"" +
            " name=\"send\" id=\"send\" value=\"Submit\">Akzeptieren\n</button>\n" +
            "</div>\n" +
            "<div class=\"col-md-6\">\n" +
            "<button formaction=\"scripts/reportDeclined.jsp\" type=\"submit\" class=\"btn btn-block btn-danger\"" +
            " name=\"send\" id=\"send\" value=\"Submit\">Ablehnen\n</button>\n" +
            "</div>\n" +
            "</div>\n"
        ;
      }
    } else {
      //Erstelle Buttons für Trainee
      //Wenn Status 4 dann erstelle PDF, bei Status 1 und 3 erstelle Button Abgeben
      if (report.getStatus() == 4){
        ausgabe += "<button formaction=\"scripts/createPDF.jsp\" type=\"submit\" class=\"btn btn-block btn-primary\" name=\"send\" id=\"send\"" +
          " value=\"Submit\">PDF erstellen\n</button>\n";

      } else if (report.getStatus() != 2){
        ausgabe += "<button type=\"submit\" class=\"btn btn-block btn-primary\" name=\"send\" id=\"send\"" +
          " value=\"Submit\">Abgeben\n</button>\n";
      }
    }

    ausgabe += "</div>\n</div>\n</form>\n</div>\n";

    pageContext.setAttribute("ausgabe", ausgabe);
  }
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Bericht bearbeiten</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Bericht bearbeiten</jsp:attribute>
    </t:navbar>

    ${ausgabe}

  </jsp:body>
</t:stdTempl>

