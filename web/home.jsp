<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hospital Bed Booking System</title>
	<link rel="stylesheet" type="text/css" href="home.css">
</head>
<body>
	<header>
		<h1>Hospital Bed Booking System</h1>
	</header>
	
	<main>
		<form action="booking.jsp" method="POST">
			<label for="patient-name">Patient Name:</label>
			<input type="text" id="patient-name" name="patientName" required>
			<br>
			<label for="bed-type">Bed Type:</label>
			<select id="bed-type" name="bedType" required>
				<option value="">--Select Bed Type--</option>
				<option value="general">General</option>
				<option value="semi-private">Semi-Private</option>
				<option value="private">Private</option>
			</select>
			<br>
			<label for="date">Date:</label>
			<input type="date" id="date" name="date" required>
			<br>
			<label for="duration">Duration (in days):</label>
			<input type="number" id="duration" name="duration" min="1" max="30" required>
			<br>
			<input type="submit" value="Book Bed">
		</form>
	</main>
	
	<footer>
		<p>&copy; 2023 Hospital Bed Booking System</p>
	</footer>
</body>
</html>

