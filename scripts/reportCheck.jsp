<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.UserService" %>
<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  UserService us = new UserService();
  User user = us.getByUserName(session.getAttribute("user").toString());

  ReportRevisionService rs = new ReportRevisionService();
  Report_Revision rv = rs.getById(Integer.parseInt(request.getParameter("reportRevisionID")));

  ReportService reportService = new ReportService();
  Report report = reportService.getById(rv.getReport_id());
  report.setStatus(2);

  new String(request.getParameter("text1").getBytes("ISO-8859-1"), "UTF-8");


  rv.setText1( new String(request.getParameter("text1").getBytes("ISO-8859-1"), "UTF-8"));
  rv.setText2( new String(request.getParameter("text2").getBytes("ISO-8859-1"), "UTF-8"));
  rv.setText3( new String(request.getParameter("text3").getBytes("ISO-8859-1"), "UTF-8"));
  rv.setHours1(Integer.parseInt(request.getParameter("hours1")));
  rv.setHours2(Integer.parseInt(request.getParameter("hours2")));
  rv.setHours3(Integer.parseInt(request.getParameter("hours3")));


  reportService.update(report, report.getId());
  rs.update(rv, rv.getId());
  if (user.getInstructor() == 0) {
//TODO zur korrektur seite zurück schicken
    response.sendRedirect("../trainee/allReportsPage.jsp");
  }else {
    response.sendRedirect("../instructor/allTraineesPage.jsp");
  }

%>
