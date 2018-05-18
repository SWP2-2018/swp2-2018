<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page errorPage="error.jsp"%>

<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>
<%@ page import="java.util.List" %>
<%@ page import="services.ReportRevisionService" %>
<%@ page import="tablePojos.Report_Revision" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="services.ReportService" %>


<%
  //Setze Attribut page für die navbar
  request.setAttribute("page", "editReport");


  UserService us = new UserService();
  User user = us.getByUserName(session.getAttribute("user").toString());


  //Lädt alle Reports_Revisions aus der Datenbank aus die zu der übertragenen ReportID gehören
  ReportRevisionService rs = new ReportRevisionService();
  List<Report_Revision> rv_List = rs.getAllByReportId(Integer.parseInt(request.getParameter("reportID")));
  ReportService reportService = new ReportService();
  Report report = reportService.getById(Integer.parseInt(request.getParameter("reportID")));


  request.setAttribute("commentPlaceholder","Kommentar");
 // request.setAttribute("comment", "");
  if (rv_List.size() < 1) {
    response.sendRedirect("error.jsp");
  } else if (rv_List.size() > 1 && Integer.parseInt(session.getAttribute("instructor").toString())==1){
    request.setAttribute("commentPlaceholder","Letzter Kommentar: "+ rv_List.get(1).getComment());
  }  else if(rv_List.size() > 1){
    request.setAttribute("comment", rv_List.get(1).getComment());
  }


  Report_Revision rv = rv_List.get(0);
  request.setAttribute("reportRevID", rv.getId());

  //Felder readonly machen in den passenden Berichten
  if (Integer.parseInt(request.getParameter("reportStatus")) == 4
    || Integer.parseInt(request.getParameter("reportStatus")) == 2) {
    request.setAttribute("lockFields", "readonly");
    request.setAttribute("roComment", "");
  } else {
    request.setAttribute("lockFields", "");
    request.setAttribute("roComment", "readonly");
  }
  //Kommentarfeld readonly machen für Azubis
  if (user.getInstructor() == 1 || Integer.parseInt(request.getParameter("reportStatus")) == 3) {
    request.setAttribute("lockComment", "");
  } else {
    request.setAttribute("lockComment", "invisible");
  }

  // Felder readonly für Ausbilder...
  if(user.getInstructor() == 1){
    request.setAttribute("lockFields", "readonly");
  }


  String buttons = "";
  if ((byte) session.getAttribute("instructor") == 1) {
    if (report.getStatus() != 4 && report.getStatus() != 3) {
      buttons =
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
    if(Integer.parseInt(request.getParameter("reportStatus")) != 2 && Integer.parseInt(request.getParameter("reportStatus")) != 4) {
      buttons = "<button type=\"submit\" class=\"btn   btn-block btn-primary\" name=\"send\" id=\"send\"" +
        " value=\"Submit\">Abgeben\n</button>\n";
    }
  }

  request.setAttribute("headline", request.getParameter("SubmitReport"));
  request.setAttribute("text1", rv.getText1());
  request.setAttribute("text2", rv.getText2());
  request.setAttribute("text3", rv.getText3());
  request.setAttribute("hours1", rv.getHours1());
  request.setAttribute("hours2", rv.getHours2());
  request.setAttribute("hours3", rv.getHours3());
  request.setAttribute("buttons", buttons);

%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Neuer Bericht</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neuer Bericht</jsp:attribute>
    </t:navbar>


    <div aria-readonly="true" class="container">

      <form action="scripts/reportCheck.jsp" method="post" autocomplete="off">

        <input type="hidden" name="reportRevisionID" value="${reportRevID}"/>

        <div class=" justify-content-lg-center inForm">

          <div class="form-group">
            <hr/>
          </div>

          <div><h4>${headline}</h4></div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ Betriebliche Tätigkeiten eingabe ---------->

          <div class="form-group">

            <label for="text1">Betriebliche Tätigkeiten</label>

            <textarea ${lockFields} name="text1" id="text1" class="form-control input"
                                    placeholder="Betriebliche Tätigkeiten">${text1}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control" type="number" min="0" name="hours1" id="opHour" value="${hours1}">
          </div>
          <div class="form-group">
            <hr/>
          </div>

          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text2">Unterweisungen, sonstige Schulungen</label>
            <textarea ${lockFields} name="text2" id="text2" class="form-control input"
                                    placeholder="Unterweisungen, betrieblicher Unterricht, sonstige Schulungen">${text2}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control " type="number" min="0" name="hours2" id="otherHour" value="${hours2}">
          </div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text3">Themen des Berufsschulunterrichts</label>
            <textarea ${lockFields} name="text3" id="text3" class="form-control input"
                                    placeholder="Themen des Berufsschulunterrichts">${text3}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control " type="number"  min="0" name="hours3" id="text" value="${hours3}">
          </div>

          <div class="form-group">
            <hr/>
          </div>
          <!------ Kommentar ---------->
          <div class="form-group ${lockComment}">
            <label for="comment">Kommentar</label>
            <textarea ${roComment} name="comment" id="comment" class="form-control input "
                                   placeholder="${commentPlaceholder}">${comment}</textarea>
          </div>

          <!------ Buttons am Ende ---------->
          <div class=\"form-group\">
              ${buttons}
          </div>
        </div>

      </form>
    </div>


  </jsp:body>
</t:stdTempl>

