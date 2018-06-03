<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(ReportRevisionService rrs = new ReportRevisionService(); ReportService rs = new ReportService()) {
    Report_Revision oldReportRevision = rrs.getById(Integer.parseInt(request.getParameter("reportRevisionID")));


    Report report = rs.getById(oldReportRevision.getReport_id());
    report.setStatus(3);
    rs.update(report, report.getId());

    oldReportRevision.setComment(new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8"));

    rrs.update(oldReportRevision, oldReportRevision.getId());

    Report_Revision newReportRevision = new Report_Revision();

    newReportRevision.setTextOperationalActivities(oldReportRevision.getTextOperationalActivities());
    newReportRevision.setTextOperationalGuidance(oldReportRevision.getTextOperationalGuidance());
    newReportRevision.setTextVocationalTeaching(oldReportRevision.getTextVocationalTeaching());
    newReportRevision.setHoursOperationalActivities(oldReportRevision.getHoursOperationalActivities());
    newReportRevision.setHoursOperationalGuidance(oldReportRevision.getHoursOperationalGuidance());
    newReportRevision.setHoursVocationalTeaching(oldReportRevision.getHoursVocationalTeaching());
    newReportRevision.setComment("");
    newReportRevision.setNumber(oldReportRevision.getNumber());
    newReportRevision.setId(oldReportRevision.getId());
    newReportRevision.setReport_id(oldReportRevision.getReport_id());

    rrs.create(newReportRevision, oldReportRevision.getReport_id());


    if ((byte) session.getAttribute("instructor") == 0) {
      response.sendRedirect("/../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("/../instructor/userPageInstructor.jsp");
    }
  }
%>

