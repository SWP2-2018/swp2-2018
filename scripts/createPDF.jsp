<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="java.util.List" %>

<%@page import="services.UserService" %>
<%@page import="services.ReportRevisionService" %>
<%@page import="services.ReportService" %>
<%@page import="services.PdfService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>

<%
  try(UserService us = new UserService(); ReportRevisionService rrs = new ReportRevisionService(); ReportService rs = new ReportService()) {


    User user = us.getByEmail(session.getAttribute("email").toString());

    if(user.getInstructor() == 0){
      //Als Azubi: drucke die Berichtsrevision
      Report_Revision report_Revision = rrs.getById(Integer.parseInt(request.getParameter("reportRevisionID")));
      Report report =  rs.getById(report_Revision.getReport_id());
      PdfService pdf = new PdfService(user,report,report_Revision);
    }
    else{
    //Als Ausbilder: drucke alle Berichtes mit TraineeID die Status 4 haben.
      int traineeId = Integer.parseInt(request.getParameter("traineeID"));
      User trainee = us.getById(traineeId);
      List<Report> lrsC = rs.getAllByStatusAndUserID(4,traineeId);
      List<Report_Revision> rv_List;
      Report_Revision report_Revision;
      for (Report report:lrsC) {
        rv_List  = rrs.getAllByReportId(report.getId());
        report_Revision = rv_List.get(0);
        PdfService pdf = new PdfService(trainee,report,report_Revision);
      }

    };




    if (user.getInstructor() == 0) {
      response.sendRedirect("../trainee/allReportsPage.jsp");
    } else {
      response.sendRedirect("../instructor/allTraineesPage.jsp");
    }
  }
%>

