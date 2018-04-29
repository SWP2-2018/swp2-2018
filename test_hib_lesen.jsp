<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="tablePojos.User" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test Seite Hibernate</title>
</head>
<body>
<%


  // Einfaches Beispiel zum testen von Hibernate
  // Es werden alle Personen aus der Datebank gelesen und alle Felder ausgegeben

  Session _session = new Configuration().configure().buildSessionFactory().openSession();
  Transaction tx = null;

  tx = _session.beginTransaction();
  List users = _session.createQuery("FROM User").list();

  for (Iterator iterator = users.iterator(); iterator.hasNext(); ) {
    User user = (User) iterator.next();
    out.println("ID: " + user.getId());
    out.println("User: " + user.getUser());
    out.println("Password: " + user.getPassword());
    out.println("Instructor: " + user.getInstructor());           // FIX'ed Intructor TO Instructor
    out.println("First Name: " + user.getFirst_name());
    out.println("Last Name: " + user.getLast_name());
    out.println("Job: " + user.getJob());
    out.println("Edu Year: " + user.getEducational_year());
    out.println("Instructor ID: " + user.getInstructor_id());
    out.println("Start Date: " + user.getStart_date());
    out.println("</br>");

  }
  tx.commit();


  _session.close();


%>
</body>
</html>
