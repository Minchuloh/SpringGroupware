<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th,td {
	padding: 2px;
	border: 1px solid gray;
}
</style>
</head>
<body>
	<h1>Test</h1>
	<table>
		<tr>
			<th>EdiCode</th>
			<th>InpEmpCode</th>
			<th>EdiTitle</th>
			<th>EdiContents</th>
			<th>EdiType</th>
			<th>EdiStatus</th>
			<th>FileName</th>
			<th>InpDate</th>
			<th>UpdateDate</th>
		</tr>

		<c:forEach var="edi" items="${ edi }">
			<tr>
				<td>${ edi.ediCode }</td>
				<td>${ edi.inpEmpCode }</td>
				<td>${ edi.ediTitle }</td>
				<td>${ edi.ediContents }</td>
				<td>${ edi.ediType }</td>
				<td>${ edi.ediStatus }</td>
				<td>${ edi.fileName }</td>
				<td>${ edi.inpDate }</td>
				<td>${ edi.updateDate }</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>