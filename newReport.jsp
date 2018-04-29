<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<!-- Setzte Attribute Page für die navbar -->
<%
  request.setAttribute("page", "newReport.jsp");
%>


<t:stdTempl>
  <jsp:attribute name="titleText"> - Neuer Bericht</jsp:attribute>
  <jsp:body>
    <t:navbar>
      <jsp:attribute name="navText">Neuer Bericht</jsp:attribute>
    </t:navbar>


    <div class="container">

      <form  action="reportCheck.jsp" method="post" autocomplete="off">


        <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-4 ">

          <div class="form-group">
            <hr/>
          </div>

          <!------ Betriebliche Tätigkeiten eingabe ---------->

          <div class="form-group">
            <label for="operatingActivities">Betriebliche Tätigkeiten</label>
            <textarea type="text" name="operatingActivities" id="operatingActivities" class="form-control input"
                      placeholder="Betriebliche Tätigkeiten"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
              <input class="form-control" type="text" name="opHour" id="opHour">
          </div>


          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="otherCourses">Unterweisungen, sonstige Schulungen</label>
            <textarea type="text" name="otherCourses" id="otherCourses" class="form-control input"
                   placeholder="Unterweisungen, betrieblicher Unterricht, sonstige Schulungen"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input class="form-control " type="text" name="otherHour" id="otherHour">
          </div>

          <div class="form-group">
            <hr/>
          </div>


          <!------ sonstige Schulungen eingabe ---------->
          <div class="form-group">
            <label for="otherCourses">Themen des Berufsschulunterrichts</label>
            <textarea type="text" name="vocationalSchool" id="vocationalSchool" class="form-control input"
                   placeholder="Themen des Berufsschulunterrichts"></textarea>
          </div>

          <div class="form-group form-inline">
            <label class="control-label col-4">Stunden</label>
            <input class="form-control " type="text" name="schoolHour" id="schoolHour">
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

