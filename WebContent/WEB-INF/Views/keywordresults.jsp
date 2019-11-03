<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keyword search results</title>
</head>
<body>

<%-- <c:choose>
  
  <c:when test="${films.isEmpty()}">
		<h1>No films found with that keyword.</h1>
		<p>Please go back and try again.</p>
  </c:when> --%>
  
<%--   <c:otherwise>
 --%>		
		<c:forEach var="film" items="${films}">
			<h3>${film.title }</h3>
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
			<br />
			<p>***************************************************</p>
			<br />
		</c:forEach>
<%-- 
  </c:otherwise>
</c:choose> --%>

</body>
</html>