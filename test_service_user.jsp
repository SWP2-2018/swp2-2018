<%@page import="tablePojos.User" %>
<%@page import="services.ReportService" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="services.UserService" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="tablePojos.User" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@ page import="services.EmailService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test Seite Hibernate Service</title>
</head>
<body>
<%

  UserService us = new UserService();
  User user = us.getById(7);

  //out.println(  user.getFirst_name());
  EmailService emailService = new EmailService();
  String betreff = "Bitte Bericht abgeben";
  String text = "Bitte geben sie den Bericht für die aktuelle Woche bis kommenden Montag ab";
  emailService.sendMail(user, betreff, text);





%>
</body>
</html>
