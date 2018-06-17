# Backend

## Wichtige Information

Um Hibernate nutzen zu können, müsst ihr sowohl die IP Adresse, als auch das Datenbank Passwort von euch
in die `hibernate.cfg.xml` schreiben, welche unter `WEB-INF/classes/` liegt.
Die passende IP könnt ihr ermitteln, indem ihr mit `docker ps` eure laufenden Container anzeigen lasst
und hier die Container ID von der "mariadb" kopiert und anschliesend mit `docker inspect [Container ID]` 
im untern Teil eine Zeile findet in der die IP Adresse steht: ` "IPAddress": "172.18.0.3", `.

## Informationen zum PDF Service 

PDF Beispiel in der Datei testpdf.jsp
JSP zeigt keine Infos an, PDF wird im code gespeichert.

## Beispiel JSPs noch nicht kompatibel mit den erneuerten Services

Aktuell ist das Hibernate auf die drei POJOs 'User' 'Report' und 'Report_Revision' 
eingestellt. Falls Änderungen an jenen Java Dateien durch geführt werden,
müssen diese neu compiliert werden. Dafür liegt aktuell noch nur eine Batch Datei vor
`buildClassFiles.bat` , welche alle drei neu compiliert und in das notwendige Verzeichnis
`WEB-INF/classes/tablePojos/` schreibt. Sollten Änderungen an den Feldern durchgeführt werden,
 so muss auch dem enstprechend die jeweilige `*.hbm.xml` unter `WEB-INF/classes/` angepasst werden.
 
Gleiches gilt aktuell noch für die "Services". Werden diese verändert müssen sie auch neu kompiliert werden.
Das geht aber leider (noch) nicht einfach per IDE oder batch Datei. 
Deswegen läuft die Kompilierung aktuell noch über ein extra Projekt welches nur für das kompilieren zuständig ist.
Somit ist es aktuell nicht zu empfehlen an den Services Änderungen durch zu führen. Eine Lösung ist in Arbeit.

Der eigentliche Zugriff erfolgt dann über die schon genannten Services: 
`ReportRevisionService` , `ReportService` und `UserService`. 

In diesen solltet ihr aktuell alle benötigten Methonden finden um mit der Datebank zu kommunizieren zu können.
Um die Services zu nutzen müsst ihr in einer JSP Imports durchführen:

`<%@page import="tablePojos.User" %>`  
`<%@page import="tablePojos.Report" %>`  
`<%@page import="tablePojos.Report_Revision" %>`

`<%@page import="services.UserService" %>`  
`<%@page import="services.ReportRevisionService" %>`   
`<%@page import="services.ReportService" %>`  
  
 Innerhalb des Java Codes einer JSP könnt dann einfach eine Instanz jenes benötigten Service erstellen und somit auf die Methonden zugreifen.
 




 

