<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "trainee/newReport.jsp");
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Neuer Bericht</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neuer Bericht</jsp:attribute>
    </t:navbar>


    <div class="container">

      <form action="reportCheck.jsp" method="post" autocomplete="off">
        <div class=" justify-content-lg-center inForm" >

          <div class="form-group">
            <hr/>
          </div>

          <div><h4>Wochenbericht von:</h4></div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ Betriebliche Tätigkeiten eingabe ---------->

          <div class="form-group">

            <label for="text1">Betriebliche Tätigkeiten</label>

            <textarea type="text" name="text1" id="text1" class="form-control input"
                      placeholder="Betriebliche Tätigkeiten"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input class="form-control" type="text" name="hours1" id="opHour">
          </div>


          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text2">Unterweisungen, sonstige Schulungen</label>
            <textarea type="text" name="text2" id="text2" class="form-control input"
                      placeholder="Unterweisungen, betrieblicher Unterricht, sonstige Schulungen"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input class="form-control " type="text" name="hours2" id="otherHour">
          </div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="text3">Themen des Berufsschulunterrichts</label>
            <textarea type="text" name="text3" id="text3" class="form-control input"
                      placeholder="Themen des Berufsschulunterrichts"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input class="form-control " type="text" name="hours3" id="text">
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

