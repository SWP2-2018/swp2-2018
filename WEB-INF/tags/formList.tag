<%@tag description="formList" pageEncoding="UTF-8" %>
<%@attribute name="formList" fragment="true" %>

<%@ tag import ="java.util.List"%>

<%@ tag import="tablePojos.Report" %>


    <!-----Ueberschrift----->
 <!--   <a class="navbar-brand" href="">
      <jsp:invoke fragment="formList"/>
    </a>
-->

<div class="inForm">
  <ul class="list-group">

        <%

          //Erstellte Liste der aktiven Seite in lrs schreiben
          List<Report> lrs = request.getAttribute("listReports");

          String ausgabe = "";

          //Listenelemente durchgehen
          for (int i = 0; i < lrs.size(); i++) {
            //Form für die Postmethode erstellen um Daten weiter an die editReport.jsp zu senden
            ausgabe = ausgabe + "<form id=\"reports\" action=\"editReport.jsp\" method=\"post\">";

            //Versteckte reportID mitsenden
            ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(i).getId() + "\" />";
            //Versteckter reportStatus mitsenden
            ausgabe = ausgabe + "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(i).getStatus() + "\" />";
            //Listenelement als Submitbutton ausweißen
            ausgabe = ausgabe + "<input type =\"Submit\" name=\"SubmitReport\" value=\"Wochenbericht vom " +
              lrs.get(i).getDate() + "\"class=\"list-group-item list-group-item-action";

            //Listenelement je nach Status und User farben

            //Blau Färben
            if(lrs.get(i).getStatus() == 1 || session.getAttribute("instructor").equals(1)){
              ausgabe = ausgabe + " list-group-item-primary";
            }
            //Gelb Färben
            else if(lrs.get(i).getStatus() == 2 && session.getAttribute("instructor").equals(0)){
              ausgabe = ausgabe + " list-group-item-warning";
            }
            //Rot Färben
            else if(lrs.get(i).getStatus() == 3){
              ausgabe = ausgabe + " list-group-item-danger";
            }
            //Grün färben
            else if(lrs.get(i).getStatus() == 4){
              ausgabe = ausgabe + " list-group-item-success";
            }
            ausgabe = ausgabe + " text-center\"></form>";
          }


          out.print(ausgabe);

          request.setAttribute("berichte", ausgabe);

        %>

        ${berichte}


      </ul>
    </div>

    <jsp:doBody/>
