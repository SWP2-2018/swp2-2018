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
  <title>Test Suite Report Service</title>
</head>
<body>
<%
  out.println("####### Report "+  " beginnt #######</br></br>");

  ReportService reportService = new ReportService();



  /*
  ##########################################################
  #  Report Service Liste ueber User_ID ausgeben #
  ##########################################################
  */

  /*
  List<Report> reports = reportService.getAllByUserId(13);

  for (int i = 0; i < reports.size(); i++) {

    out.println("ID = " + reports.get(i).getId() + "</br>");
    out.println("Datum = " + reports.get(i).getDate() + "</br>");
    out.println("Status = " + reports.get(i).getStatus() + "</br>");
    out.println("User_ID = " + reports.get(i).getUser_id() + "</br>");

    out.println("####### Report " + i + " beendet. #######</br></br>");
  }*/



  /*
  ##########################################################
  #  Report Service Liste ueber Status ausgeben #
  ##########################################################
  */

  /*
  List<Report> reports = reportService.getAllByStatus(2);

  for (int i = 0; i < reports.size(); i++) {

    out.println("ID = " + reports.get(i).getId() + "</br>");
    out.println("Datum = " + reports.get(i).getDate() + "</br>");
    out.println("Status = " + reports.get(i).getStatus() + "</br>");
    out.println("User_ID = " + reports.get(i).getUser_id() + "</br>");

    out.println("####### Report " + i + " beendet. #######</br></br>");
  }
  */



  /*
  ####################################################################
  #  Report Service Liste ueber User_ID und Status ausgeben #
  ####################################################################
  */

  /*
  List<Report> reports = reportService.getAllByStatusAndUserID(2, 13);

  for (int i = 0; i < reports.size(); i++) {

    out.println("ID = " + reports.get(i).getId() + "</br>");
    out.println("Datum = " + reports.get(i).getDate() + "</br>");
    out.println("Status = " + reports.get(i).getStatus() + "</br>");
    out.println("User_ID = " + reports.get(i).getUser_id() + "</br>");

    out.println("####### Report " + i + " beendet. #######</br></br>");
  }
  */



  /*
  ##########################################################
  #  Report Service Create Methode                #
  ##########################################################
  */

  /*
  List<Report> reports = reportService.getAllByUserId(13);

  Report repo = reports.get(0);
  //repo.setDate();
  repo.setId(929);  // --> Reihenfolge wird eingehalten
  repo.setStatus(311);  // --> Status nummer beliebig hoch wählbar, erwartet war von 0 - 3
  //repo.setUser_id(1113);

  reportService.create(repo, reports.get(0).getUser_id());
  */



   /*
  ##########################################################
  #  Report  Service Udate Methode                 #
  ##########################################################
  */

  /*
  Report reports = reportService.getById(102);

  //reports.setDate();
  // reports.setId(929999);  // --> Reihenfolge wird eingehalten
  reports.setStatus(1234567890);  // --> Status nummer beliebig hoch wählbar, erwartet war von 0 - 3
  // reports.setUser_id(1113);

  reportService.update(reports, reports.getId());
  */



   /*
  ##########################################################
  #  Report Revision Service Get By ID                #
  ##########################################################
  */

  /*
  Report report = reportService.getById(102);

  out.println("ID: " + report.getId()+ "</br>");
  out.println("Date: " + report.getDate()+ "</br>");
  out.println("Status: " + report.getStatus()+ "</br>");
  out.println("User_ID: " + report.getUser_id()+ "</br>");
  */



%>
</body>
</html>
