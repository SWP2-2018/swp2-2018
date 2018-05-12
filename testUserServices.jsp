<%@page import="tablePojos.User" %>
<%@page import="services.UserService" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Test der User-Services: ERFOLGREICH.</title>
	</head>
	<body>
		<h1>UserServices erfolgreich getestet!</h1>
		<%

		// Initialisierung des User- und UserService Objektes.
			UserService uService = new UserService();
			List<User> testUsers = new ArrayList<>();


		// Test der create-Methode
			User dummy = new User("dummy711", "passwortante", (byte)0x0, "Häberle", "Hank", "Schwäbischer Allstar", 2019, 1, new Date(2018-1900,05,12));

			//uService.create(dummy);
			
			// ANMERKUNG: Beim Erstellen eines neuen Nutzers setzt der Auto-Inkrement in der DB nicht bei der ID des zuletzt hinzugefügten Nutzers an. Fix oder Nix?


		// Test der update-Methode
			User updatedDummy = new User("dummy711", "passwortante", (byte)0x1, "Häberle Jr", "Hank", "Schwäbischer Allstar", 1999, 1, new Date(2018-1900,05,13));

			uService.update(updatedDummy, uService.getByUserName("dummy711").getId());


		// Output-Tests der User-Getter-Methoden
			testUsers = uService.getAllByInstructorId(1);

			for(int i=0; i<testUsers.size(); i++) {
				out.println("ID: " + testUsers.get(i).getId() + "<br>");
				out.println("User-Name: " + testUsers.get(i).getUser() + "<br>");
				out.println("User-Password: " + testUsers.get(i).getPassword() + "<br>");
				out.println("Instructor: " + testUsers.get(i).getInstructor() + "<br>");
				out.println("Last Name: " + testUsers.get(i).getLast_name() + "<br>");
				out.println("First Name: " + testUsers.get(i).getFirst_name() + "<br>");
				out.println("Job: " + testUsers.get(i).getJob() + "<br>");
				out.println("Educational Year: " + testUsers.get(i).getEducational_year() + "<br>");
				out.println("Instructor ID: " + testUsers.get(i).getInstructor_id() + "<br>");
				out.println("Start Date: " + testUsers.get(i).getStart_date() + "<br>");
				out.println("<br>");
			}
		
		%>
	</body>
</html>