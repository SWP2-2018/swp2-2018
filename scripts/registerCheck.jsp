<%@page contentType="text/html" pageEncoding="UTF-8" %>


<%@page import="services.PasswordEncode" %>
<%@page import="services.UserService" %>
<%@page import="tablePojos.User" %>

<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>


<%
  if (request.getParameter("password").equals(request.getParameter("confirmPassword"))) {
    try (UserService us = new UserService()) {
      User user = new User();


      user.setEmail(request.getParameter("user"));
      user.setPassword(PasswordEncode.encode(request.getParameter("password")));
      user.setInstructor(new Byte(request.getParameter("type").toString().equals("trainee") ? "0" : "1"));
      user.setLast_name(new String(request.getParameter("last_name").getBytes("ISO-8859-1"), "UTF-8"));
      user.setFirst_name(new String(request.getParameter("first_name").getBytes("ISO-8859-1"), "UTF-8"));
      user.setJob(new String(request.getParameter("job").getBytes("ISO-8859-1"), "UTF-8"));
      user.setEducational_year(Integer.parseInt(request.getParameter("educational_year")));
      user.setInstructor_id(Integer.parseInt(request.getParameter("instructor_id")));

      String startDateStr = request.getParameter("start_date");
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date startDate = sdf.parse(startDateStr);
      user.setStart_date(startDate);

      //Falls beim erstellen des Nutzers ein Problem auftritt bekommen wir ein null zurueck und leiten
      //Nutzer auf die error Seite um.
      if (us.create(user) != null) {
        session.setAttribute("settingsData", "goodREGData");
        response.sendRedirect("../settings.jsp");
      } else {
        session.setAttribute("error", "userERROR");
        response.sendRedirect("../instructor/register.jsp");
      }
    }
  } else{
    session.setAttribute("error", "pwERROR");
    response.sendRedirect("../instructor/register.jsp");
  }
%>

