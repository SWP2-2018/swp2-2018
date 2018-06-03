<%@ page import="services.PasswordEncode" %>
<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%
  UserService us = new UserService();
  User user = new User();

  user.setUser(request.getParameter("user"));

  user.setPassword(services.PasswordEncode.encode(request.getParameter("password")));
  user.setInstructor(new Byte("0"));


  if (request.getParameter("options").toString().equals("trainee")) {
    user.setInstructor(new Byte("0"));
  } else {
    user.setInstructor(new Byte("1"));
  }
  user.setLast_name(request.getParameter("last_name"));
  user.setFirst_name(request.getParameter("first_name"));
  user.setJob(request.getParameter("job"));
  user.setEducational_year(Integer.parseInt(request.getParameter("educational_year")));
  user.setInstructor_id(Integer.parseInt(request.getParameter("istructor_id")));

  String startDateStr = request.getParameter("start_date");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  Date startDate = sdf.parse(startDateStr);
  user.setStart_date(startDate);

  //Falls beim erstellen des Nutzers ein Problem auftritt bekommen wir ein null zurueck und leiten
  //Nutzer auf die error Seite um.
  if (us.create(user) == null) {
    request.setAttribute("error", "NullPointerException");
    response.sendRedirect("../error.jsp");

  } else {
    response.sendRedirect("../index.jsp");
  }
%>

