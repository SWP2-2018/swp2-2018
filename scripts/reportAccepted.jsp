<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.ReportService" %>
<%@page import="tablePojos.Report" %>
<%@page import="services.ReportRevisionService" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(ReportRevisionService reportRevisionService = new ReportRevisionService(); ReportService reportService = new ReportService()) {
    Report_Revision reportRevision = reportRevisionService.getById(Integer.parseInt(request.getParameter("reportRevisionID")));

    Report report = reportService.getById(reportRevision.getReport_id());
    report.setStatus(4);
    reportService.update(report, report.getId());

    if ((byte) session.getAttribute("instructor") == 0) {
      response.sendRedirect("/../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("/../instructor/userPageInstructor.jsp");
    }
  }
%>

