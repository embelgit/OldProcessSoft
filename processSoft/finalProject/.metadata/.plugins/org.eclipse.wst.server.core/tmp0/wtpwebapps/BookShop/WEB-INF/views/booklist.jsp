<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
		<tr>
			<td>Book Id</td>
			<td>ISBN </td>
			<td>Book Name </td>
			<td> NoOfCopies</td>
			<td> Category Id</td>
			<td> Author Id</td>
			<td> Publisher Id</td>
			</tr>
			
		<c:forEach var="book" items="${requestScope.book_list}">
		
			<tr>
			    <td>${book.bookId}</td>
				<td>${book.ISBN}</td>
				<td>${book.bookName}</td>
				<td>${book.noOfCoppies}</td>
				<td>${book.category.category}</td>
				<td>${book.author.authorName}</td>
				<td>${book.publisher.publisherName}</td>
			    <td><a href="<spring:url value='update/${book.bookId}'/>">Update</a></td>
				<td><a href="<spring:url value='deletebook/${book.bookId}'/>">delete</a></td>
				
				
			</tr>
		</c:forEach>
	</table>
		<a href="Admin">back_to_admin </a>
</body>
</html>