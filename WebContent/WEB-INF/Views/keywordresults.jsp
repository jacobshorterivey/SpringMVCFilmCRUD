<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keyword search results</title>
</head>
<body>
<c:choose>
  <c:when test="${films.isEmpty}">
    <h1>No films found with that keyword. Please go back and try again.</h1>
  </c:when>
  <c:otherwise>
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
  </c:otherwise>
</c:choose>
</body>
</html>