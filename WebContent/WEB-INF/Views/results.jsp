<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Search Result</title>
</head>
<body>
	<h1>${film.title }</h1>
		<ul>
			<li>ID:</li>
			<li>$(film.id)</li>
			<li>Description:</li>
			<li>${film.description }</li>
		</ul>
</body>
</html>