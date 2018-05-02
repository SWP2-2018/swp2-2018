<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String username=request.getParameter("username");
  String password=request.getParameter("password");

  if((username.equals("azubi") && password.equals("pw")))
  {

    session.setAttribute("username",username);
    response.sendRedirect("trainee/userPageTrainee.jsp");
  }
  else if((username.equals("ausbilder") && password.equals("pw"))){
    session.setAttribute("username",username);
    response.sendRedirect("instructor/userPageInstructor.jsp");
  }
  else {
    response.sendRedirect("error.jsp");
  }
%>

