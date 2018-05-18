<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page errorPage="../error.jsp"%>

<%@ page import ="java.util.List"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="services.ReportService" %>
<%@ page import="services.UserService" %>

<%@ page import="tablePojos.Report" %>
<%@ page import="tablePojos.User" %>

<!-- Setzte request Attribute "page" für die navbar -->
<%
  request.setAttribute("page","newReportsPage");

  ReportService rs = new ReportService();
  UserService us = new UserService();

  User uInstructor = us.getByUserName(session.getAttribute("user").toString());

  List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getId());


  List<List<Report>> allListReports = new ArrayList<>();

  for (int i = 0; i < lTraineeUsers.size(); i++) {

    List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());

    if(lrs.size() > 0){

    allListReports.add(lrs);

    request.setAttribute("listReports", allListReports);

    }
  }

%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Neue Berichte</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neue Berichte</jsp:attribute>
    </t:navbar>
    <div class="inForm">
      <ul class="list-group">

        <t:formList>
          <jsp:attribute name="formList">-1</jsp:attribute>
        </t:formList>

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

