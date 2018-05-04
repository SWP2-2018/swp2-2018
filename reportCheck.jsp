<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="services.ReportRevisionService" %>
<%@ page import="tablePojos.Report_Revision" %>


<%
  ReportRevisionService rs = new ReportRevisionService();
  Report_Revision rv = new Report_Revision();

  rv.setReport_id(Integer.parseInt(request.getParameter("reportRevisionID")));
  rv.setText1(request.getParameter("text1"));
  rv.setText2(request.getParameter("text2"));
  rv.setText3(request.getParameter("text3"));
  rv.setHours1(Integer.parseInt(request.getParameter("hours1")));
  rv.setHours2(Integer.parseInt(request.getParameter("hours2")));
  rv.setHours3(Integer.parseInt(request.getParameter("hours3")));
  rv.setComment("");

  rs.create(rv, rv.getReport_id());

  response.sendRedirect("trainee/allReportsPage.jsp");
%>

