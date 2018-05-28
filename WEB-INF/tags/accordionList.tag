<%@tag description="Wochenberichtsakkordeon" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="id" required="true" %>
<%@attribute name="title" required="true" %>
<%@attribute name="expanded" required="false" %>
<%@attribute name="reports" required="true" type="java.util.Collection"%>

<div class="card">
  <div class="card-header" id="heading-${id}" data-toggle="collapse" data-target="#collapse-${id}" aria-controls="collapse-${id}">
    <h5 class="mb-0">
      <button class="btn btn-link">
        ${title}
      </button>
      <button class="btn btn-danger right" disabled>
        ${reports.size()}
      </button>
    </h5>
  </div>

  <div id="collapse-${id}" class="collapse hide" aria-labelledby="heading-${id}" data-parent="#accordion">
    <div class="card-body">
      <c:choose>
        <c:when test="${!empty reports}">
          <ul class="list-group">
            <c:forEach items="${reports}" var="report">
              <li class="list-group-item">
                <a href="../editReport.jsp?reportID=${report.getId()}">Wochenbericht vom ${report.getDate()}</a>
              </li>
            </c:forEach>
          </ul>
        </c:when>
        <c:otherwise>
          <p>Keine Elmente vorhanden!</p>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
