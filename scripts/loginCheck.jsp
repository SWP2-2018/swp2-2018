<%@ page import="services.PasswordEncode" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
  UserService us = new UserService();
  try {

    User user = us.getByUserName(request.getParameter("user"));
    if(user != null){

      session.setAttribute("user", user.getUser());
      session.setAttribute("instructor", user.getInstructor());
      if (PasswordEncode.match(request.getParameter("password"), user.getPassword())) {
        if (user.getInstructor() == 1) {
          response.sendRedirect("../instructor/userPageInstructor.jsp");
        } else {
          response.sendRedirect("../trainee/userPageTrainee.jsp");
        }
      } else {
        response.sendRedirect("../error.jsp");
      }
    } else {
      response.sendRedirect("../error.jsp");
    }
  } catch (Exception e){
    response.sendRedirect("../error.jsp");
  }
  us.close();
%>
