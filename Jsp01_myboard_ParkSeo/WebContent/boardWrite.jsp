<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 추가 시작 -->
	<%@ page import="com.dto.MyDto" %>
	<%@ page import="com.dao.MyDao" %>

	<% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>

	<!-- 추가 끝 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
</head>
<body>
<h1 style="color: blue">글 작성</h1>

<form action="boardWrite_after.jsp" method="post">
<table border="1">
	<col width="200px">
	<col width="400px">
	
	
	<tr>		
		<th style="color: blue;">작성자</th>
		<td><input type="text" name="myname" ></td>
	</tr>
		
	<tr>
	<th style="color: blue;">제목</th>
	<td><input type="text" name="mytitle"></td>
	</tr>
	
	<tr>
		<th style="color: blue;">내용</th>
		<td><textarea rows="10" cols="60" name="mycontent"></textarea></td>
	</tr>			
</table>

<input type="submit" value="등록" >
<input type="button" value="취소" onclick="location.href='boardList.jsp'">

</form>



</body>
</html>