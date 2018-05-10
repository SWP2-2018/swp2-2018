<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%
  UserService us = new UserService();
  User user = new User();

  user.setUser(request.getParameter("user"));
  user.setPassword(request.getParameter("password"));
  user.setInstructor(new Byte("0"));
  user.setLast_name(request.getParameter("last_name"));
  user.setFirst_name(request.getParameter("first_name"));
  user.setJob(request.getParameter("job"));
  user.setEducational_year(1);
  user.setInstructor_id(1);

  String startDateStr = request.getParameter("start_date");
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  Date startDate = sdf.parse(startDateStr);
  user.setStart_date(startDate);

  //Falls beim erstellen des Nutzers ein Problem auftritt bekommen wir ein null zurueck und leiten
  //Nutzer auf die error Seite um.
  if (us.create(user) == null) {
    request.setAttribute("error", "NullPointerException");
    response.setHeader("Refresh", "0;url=error.jsp");

  } else {
    response.setHeader("Refresh", "3;url=index.jsp");
  }
%>

