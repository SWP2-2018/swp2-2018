<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
</head>
<body>
</br>
<p class="h1 text-center">An Error has occured,Please try again later...</p>

<%
  response.setHeader("Refresh", "2;url=/login.jsp");
%>

</body>
</html>

