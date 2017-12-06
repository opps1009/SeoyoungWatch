<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 추가 시작 -->
<%@ page import="com.dto.MyDto" %>
<%@ page import="com.dao.MyDao" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!-- 추가 끝 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>

<h1 style="color: blue">게 시 판</h1>
<%
	MyDao dao = new MyDao();
	List<MyDto> list  = dao.selectAll();
	
	
%>
<table border="1">

	<col width="50px">
	<col width="100px">
	<col width="400px">
	<col width="200px">
	
	<tr>
		<th style="color: blue">번호</th>
		<th style="color: blue">작성자</th>
		<th style="color: blue">제목</th>
		<th style="color: blue">작성일</th>
	
	</tr>
	
	<tr>
	<% 
	for(int i=0;i<list.size();i++){
		MyDto dto = new MyDto();
		dto = list.get(i);
	%>	
		<th><%=dto.getMyno() %></th>
		<th><%=dto.getMyname() %></th>
		<th><a href="boardDetail.jsp?seq=<%=dto.getMyno()%>"><%=dto.getMytitle() %></a></th>
		<th><%=dto.getMadate() %></th>
		
	</tr>
	<%
	}
	%>	
</table>
<a href="boardWrite.jsp"><input type="button" value="글쓰기"></a>

</body>
</html>