# Backend

## Wichtige Information

Da sowohl Docker "normal" als auch Docker Toolbox verwendet wird,
muss je nach dem der Hostname "db" (Docker normal)
oder die IP Adresse der Datenbank bzw. des entsprechendem Containers
(Docker Toolbox) in der `hibernate.cfg.xml` eingestellt werden.

Aktuell ist das Hibernate auf die drei POJOs 'User' 'Reprt' und 'Report_Revision' 
eingestellt. Falls Änderungen an jenen Java Dateien durch geführt werden,
müssen diese neu compiliert werden. Dafür liegt aktuell noch nur eine Batch Datei vor
`buildClassFiles.bat` , welche alle drei neu compiliert und in das notwendige Verzeichnis
`WEB-INF/classes/tablePojos/` schreibt. Sollten Änderungen an den Feldern durchgeführt werden,
 so muss auch dem enstprechend die jeweilige `*.hbm.xml` unter `WEB-INF/classes/` angepasst werden.

Aktuell besteht mit der Datei `test_hib_lesen.jsp` eine einfache Möglichkeit, die Lauffähigkeit des 
Hibernates in Zusammenhang mit der User-Tabelle zu testen. 

 

