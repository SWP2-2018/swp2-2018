<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(ReportRevisionService reportRevisionService = new ReportRevisionService(); ReportService reportService = new ReportService();) {
    Report_Revision oldReportRevision = reportRevisionService.getById(Integer.parseInt(request.getParameter("reportRevisionID")));


    Report report = reportService.getById(oldReportRevision.getReport_id());
    report.setStatus(3);
    reportService.update(report, report.getId());

    oldReportRevision.setComment(request.getParameter("comment"));

    reportRevisionService.update(oldReportRevision, oldReportRevision.getId());

    Report_Revision newReportRevision = new Report_Revision();

    newReportRevision.setText1(oldReportRevision.getText1());
    newReportRevision.setText2(oldReportRevision.getText2());
    newReportRevision.setText3(oldReportRevision.getText3());
    newReportRevision.setHours1(oldReportRevision.getHours1());
    newReportRevision.setHours2(oldReportRevision.getHours2());
    newReportRevision.setHours3(oldReportRevision.getHours3());
    newReportRevision.setComment("");
    newReportRevision.setNumber(oldReportRevision.getNumber());
    newReportRevision.setId(oldReportRevision.getId());
    newReportRevision.setReport_id(oldReportRevision.getReport_id());

    reportRevisionService.create(newReportRevision, oldReportRevision.getReport_id());


    if ((byte) session.getAttribute("instructor") == 0) {
      response.sendRedirect("/../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("/../instructor/userPageInstructor.jsp");
    }
  }
%>

