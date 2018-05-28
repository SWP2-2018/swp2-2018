<%@tag description="standard Page Template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="id" required="true" %>
<%@attribute name="title" required="true" %>
<%@attribute name="reports" required="true" type="java.util.Collection"%>


  <div class="card">
    <div class="card-header btn-secondary btn" id="${id}" data-toggle="collapse"
         data-target="#collapse${id}" aria-expanded="true" aria-controls="collapse${id}">
      <a class="btn ">${title}</a>
    </div>
    <div id="collapse${id}" class="collapse show" aria-labelledby="${id}" data-parent="#accordion"
         style="">
      <div class="card-body">
        <c:forEach items="${reports}" var="report">
          <t:accordeonListElem>
            <jsp:attribute name="reportId">${report.getId()}</jsp:attribute>
            <jsp:attribute name="reportStatus">${report.getStatus()}</jsp:attribute>
            <jsp:attribute name="reportDate">${report.getDate()}</jsp:attribute>
          </t:accordeonListElem>
        </c:forEach>
      </div>
    </div>
  </div>

