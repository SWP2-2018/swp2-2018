<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%
  UserService us = new UserService();
  User user = us.getByUserName(request.getParameter("user"));
  session.setAttribute("username", user.getUser());
  if (user.getPassword().equals(request.getParameter("password"))) {
    if (user.getInstructor() == 1) {

      response.sendRedirect("instructor/userPageInstructor.jsp");

    } else {
      response.sendRedirect("trainee/userPageTrainee.jsp");
    }
  } else {
    response.sendRedirect("error.jsp");
  }
%>

