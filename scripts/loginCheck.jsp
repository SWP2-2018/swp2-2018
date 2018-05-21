<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%@page import="services.PasswordEncode" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>

<%
  try(UserService us = new UserService()) {

    User user = us.getByEmail(request.getParameter("email"));

    if (user != null && PasswordEncode.match(request.getParameter("password"), user.getPassword())) {

      session.setAttribute("email", user.getEmail());
      session.setAttribute("instructor", user.getInstructor());

      if (user.getInstructor() == 1) {
        response.sendRedirect("../instructor/userPageInstructor.jsp");
      } else {
        response.sendRedirect("../trainee/userPageTrainee.jsp");
      }

    } else {
      session.setAttribute("messageData", "badData");
      response.sendRedirect("../login.jsp");
    }
  }
%>
