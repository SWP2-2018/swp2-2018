<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page errorPage="../error.jsp"%>

<%@page import ="java.util.List"%>

<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>

<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page","allTraineesPage");

  try(UserService us = new UserService()) {

    User uInstructor = us.getByEmail(session.getAttribute("email").toString());

    List<User> lTraineeUsers = us.getAllByInstructorId(uInstructor.getInstructor_id());

    String ausgabe = "";

    for (int i = 0; i < lTraineeUsers.size(); i++) {
      if (lTraineeUsers.get(i).getInstructor() != new Byte("1")) {
        ausgabe = ausgabe + "<form id=\"users\" action=\"traineeProfile.jsp\" method=\"post\">";
        ausgabe = ausgabe + "<input type=\"hidden\" name=\"traineeID\" value=\"" + lTraineeUsers.get(i).getId() + "\" />";
        ausgabe = ausgabe + "<input type =\"Submit\" name=\"SubmitTrainee\" value=\"Azubi: " + lTraineeUsers.get(i).getLast_name() +
          "\"class=\"list-group-item list-group-item-action text-center\"></form>";
      }
    }

    request.setAttribute("trainees", ausgabe);
  }
%>



<t:stdTempl>
  <jsp:attribute name="titleText"> - Auszubildende</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Auszubildende</jsp:attribute>
    </t:navbar>

    <div class="inForm">
      <ul class="list-group">

          ${trainees}

      </ul>
    </div>
  </jsp:body>
</t:stdTempl>

