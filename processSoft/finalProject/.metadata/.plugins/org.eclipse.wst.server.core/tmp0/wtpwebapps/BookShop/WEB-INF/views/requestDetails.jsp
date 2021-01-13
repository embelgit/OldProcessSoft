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
			<td>Request_Id</td>
			
			<td>Request_Date </td>
			
			<td>Issue_date </td>
			 <td>Return_Date </td>
			<td>Status</td>
			<td>Book_Name</td>
			<td>Member_Name</td>
			</tr>
			
		<c:forEach var="request" items="${requestScope.requestlist}">
		
			<tr>
			    <td>${request.bookrequestId}</td>
				<td>${request.issueDate}</td>
				<td>${request.requestDate}</td>
				<td>${request.returnDate}</td>
				<td>${request.status}</td>
			    <td>${request.book.bookName}</td>
				<td>${request.member.memberName}</td>

			</tr>
		</c:forEach>
	</table>
	<a href="Admin">back_to_admin </a>

</body>

</body>
</html>