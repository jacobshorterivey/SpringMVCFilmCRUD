<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="style.css">

</head>
<body>
	<form action="editfilm.do" method="POST" modelAttribute="film">
		<label>Title: </label> <input type="hidden" name="filmId"
			value="${film.id }"> <input type="text" name="filmTitle"
			value="${film.title }"> <br /> <label>Description: </label> <input
			type="text" name="description" value="${film.description }">
		<br /> <label>Release Year: </label> <input type="text"
			name="releaseYear" value="${film.releaseYear }"> <br /> <label>Language
			ID: </label> <input type="text" name="languageId" value="${film.languageId }">
		<br /> <label>Rental Duration: </label> <input type="text"
			name="rentalDuration" value="${film.rentalDuration }"> <br />
		<label>Rental Rate: </label> <input type="text" name="rentalRate"
			value="${film.rentalRate }"> <br /> <label>Length: </label> <input
			type="text" name="length" value="${film.length }"> <br /> <label>Replacement
			Cost: </label> <input type="text" name="replacementCost"
			value="${film.replacementCost }"> <br />
		<p>Select Rating:</p>
		<select name="rating">
			<option value="G">G</option>
			<option value="PG">PG</option>
			<option value="PG13">PG-13</option>
			<option value="R">R</option>
			<option value="NC17">NC-17</option>
		</select> <br />
		<h2>Select Special Features:</h2>
		<input type="checkbox" name="specialFeatures" value="Trailers">
		Trailers<br> <input type="checkbox" name="specialFeatures"
			value="Commentaries"> Commentaries<br> <input
			type="checkbox" name="specialFeatures" value="Deleted Scenes">
		Deleted Scenes<br> <input type="checkbox" name="specialFeatures"
			value="Behind the Scenes"> Behind the Scenes<br> <br />
		<input type="submit" value="Edit Film">
	</form>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>