<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="../error.jsp"%>

<%@page import="services.PasswordEncode" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>

<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>


<%
  try(UserService us = new UserService()) {
    User user = new User();

    user.setEmail(request.getParameter("user"));
    user.setPassword(PasswordEncode.encode(request.getParameter("password")));
    user.setInstructor(new Byte(request.getParameter("options").toString().equals("trainee") ? "0" : "1"));
    user.setLast_name(request.getParameter("last_name"));
    user.setFirst_name(request.getParameter("first_name"));
    user.setJob(request.getParameter("job"));
    user.setEducational_year(Integer.parseInt(request.getParameter("educational_year")));
    user.setInstructor_id(Integer.parseInt(request.getParameter("instructor_id")));

    String startDateStr = request.getParameter("start_date");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = sdf.parse(startDateStr);
    user.setStart_date(startDate);

    //Falls beim erstellen des Nutzers ein Problem auftritt bekommen wir ein null zurueck und leiten
    //Nutzer auf die error Seite um.
    if (us.create(user) != null) {
      response.sendRedirect("../settings.jsp");
    } else {
      request.setAttribute("error", "NullPointerException");
      response.sendRedirect("../error.jsp");
    }
  }
%>

