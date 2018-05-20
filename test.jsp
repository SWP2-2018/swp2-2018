<%@page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="tablePojos.Report_Revision" %>

<%@ page import="services.UserService" %>
<%@page import="services.ReportService" %>
<%@ page import="services.ReportRevisionService" %>

<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test Seite Services</title>
</head>
<body>
<%

  // Datei zum Testen der Services

  /*
  Status Werte Aktuell
  0 ned da
  1 review
  2 abgelehnt
  3 passt
  */



  UserService userService = new UserService();
  ReportService reportService = new ReportService();
  ReportRevisionService reportRevisionService = new ReportRevisionService();

  User user = null;
  Report report = null;
  List<Report> reportList = null;
  Report_Revision report_revision = null;
  List<Report_Revision> report_revisionList = null;


  // User Bsp
  user = userService.getByUserName("rmann");
  if (user!=null) out.println("User " + user.getFirst_name() + " gefunden");

  out.println("<br>" + "<br>");

  // Report Bsp
  reportList = reportService.getAllByUserId(user.getId());
  if (reportList!=null)
  {
    out.println("Es wurden fuer den User " + reportList.size() + " TagesBerichte gefunden:"+ "<br> " + "<br>");
    for (int i = 0; i<reportList.size(); i++)
    {
      out.println("Datum " + reportList.get(i).getDate() + " Status " +reportList.get(i).getStatus() + " gefunden" + "<br>");
    }
  }

  out.println("<br>");

  // Report Revision Bsp
  report_revisionList = reportRevisionService.getAllByReportId(2);
  if (report_revisionList!=null)
  {
    out.println("Es wurden " + report_revisionList.size() + " Revisionen fuer Report_ID 2 gefunden" + "<br>" + "<br>");
    for (int i = 0; i<report_revisionList.size(); i++)
    {
      out.println("Stunden gesammt "
        + (report_revisionList.get(i).getHours1()
        + report_revisionList.get(i).getHours2()
        + report_revisionList.get(i).getHours1() )
        + " Kommentar " +report_revisionList.get(i).getComment() + "<br>");
    }
  }


%>
</body>
</html>
