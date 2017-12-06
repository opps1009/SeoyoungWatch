<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
    <%@ page import="com.dto.MyDto" %>
	<%@ page import="com.dao.MyDao" %>

	<% request.setCharacterEncoding("UTF-8"); %>
	<% response.setContentType("text/html; charset=UTF-8"); %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
</head>

<%
int myno = Integer.parseInt(request.getParameter("seq"));

//1.객체 생성
MyDao dao = new MyDao();
MyDto dto = new MyDto();
//2.selectOne
dto = dao.selectOne(myno);
//---------서버-----------

//---------화면-----------
//3.화면에 값 전달
%>
<body>
<!-- 이름,제목,내용// -->
<form action="boardUpdate_after.jsp" method="post">
	<table>
		<tr>
			<th>이름 : </th>
			<td><%=dto.getMyname() %></td>
		</tr>
		
		<tr>
			<th>제목 : </th>
			<td><input type="text" name= "mytitle" value="<%=dto.getMytitle() %>"></td>
		</tr>
		<tr>
			<th>내용 : </th>
			<td><textarea rows="10" cols="60" name="mycontent"><%=dto.getMycontent() %></textarea></td>		
		</tr>				
	</table>
	<input type="hidden" name="myno" value="<%=dto.getMyno()%>">
	<input type="submit" value="수정" >
	<input type="button" value="취소" onclick="location.href='boardList.jsp'">

</form>


</body>
</html>