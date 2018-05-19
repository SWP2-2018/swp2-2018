<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import ="java.util.List"%>
<%@page import="java.util.ArrayList" %>

<%@page import="services.UserService" %>
<%@page import="services.ReportService" %>

<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>

<%
  request.setAttribute("page", "userPageTrainee");

  try(UserService us = new UserService(); ReportService rs = new ReportService()) {

    User user = us.getByUserName(session.getAttribute("user").toString());

    List<Report> lrs = rs.getAllByStatusAndUserID(1, user.getId());
    List<Report> lrsC = rs.getAllByStatusAndUserID(3, user.getId());

    List<List<Report>> allListReports = new ArrayList<>();
    allListReports.add(lrs);
    allListReports.add(lrsC);

    request.setAttribute("listReports", allListReports);

    pageContext.setAttribute("countOpenReports", lrs.size());
    pageContext.setAttribute("countCorrectedReports", lrsC.size());
  }
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">&Uuml;bersicht</jsp:attribute>
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
          <jsp:attribute name="title">openCorrection</jsp:attribute>
          <jsp:attribute name="text">Noch zu Korrigieren</jsp:attribute>
          <jsp:attribute name="anzahl">${countCorrectedReports}</jsp:attribute>
          <jsp:body>
            <t:formList>
              <jsp:attribute name="formList">1</jsp:attribute>
            </t:formList>
          </jsp:body>
        </t:accordeonList>

      </div>
    </div>



  </jsp:body>
</t:stdTempl>

