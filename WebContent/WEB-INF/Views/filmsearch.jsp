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

	<h3>
		<strong>Film Search</strong>
	</h3>
	
	<form:form action="results.do" method="GET" modelAttribute="film">
		<form:label path="filmId">Film ID: </form:label>
		<form:input path="filmId" name="filmId" />
		<form:errors path="filmId" />
		<br />
		<input type="submit" value="Submit" />
	</form:form>
	
</body>
</html>