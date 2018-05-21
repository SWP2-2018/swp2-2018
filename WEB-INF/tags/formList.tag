<%@tag description="formList" pageEncoding="UTF-8" %>
<%@attribute name="formList"%>

<%@tag import ="java.util.List"%>

<%@tag import="services.UserService" %>

<%@tag import="tablePojos.Report" %>

        <%
          try(UserService us = new UserService()) {
            //Erstellte Liste der aktiven Seite in lrs schreiben
            List<List<Report>> allReportLists = (List<List<Report>>) request.getAttribute("listReports");
            String ausgabe = "";
            String reportData = "";


            //Es sollen nur die Elemente durchgegangen werden die Benötigt werden
            //Wenn formList -1 ist werden alle ellemente in der List durchgegangen
            //Wenn formList einen anderen wert enthält wird nur diese eine Reportliste ausgegeben
            for (int i = formList.equals("-1") ? 0 : Integer.parseInt(formList); i <= (formList.equals("-1") ? allReportLists.size() - 1 : Integer.parseInt(formList)); i++) {

              List<Report> lrs = allReportLists.get(i);

              //Listenelemente durchgehen
              for (int j = 0; j < lrs.size(); j++) {
                //Es sollen nur Berichte Angezeigt werden die den Status != 0 haben
                if (lrs.get(j).getStatus() != 0) {

                  if (session.getAttribute("instructor").toString().equals("1")) {
                    reportData = "\n" + us.getById(lrs.get(j).getUser_id()).getLast_name() + ", " + us.getById(lrs.get(j).getUser_id()).getFirst_name();
                  }

                  //Form für die Postmethode erstellen um Daten weiter an die editReport.jsp zu senden
                  ausgabe += "<form id=\"reports\" action=\"../editReport.jsp\" method=\"post\">\n";

                  //Versteckte reportID mitsenden
                  ausgabe += "<input type=\"hidden\" name=\"reportID\" value=\"" + lrs.get(j).getId() + "\" />\n";

                  //Versteckter reportStatus mitsenden
                  ausgabe += "<input type=\"hidden\" name=\"reportStatus\" value=\"" + lrs.get(j).getStatus() + "\" />\n";

                  //Listenelement als Submitbutton ausweißen
                  ausgabe += "<input type =\"Submit\" name=\"SubmitReport\" id=\"reportText\" value=\"Bericht: "
                    + lrs.get(j).getDate() + reportData + " \"class=\"list-group-item list-group-item-action";

                  //Listenelement je nach Status und User färben

                  //Blau Färben
                  if (lrs.get(j).getStatus() == 1 || (session.getAttribute("instructor").toString().equals("1") && lrs.get(j).getStatus() == 2)) {
                    ausgabe += " list-group-item-primary";
                  }
                  //Gelb Färben
                  else if (lrs.get(j).getStatus() == 2 && session.getAttribute("instructor").toString().equals("0")) {
                    ausgabe += " list-group-item-warning";
                  }
                  //Rot Färben
                  else if (lrs.get(j).getStatus() == 3) {
                    ausgabe += " list-group-item-danger";
                  }
                  //Grün färben
                  else if (lrs.get(j).getStatus() == 4) {
                    ausgabe += " list-group-item-success";
                  }
                  ausgabe += " text-center\">\n</form>\n";
                }
              }
            }
            request.setAttribute("berichte", ausgabe);
          }
        %>

        ${berichte}



