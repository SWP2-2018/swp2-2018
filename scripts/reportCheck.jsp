<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%@page import="services.UserService" %>
<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(UserService us = new UserService(); ReportRevisionService rrs = new ReportRevisionService(); ReportService rs = new ReportService()) {
    User user = us.getByEmail(session.getAttribute("email").toString());

    Report_Revision rv = rrs.getById(Integer.parseInt(request.getParameter("reportRevisionID")));



    rv.setTextOperationalActivities(new String(request.getParameter("textOperationalActivities").getBytes("ISO-8859-1"), "UTF-8"));
    rv.setTextOperationalGuidance(new String(request.getParameter("textOperationalGuidance").getBytes("ISO-8859-1"), "UTF-8"));
    rv.setTextVocationalTeaching(new String(request.getParameter("textVocationalTeaching").getBytes("ISO-8859-1"), "UTF-8"));

    //sollte eine übergebene Stundenzahl leer sein schreibe 0 Stunden in die Datenbank
    rv.setHoursOperationalActivities(request.getParameter("hoursOperationalActivities") != "" ? Integer.parseInt(request.getParameter("hoursOperationalActivities")) : 0);
    rv.setHoursOperationalGuidance(request.getParameter("hoursOperationalGuidance") != "" ? Integer.parseInt(request.getParameter("hoursOperationalGuidance")) : 0);
    rv.setHoursVocationalTeaching(request.getParameter("hoursVocationalTeaching") != "" ? Integer.parseInt(request.getParameter("hoursVocationalTeaching")) : 0);

    if(!(request.getParameter("submitInfo").toString().equals("save"))) {
      Report report = rs.getById(rv.getReport_id());
      report.setStatus(2);
      rs.update(report, report.getId());
    }
    rrs.update(rv, rv.getId());

    if (user.getInstructor() == 0) {
//TODO zur korrektur seite zurück schicken
      response.sendRedirect("../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("../instructor/allTraineesPage.jsp");
    }
  }
%>

