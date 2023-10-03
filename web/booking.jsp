<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Booking Confirmation - Hospital Bed Booking System</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>Hospital Bed Booking System</h1>
	</header>
	
	<main>
		<h2>Booking Confirmation</h2>
		<p>Thank you for booking a bed at our hospital. Your booking details are as follows:</p>
		
		<table>
			<tr>
				<td>Patient Name:</td>
				<td><%= request.getParameter("patientName") %></td>
			</tr>
			<tr>
				<td>Bed Type:</td>
				<td><%= request.getParameter("bedType") %></td>
			</tr>
			<tr>
				<td>Date:</td>
				<td><%= request.getParameter("date") %></td>
			</tr>
			<tr>
				<td>Duration:</td>
				<td><%= request.getParameter("duration") %> days</td>
			</tr>
		</table>
	</main>
	
	<footer>
		<p>&copy; 2023 Hospital Bed Booking System</p>
	</footer>
                        <%
// Connect to the database
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver Registered");
String url = "jdbc:mysql:///demobedbooking?useSSL=false";
String username = "root";
String password = "root";

Connection conn = DriverManager.getConnection(url, username, password);

// Insert data into the database
String patientName = request.getParameter("patientName");
String bedType = request.getParameter("bedType");
String date = request.getParameter("date");
int duration = Integer.parseInt(request.getParameter("duration"));

String sql = "INSERT INTO beds (patientName, bedType, date, duration) VALUES (?, ?, ?, ?)";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, patientName);
pstmt.setString(2, bedType);
pstmt.setString(3, date);
pstmt.setInt(4, duration);

if (pstmt.executeUpdate() > 0) {
    out.println("New record created successfully");
} else {
    out.println("Error: Could not create record");
}

conn.close();
%>
</body>
</html>
