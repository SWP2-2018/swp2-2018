<%@page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="tablePojos.Report_Revision" %>

<%@ page import="services.UserService" %>
<%@page import="services.ReportService" %>
<%@ page import="services.ReportRevisionService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.concurrent.TimeUnit" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Create Reports</title>
</head>
<body>
<%

  // Erstellt Berichte fuer den Tag an dem es aufgerufen wird.


  boolean upToDate = true;

  try( UserService us = new UserService();  ReportService reportService = new ReportService(); ReportRevisionService reportRevisionService = new ReportRevisionService() ){
    for (User user:us.getAll()) {

      Date d = reportService.getAllByUserId(user.getId()).get(0).getDate();
      Calendar calendar = Calendar.getInstance();
      Date now = calendar.getTime();

      calendar.setTime(now);
      calendar.set(Calendar.HOUR_OF_DAY, 0);
      calendar.set(Calendar.MINUTE, 0);
      calendar.set(Calendar.SECOND, 0);
      calendar.set(Calendar.MILLISECOND, 0);
      now = calendar.getTime();

      calendar.setTime(d);
      calendar.set(Calendar.HOUR_OF_DAY, 0);
      calendar.set(Calendar.MINUTE, 0);
      calendar.set(Calendar.SECOND, 0);
      calendar.set(Calendar.MILLISECOND, 0);
      d = calendar.getTime();



      /* Koennte man gebrauchen fuer aufruf an anderem Tag als Montag
      TimeUnit timeUnit = TimeUnit.DAYS;

      long diffInMillies = now.getTime() - d.getTime();
      long diff = timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);

      out.println("DIFF: " + diff +"<br>" );
      */


      if ( d.before(now))
      {


        upToDate=false;

        Report report = new Report();
        report.setUser_id(user.getId());
        report.setStatus(1);
        report.setReportCount(0);
        report.setDate(Calendar.getInstance().getTime());
        reportService.create(report,user.getId());

        int reportId = reportService.getAllByUserId(user.getId()).get(0).getId();

        Report_Revision reportRevision = new Report_Revision();
        Timestamp ts = new java.sql.Timestamp(now.getTime());

        reportRevision.setTimeStamp(ts);
        reportRevision.setTextOperationalActivities("");
        reportRevision.setTextOperationalGuidance("");
        reportRevision.setTextVocationalTeaching("");
        reportRevision.setHoursOperationalActivities(0);
        reportRevision.setHoursOperationalGuidance(0);
        reportRevision.setHoursVocationalTeaching(0);
        reportRevision.setComment("");
        reportRevision.setReport_id(reportId);

        reportRevisionService.create(reportRevision,reportId);
      }
      else
      {
        // Bericht fuer User.getID ist bereits vorhanden
      }
    }
    if (upToDate)
    {
      out.println("Es wurden keine neuen Berichte erstellt! <br> Berichte sind schon erstellt!");
    }
    else
    {
      out.println("Es wurden alle neuen Berichte erfolgreich erstellt!");
    }
  }







%>
</body>
</html>
