<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Page</title>
</head>
<body>
	<c:if test="${film == null}">
		<h1>No film found. Please go back and try again.</h1>
	</c:if>
	<c:if test="${film != null}">
		<h1>${film.title }</h1>
		<ul>
			<li>ID: ${film.id}</li>
			<li>Description: ${film.description}</li>
			<li>Release Year: ${film.releaseYear}</li>
			<li>Language ID: ${film.languageId}</li>
			<li>Rental Duration: ${film.rentalDuration}</li>
			<li>Rental Rate: ${film.rentalRate}</li>
			<li>Replacement Cost: ${film.replacementCost}</li>
			<li>Film Rating: ${film.rating}</li>
			<li>Special Features: ${film.specialFeatures}</li>
		</ul>
	</c:if>
	<c:if test="${film.id > 1000 }">
		<form action="filmsearch.html" method="GET">
		<input type="submit" value="Edit" />
		</form>
		<form action="addfilm.html" method="GET">
		<input type="submit" value="Delete" />
		</form>
	</c:if>

</body>
</html>