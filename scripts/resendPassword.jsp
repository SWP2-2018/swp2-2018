<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp" %>

<%@page import="services.PasswordEncode" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>
<%@ page import="services.EmailService" %>

<%
  try (UserService us = new UserService()) {
    //wrongData auf null setzen
    User user = us.getByEmail(request.getParameter("userEmail").toString());
    //Falls das alte Passwort mit dem Nutzerpassword uebereinsimmt wird das neue Passwort beim user geupdatet
    if (user != null && request.getParameter("userName").toString().equals(user.getFirst_name())
      && request.getParameter("userSurname").toString().equals(user.getLast_name())){
        EmailService es = new EmailService();
        user.setPassword(PasswordEncode.encode("pw"));
        us.update(user, user.getId());
        String inhalt = "Ihr Passwort im Berichtsheft Digital ist auf \nPW\n zurückgesetzt worden."
          + " Bitte ändern sie ihr Password im anschluss wieder ab.\nMit freundlichen Grüßen\nBerichtsheft Digital";

        es.sendMail(user, "BD: Angefordertes Passwort", inhalt);
        session.setAttribute("messageData", "pwResendGood");
        response.sendRedirect("../login.jsp");

    } else { //Falls das alte Passwort nicht mit dem Nutzerpassword uebereinsimmt wird das wrongData gesetzt.
      session.setAttribute("messageData", "pwResendBad");
      response.sendRedirect("../login.jsp");
    }
  }
%>
