<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="editProfile" method="post">
		<table>
			<tr>
				<td>Member Name</td>
				<td><form:input path="memberName" value="${requestScope.currentUser.memberName}" readonly="false" /></td>
			</tr>
			<tr>
				<td>phone number</td>
				<td><form:input path="phoneNo" value="${requestScope.currentUser.phoneNo}" readonly="false"/></td>
			</tr>
			
			<tr>
				<td>Email ID</td>
				<td><form:input path="emailId" value="${requestScope.currentUser.emailId}" readonly="false"/></td>
			</tr>
			<tr>
				<td>user name</td>
				<td><form:input path="userName" value="${requestScope.currentUser.userName}" readonly="false"/></td>
			</tr>
		
	
			
			<tr>
				<td><input type="submit" value="Update Profile" /></td>
			</tr>

		</table>
		<a href="user">back_to_HomePage</a>
	</form:form>

</body>
</html>