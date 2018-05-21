<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>

<%@page import="services.ReportService" %>
<%@page import="tablePojos.Report" %>



<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "traineeProfile");

  try(ReportService rs = new ReportService()) {
    List<Report> lrs = rs.getAllByStatusAndUserID(2, Integer.parseInt(request.getParameter("traineeID")));

    List<List<Report>> allListReports = new ArrayList();
    allListReports.add(lrs);

    request.setAttribute("listReports", allListReports);

    pageContext.setAttribute("opReCount", lrs.size());
  }
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Auszubildende Profil </jsp:attribute>
  <jsp:body>

    <t:navbar>
      <jsp:attribute name="navText">Auszubildende Profil</jsp:attribute>
      <jsp:body>
      </jsp:body>
    </t:navbar>

    <div id="accordion">
      <div class="userPageList">
        <t:accordeonList>
          <jsp:attribute name="title">openReports</jsp:attribute>
          <jsp:attribute name="text">Berichte zur Abnahme</jsp:attribute>
          <jsp:attribute name="anzahl">${opReCount}</jsp:attribute>
          <jsp:body>
            <t:formList>
              <jsp:attribute name="formList">0</jsp:attribute>
            </t:formList>
          </jsp:body>
        </t:accordeonList>
      </div>
    </div>

  </jsp:body>
</t:stdTempl>


