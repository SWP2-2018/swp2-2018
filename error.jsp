<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
</head>
<body>
<h1>An Error has occured,Please try again later...</h1>

<%response.setHeader("Refresh", "3;url=index.jsp");
//String error = ( request.getAttribute("error"));%>

</body>
</html>

