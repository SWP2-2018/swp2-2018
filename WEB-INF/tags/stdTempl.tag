<%@tag description="standard Page Template" pageEncoding="UTF-8"%>
<%@attribute name="titleText" fragment="true" %>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" >
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/style/css/own.css">



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Berichtsheft Digital <jsp:invoke fragment="titleText"/></title>

  <%
    
      if (session.getAttribute("user") == null && !request.getAttribute("page").toString().equals("login") && !request.getAttribute("page").toString().equals("register")) {
        response.sendRedirect("error.jsp");
      }

  %>
</head>
<body>

<jsp:doBody/>
</body>
</html>
