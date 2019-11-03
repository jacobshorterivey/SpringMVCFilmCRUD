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
			<li>Language: ${film.language}</li>
			<li>Rental Duration: ${film.rentalDuration}</li>
			<li>Rental Rate: ${film.rentalRate}</li>
			<li>Replacement Cost: ${film.replacementCost}</li>
			<li>Film Rating: ${film.rating}</li>
			<li>Special Features: ${film.specialFeatures}</li>
		</ul>
	</c:if>
	<c:if test="${film.id > 1000 }">
		<form action="editfilmform.do" method="GET">
		<input type="hidden" name="filmId" value="${film.id }" />
		<input type="hidden" name="filmTitle" value="${film.title }" />
		<input type="hidden" name="description" value="${film.description }" />
		<input type="hidden" name="releaseYear" value="${film.releaseYear }" />
		<input type="hidden" name="languageId" value="${film.languageId }" />
		<input type="hidden" name="rentalDuration" value="${film.rentalDuration }" />
		<input type="hidden" name="rentalRate" value="${film.rentalRate }" />
		<input type="hidden" name="length" value="${film.length }" />
		<input type="hidden" name="replacementCost" value="${film.replacementCost }" />
		<input type="hidden" name="rating" value="${film.rating }" />
		<input type="hidden" name="specialFeatures" value="${film.specialFeatures }" />
		<input type="submit" value="Edit" />
		</form>
		<form action="deletefilm.do" method="POST">
		<input type="hidden" name="filmId" value="${film.id }" />
		<input type="submit" value="Delete" />
		</form>
	</c:if>

</body>
</html>