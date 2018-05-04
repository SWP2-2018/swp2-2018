<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<%@ page import ="java.util.List"%>
<%@ page import="services.ReportRevisionService" %>
<%@ page import="tablePojos.Report_Revision" %>

<!-- Setze Attribut page für die navbar -->
<%
  request.setAttribute("page", "newReport.jsp");

  ReportRevisionService rs = new ReportRevisionService();
  List<Report_Revision> rv_List = rs.getAllByReportId(Integer.parseInt(request.getParameter("reportID")));

  request.setAttribute("ID", request.getParameter("reportID"));

  Report_Revision rv = new Report_Revision();

  if(rv_List.size() > 0){
    rv = rv_List.get(0);
  }

  if(Integer.parseInt(request.getParameter("reportStatus")) == 3){
    request.setAttribute("lockFields", "readonly");
  }
  else{
    request.setAttribute("lockFields", "");
  }

    request.setAttribute("text1", rv.getText1());
    request.setAttribute("text2", rv.getText2());
    request.setAttribute("text3", rv.getText3());
    request.setAttribute("hours1", rv.getHours1());
    request.setAttribute("hours2", rv.getHours2());
    request.setAttribute("hours3", rv.getHours3());

%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Neuer Bericht</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neuer Bericht</jsp:attribute>
    </t:navbar>


    <div aria-readonly="true" class="container">

      <form action="../reportCheck.jsp" method="post" autocomplete="off">

        <input type="hidden" name="reportRevisionID" value="${ID}" />

        <div  class=" justify-content-lg-center inForm" >

          <div class="form-group">
            <hr/>
          </div>

          <div><h4>Wochenbericht von: </h4></div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ Betriebliche Tätigkeiten eingabe ---------->

          <div class="form-group">

            <label for="text1">Betriebliche Tätigkeiten</label>

            <textarea ${lockFields} type="text" name="text1" id="text1" class="form-control input"
                      placeholder="Betriebliche Tätigkeiten">${text1}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control" type="text" name="hours1" id="opHour" value="${hours1}">
          </div>


          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text2">Unterweisungen, sonstige Schulungen</label>
            <textarea ${lockFields} type="text" name="text2" id="text2" class="form-control input"
                      placeholder="Unterweisungen, betrieblicher Unterricht, sonstige Schulungen">${text2}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control " type="text" name="hours2" id="otherHour"  value="${hours2}">
          </div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text3">Themen des Berufsschulunterrichts</label>
            <textarea ${lockFields} type="text" name="text3" id="text3" class="form-control input"
                      placeholder="Themen des Berufsschulunterrichts">${text3}</textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input ${lockFields} class="form-control " type="text" name="hours3" id="text" value="${hours3}">
          </div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ Buttons am Ende ---------->

          <div class="form-group">
            <button type="submit" class="btn   btn-block btn-primary" name="send" id="send" value="Submit">Abschicken
            </button>
          </div>


        </div>

      </form>
    </div>


  </jsp:body>
</t:stdTempl>

