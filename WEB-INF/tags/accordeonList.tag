<%@tag description="accordeonList" pageEncoding="UTF-8" %>
<%@attribute name="title"%>
<%@attribute name="text"%>
<%@attribute name="anzahl"%>

<div class="card">
  <div class="card-header btn-secondary btn" id="${title}" data-toggle="collapse" data-target="#collapse${title}" aria-expanded="false" aria-controls="collapseOpenReports">
    <a class="btn">
    <span class="badge badge-info badge-pill float-right">
      ${anzahl}
    </span>
      ${text}
    </a>
  </div>
  <div id="collapse${title}" class="collapse" aria-labelledby="${title}" data-parent="#accordion">
    <div class="card-body">
    <jsp:doBody/>
    </div>
  </div>
</div>

