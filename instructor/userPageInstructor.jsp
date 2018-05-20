<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import ="java.util.List"%>
<%@page import="java.util.ArrayList" %>

<%@page import="services.ReportService" %>
<%@page import="services.UserService" %>
<%@page import="services.ReportRevisionService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page import="tablePojos.Report_Revision" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "userPageInstructor");

  try(UserService us = new UserService(); ReportService rs = new ReportService(); ReportRevisionService rrs = new ReportRevisionService()) {

    User uInstructor = us.getByEmail(session.getAttribute("email").toString());
    List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getId());

    List<List<Report>> allListReports = new ArrayList();

    //--------------------------------- OPEN REPORTS ----------------------------------------------------
    // status == 2
    allListReports.add(new ArrayList());
    for (int i = 0; i < lTraineeUsers.size(); i++) {
      List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());
      if (lrs.size() > 0) {
        allListReports.get(allListReports.size() - 1).addAll(lrs);
      }
    }

    //--------------------------------- DECLINED REPORTS -------------------------------------------------
    // status == 3
    allListReports.add(new ArrayList());
    for (int i = 0; i < lTraineeUsers.size(); i++) {
      List<Report> lrs = rs.getAllByStatusAndUserID(3, lTraineeUsers.get(i).getId());
      if (lrs.size() > 0) {
        allListReports.get(allListReports.size() - 1).addAll(lrs);
      }
    }

    //--------------------------------- IMPROVED REPORTS -------------------------------------------------
    // status == 2 && rev-number > 1
    allListReports.add(new ArrayList());
    for (int i = 0; i < lTraineeUsers.size(); i++) {
      List<Report> lrs = rs.getAllByStatusAndUserID(2, lTraineeUsers.get(i).getId());

      if (lrs.size() > 0) {
        for (int j = 0; j < lrs.size(); j++) {
          List<Report_Revision> reportRevisions = rrs.getAllByReportId(lrs.get(j).getId());
          if (reportRevisions.size() > 1) {
            allListReports.get(allListReports.size() - 1).add(lrs.get(j));
          }
        }
      }
    }
    request.setAttribute("listReports", allListReports);

    pageContext.setAttribute("countOpenReports", allListReports.get(0).size());
    pageContext.setAttribute("countDeclinedReports", allListReports.get(1).size());
    pageContext.setAttribute("countImprovedReports", allListReports.get(2).size());
  }
%>




<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Übersicht</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>
    <div id="accordion">
      <div class="userPageList">
        <t:accordeonList>
          <jsp:attribute name="title">openReports</jsp:attribute>
          <jsp:attribute name="text">Offene Berichte</jsp:attribute>
          <jsp:attribute name="anzahl">${countOpenReports}</jsp:attribute>
          <jsp:body>
            <t:formList>
              <jsp:attribute name="formList">0</jsp:attribute>
            </t:formList>
          </jsp:body>
        </t:accordeonList>

        <t:accordeonList>
          <jsp:attribute name="title">declinedReports</jsp:attribute>
          <jsp:attribute name="text">Abgelehnte Berichte</jsp:attribute>
          <jsp:attribute name="anzahl">${countDeclinedReports}</jsp:attribute>
          <jsp:body>
            <t:formList>
              <jsp:attribute name="formList">1</jsp:attribute>
            </t:formList>
          </jsp:body>
        </t:accordeonList>

        <t:accordeonList>
          <jsp:attribute name="title">improvedReports</jsp:attribute>
          <jsp:attribute name="text">Verbesserte Berichte</jsp:attribute>
          <jsp:attribute name="anzahl">${countImprovedReports}</jsp:attribute>
          <jsp:body>
            <t:formList>
              <jsp:attribute name="formList">2</jsp:attribute>
            </t:formList>
          </jsp:body>
        </t:accordeonList>
      </div>
    </div>


  </jsp:body>
</t:stdTempl>

