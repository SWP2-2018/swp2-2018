

<%@page import="services.PdfService" %>
<%@page import="tablePojos.User" %>
<%@ page import="tablePojos.Report" %>
<%@ page import="tablePojos.Report_Revision" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.Timestamp" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test Seite PDF</title>
</head>
<body>
<%


  User user = new User("jakob.luz@hft.de","pw",new Byte("0"),"Lüz","Jakoob","Meister",1980,1,new Date());
  Report report = new Report(1,new Date(),4,1,150);
  Report_Revision report_revision = new Report_Revision(1,1,"op1","op2","op3",10,11,12,"Passt");
  Calendar calendar = Calendar.getInstance();
  java.util.Date now = calendar.getTime();
  Timestamp ts = new java.sql.Timestamp(now.getTime());
  report_revision.setTimeStamp(ts);


  try {
    PdfService pdfService = new PdfService(user,report,report_revision);
  }catch (Exception e)
  {
    out.println(e.toString());
  }












%>
</body>
</html>
