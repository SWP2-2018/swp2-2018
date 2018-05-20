<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.UserService" %>
<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(UserService us = new UserService(); ReportRevisionService rs = new ReportRevisionService(); ReportService reportService = new ReportService();) {
    User user = us.getByEmail(session.getAttribute("email").toString());

    Report_Revision rv = rs.getById(Integer.parseInt(request.getParameter("reportRevisionID")));

    Report report = reportService.getById(rv.getReport_id());
    report.setStatus(2);

    rv.setTextOperationalActivities(new String(request.getParameter("textOperationalActivities").getBytes("ISO-8859-1"), "UTF-8"));
    rv.setTextOperationalGuidance(new String(request.getParameter("textOperationalGuidance").getBytes("ISO-8859-1"), "UTF-8"));
    rv.setTextVocationalTeaching(new String(request.getParameter("textVocationalTeaching").getBytes("ISO-8859-1"), "UTF-8"));
    rv.setHoursOperationalActivities(Integer.parseInt(request.getParameter("hoursOperationalActivities")));
    rv.setHoursOperationalGuidance(Integer.parseInt(request.getParameter("hoursOperationalGuidance")));
    rv.setHoursVocationalTeaching(Integer.parseInt(request.getParameter("hoursVocationalTeaching")));

    reportService.update(report, report.getId());
    rs.update(rv, rv.getId());

    if (user.getInstructor() == 0) {
//TODO zur korrektur seite zurück schicken
      response.sendRedirect("../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("../instructor/allTraineesPage.jsp");
    }
  }
%>

