<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" >
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/style/css/own.css">



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Error</title>
</head>
  <body>

    </br>

      <p class="h1 text-center">An Error has occured,Please try again later...</p>

    <%
      response.setHeader("Refresh", "2;url=/login.jsp");
    %>

  </body>
</html>

