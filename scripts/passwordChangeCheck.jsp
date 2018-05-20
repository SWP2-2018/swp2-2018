<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp" %>

<%@page import="services.PasswordEncode" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>

<%
  try (UserService us = new UserService()) {
    //wrongData auf null setzen
    User user = us.getByUserName(session.getAttribute("user").toString());
    //Falls das alte Passwort mit dem Nutzerpassword uebereinsimmt wird das neue Passwort beim user geupdatet
    if (user != null && PasswordEncode.match(request.getParameter("oldpassword"), user.getPassword())
      && request.getParameter("password").toString().equals(request.getParameter("confirmPassword").toString())){
        user.setPassword(PasswordEncode.encode(request.getParameter("password")));
        us.update(user, user.getId());
        response.sendRedirect("../settings.jsp");
        session.setAttribute("messageData", "goodData");
    } else { //Falls das alte Passwort nicht mit dem Nutzerpassword uebereinsimmt wird das wrongData gesetzt.
      us.close();
      session.setAttribute("messageData", "badData");
      response.sendRedirect("../settings.jsp");
    }
  }
%>
