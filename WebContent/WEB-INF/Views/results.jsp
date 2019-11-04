<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>Film Page</title>
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
	<c:if test="${film == null}">
		<h1>No film found. Please go back and try again.</h1>
	</c:if>
	<c:if test="${film != null}">
		<h1>${film.title }</h1>
		<ul>
			<li>ID: ${film.id}</li>
			<li>Description: ${film.description}</li>
			<li>Release Year: ${film.releaseYear}</li>

			<c:if test="${film.languageId == 1 }">
				<li>Language: English</li>
			</c:if>
			<c:if test="${film.languageId == 2 }">
				<li>Language: Italian</li>
			</c:if>
			<c:if test="${film.languageId == 3 }">
				<li>Language: Japanese</li>
			</c:if>
			<c:if test="${film.languageId == 4 }">
				<li>Language: Mandarin</li>
			</c:if>
			<c:if test="${film.languageId == 5 }">
				<li>Language: French</li>
			</c:if>
			<c:if test="${film.languageId == 6 }">
				<li>Language: German</li>
			</c:if>

			<li>Rental Duration: ${film.rentalDuration}</li>
			<li>Rental Rate: ${film.rentalRate}</li>
			<li>Replacement Cost: ${film.replacementCost}</li>
			<li>Length: ${film.length} minutes</li>
			<li>Category: ${film.category }</li>
			<li>Film Rating: ${film.rating}</li>
			<li>Special Features: ${film.specialFeatures}</li>
			<c:choose>
				<c:when test="${film.actorsInFilm.isEmpty()}">
				</c:when>
				<c:otherwise>
					<li>Actors: ${film.actorsInFilm}</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</c:if>
	<c:if test="${film.id > 1000 }">
		<form action="editfilmform.do" method="GET">
			<input type="hidden" name="filmId" value="${film.id }" /> <input
				type="hidden" name="filmTitle" value="${film.title }" /> <input
				type="hidden" name="description" value="${film.description }" /> <input
				type="hidden" name="releaseYear" value="${film.releaseYear }" /> <input
				type="hidden" name="languageId" value="${film.languageId }" /> <input
				type="hidden" name="rentalDuration" value="${film.rentalDuration }" />
			<input type="hidden" name="rentalRate" value="${film.rentalRate }" />
			<input type="hidden" name="length" value="${film.length }" /> <input
				type="hidden" name="replacementCost"
				value="${film.replacementCost }" /> <input type="hidden"
				name="rating" value="${film.rating }" /> <input type="hidden"
				name="specialFeatures" value="${film.specialFeatures }" /> <input
				type="submit" value="Edit" />
		</form>
		<form action="deletefilm.do" method="POST">
			<input type="hidden" name="filmId" value="${film.id }" /> <input
				type="submit" value="Delete" />
		</form>
	</c:if>
	<form action="index.html">
		<input type="submit" value="Home" />
	</form>
</body>
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
</html>