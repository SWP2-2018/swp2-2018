<%@page import="services.UserService" %>
<%@page import="services.ReportService" %>
<%@page import="tablePojos.User" %>
<%@page import="tablePojos.Report" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
  request.setAttribute("page", "userPageTrainee");

  UserService us = new UserService();
  User user = us.getByUserName(session.getAttribute("user").toString());
  ReportService rs = new ReportService();
  List<Report> lrs = rs.getAllByStatusAndUserID(1, user.getId());
  List<Report> lrsC = rs.getAllByStatusAndUserID(3, user.getId());

  pageContext.setAttribute("lrs", lrs);
  pageContext.setAttribute("lrsC", lrsC);
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Userpage</jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">&Uuml;bersicht</jsp:attribute>
    </t:navbar>



    <div id="accordion">
      <div class="userPageList">
        <t:accordionList id="openReports" title="Offene Berichte" reports="${lrs}"></t:accordionList>
        <t:accordionList id="openCorrection" title="Noch zu Korrigieren" reports="${lrsC}"></t:accordionList>
        <t:accordionList id="someThing" title="someThing" reports="${lrsC}"></t:accordionList>
          <!--${cards}-->
      </div>
    </div>


  </jsp:body>
</t:stdTempl>

