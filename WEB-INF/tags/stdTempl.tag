<%@tag description="standard Page Template" pageEncoding="UTF-8"%>
<%@attribute name="titleText"%>

<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="/style/css/font-awesome.css" >
  <link rel="stylesheet" href="/style/css/bootstrap.min.css">
  <link rel="stylesheet" href="/style/css/own.css">
  <link rel="icon" type="image/svg+xml" href="style/icons/icon.svg">
  <link rel="icon" type="image/svg+xml" href="../style/icons/icon.svg">

  <script src="/js/jquery.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Berichtsheft Digital ${titleText}</title>

  <%
      if (!(session.getAttribute("email") != null) && !request.getAttribute("page").toString().equals("login") && !request.getAttribute("page").toString().equals("register")&& !request.getAttribute("page").toString().equals("legalNotice")) {
        response.sendRedirect("../login.jsp");
      }
  %>
  </head>
  <body>
    <jsp:doBody/>
  </body>
  <footer class="foot">
    <p ><a href="/legalNotice.jsp">Impressum</a> Master - v2.0 - 2018-06-17T22:30:00</p>
  </footer>
</html>
