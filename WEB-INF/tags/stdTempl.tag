<%@tag description="standard Page Template" pageEncoding="UTF-8"%>
<%@attribute name="titleText" fragment="true" %>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" >
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Berichtsheft Digital <jsp:invoke fragment="titleText"/></title>
</head>
<body>

<%
  if (session.getAttribute("username")!=null) {
    String name = session.getAttribute("username").toString();
    request.setAttribute("name",name);
  }else{
    response.sendRedirect("error.jsp");
  }
%>

<jsp:doBody/>
</body>
</html>
