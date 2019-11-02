<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1><em>Home Page</em></h1>
	<h3><strong>Film Search</strong></h3>
	<form:form action="home.do" method="GET" modelAttribute="film">
		<form:label path="filmId">Film ID: </form:label> <br/>
		<form:input path="filmId" name="filmId"/><br/>
		<form:errors path="filmId"/> <br/>
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>
