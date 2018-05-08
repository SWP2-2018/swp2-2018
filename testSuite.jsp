<%@page import="tablePojos.User" %>
<%@page import="services.ReportService" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="services.UserService" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="tablePojos.User" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@ page import="services.ReportRevisionService" %>
<%@ page import="tablePojos.Report_Revision" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test Suite ReportRevisionService</title>
</head>
<body>
<%

  ReportRevisionService reportRevisionService = new ReportRevisionService();



  /*
  ##########################################################
  #  Report Revision Service Liste ueber ReportID ausgeben #
  ##########################################################
  */

  /*
  out.println("####### Report Revision Service Liste #######" + "</br>");

  for (int j = 0; j < 80 ; j++) {

    List<Report_Revision> report_revisionList = reportRevisionService.getAllByReportId(j);

    out.println("</br>");



    for (int i = 0; i < report_revisionList.size(); i++) {

      out.println("ID = " + report_revisionList.get(i).getId() + "</br>");
      out.println("Report_ID = " + report_revisionList.get(i).getReport_id() + "</br>");
      out.println("Number = " + report_revisionList.get(i).getNumber() + "</br>");
      out.println("Text1 = " + report_revisionList.get(i).getText1() + "</br>");
      out.println("Text2 = " + report_revisionList.get(i).getText2() + "</br>");
      out.println("Text3 = " + report_revisionList.get(i).getText3() + "</br>");
      out.println("Hours1 = " + report_revisionList.get(i).getHours1() + "</br>");
      out.println("Hours2 = " + report_revisionList.get(i).getHours2() + "</br>");
      out.println("Hours3 = " + report_revisionList.get(i).getHours3() + "</br>");
      out.println("Comment = " + report_revisionList.get(i).getComment() + "</br>");
      out.println("</br>");
      out.println("####### Revision " + i + " beendet. #######</br>");
    }
  }
  */



  /*
  ##########################################################
  #  Report Revision Service Kommentar Reihenfolge         #
  ##########################################################
  */

  /*
  List<Report_Revision> report_revisionList = reportRevisionService.getAllByReportId(2);

  out.println("Erwarteter Kommentar 0 --> " + report_revisionList.get(0).getComment()+ "</br>" ); // report.get(0) -> neuster Eintrag
  out.println("Erwarteter Kommentar 1 --> " + report_revisionList.get(1).getComment()+ "</br>");
  out.println("Erwarteter Kommentar 2 --> " + report_revisionList.get(2).getComment()+ "</br>");
  out.println("Erwarteter Kommentar 3 --> " + report_revisionList.get(3).getComment()+ "</br>");
  out.println("Erwarteter Kommentar 4 --> " + report_revisionList.get(4).getComment()+ "</br>");  // report.get(4) -> ältester Eintrag
  */


  /*
  ##########################################################
  #  Report Revision Service Create Methode                #
  ##########################################################
  */

  /*
  List<Report_Revision> report_revisionList = reportRevisionService.getAllByReportId(2);
  Report_Revision blubb = report.get(0);

  //blubb.setId(1000);                                                  // Reihenfolge bleibt bestehend
  //blubb.setNumber(9);                                                 // Reihenfolge bleibt bestehend
  blubb.setText1("Text 6");
  blubb.setText2("Text 6");
  blubb.setText3("Text 6");
  blubb.setHours1(6);
  blubb.setHours2(6);
  blubb.setHours3(6);
  blubb.setComment("Ein Kommentar 6");

  reportRevisionService.create(blubb, report_revisionList.get(0).getReport_id());
  */



  /*
  ##########################################################
  #  Report Revision Service Update Methode                #
  ##########################################################
  */

  /*
  List<Report_Revision> report_revisionList = reportRevisionService.getAllByReportId(2);

  Report_Revision blubb = report_revisionList.get(0);
  // blubb.setId(1000);                                                  // Reihenfolge bleibt bestehend, Update nicht möglich
  // blubb.setNumber(9);                                                 // Reihenfolge bleibt bestehend, Update nicht möglich
  blubb.setText1("Updated Text 62");
  blubb.setText2("Updated Text 6");
  blubb.setText3("Updated Text 6");
  blubb.setHours1(622222222);
  blubb.setHours2(6);
  blubb.setHours3(6);
  blubb.setComment("Updated Kommentar 6");

  reportRevisionService.update(blubb,blubb.getId());
  */



   /*
  ##########################################################
  #  Report Revision Service Get By ID                #
  ##########################################################
  */

  /*
  Report_Revision report_revision = reportRevisionService.getById(101);

  out.println("ID: " + report_revision.getId()+ "</br>");
  out.println("Report_ID: " +report_revision.getReport_id()+ "</br>");
  out.println("Number: " +report_revision.getNumber()+ "</br>");
  out.println("Text1: " +report_revision.getText1()+ "</br>");
  out.println("Text2: " +report_revision.getText2()+ "</br>");
  out.println("Text3: " +report_revision.getText3()+ "</br>");
  out.println("Hours1: " +report_revision.getHours1()+ "</br>");
  out.println("Hours2: " +report_revision.getHours2()+ "</br>");
  out.println("Hours3: " +report_revision.getHours3()+ "</br>");
  out.println("Comment: " +report_revision.getComment()+ "</br>");
  */


%>
</body>
</html>
