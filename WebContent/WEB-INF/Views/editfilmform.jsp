<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="editfilm.do" method="POST" modelAttribute="film">
		<label>Title: </label>
		<input type="hidden" name="filmId" value="${film.id }">
		<input type="text" name="filmTitle" value="${film.title }">
		<br/>
		<label>Description: </label>
		<input type="text" name="description" value="${film.description }">
		<br/>
		<label>Release Year: </label>
		<input type="text" name="releaseYear" value="${film.releaseYear }">
		<br/>
		<label>Language ID: </label>
		<input type="text" name="languageId" value="${film.languageId }">
		<br/>
		<label>Rental Duration: </label>
		<input type="text" name="rentalDuration" value="${film.rentalDuration }">
		<br/>
		<label>Rental Rate: </label>
		<input type="text" name="rentalRate" value="${film.rentalRate }">
		<br/>
		<label>Length: </label>
		<input type="text" name="length" value="${film.length }">
		<br/>
		<label>Replacement Cost: </label>
		<input type="text" name="replacementCost" value="${film.replacementCost }">
		<br/>
		<p>Select Rating:</p>
		<select name="rating">
		  <option value="g">G</option>
		  <option value="pg">PG</option>
		  <option value="pg13">PG-13</option>
		  <option value="r">R</option>
		  <option value="nc17">NC-17</option>
		</select>
		<br/>
		<h2>Select Special Features: </h2>
		  	<input type="checkbox" name="specialFeatures" value="Trailers"> Trailers<br>
  			<input type="checkbox" name="specialFeatures" value="Commentaries"> Commentaries<br>
		  	<input type="checkbox" name="specialFeatures" value="DeletedScenes"> Deleted Scenes<br>
		  	<input type="checkbox" name="specialFeatures" value="BehindTheScenes"> Behind the Scenes<br>
		<br/>
		<input type="submit" value="Edit Film">
	</form>
</body>
</html>