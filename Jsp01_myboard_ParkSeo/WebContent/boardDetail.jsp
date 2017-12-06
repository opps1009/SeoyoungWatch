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
<title>detail</title>
</head>
<body>
<%	
	int myno = Integer.parseInt(request.getParameter("seq"));
	MyDto dto = new MyDto();
	MyDao dao = new MyDao();
	dto = dao.selectOne(myno);
%>

<table border="1">

      
	<tr>
		 <th style="color: blue;">작성자</th>
		 <td><%=dto.getMyname() %></td>		 
	</tr>
	
	<tr>
		<th style="color: blue;">제목</th>
		<td><%=dto.getMytitle() %></td>
	</tr>
	
	<tr>
		<th style="color: blue;">내용</th>		
		<td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getMycontent() %></textarea></td>
		
	</tr>	
</table>
<input type="hidden" name ="myno" values="<%=dto.getMyno() %>">
<input type="button" value="수정" onclick="location.href='boardUpdate.jsp?seq=<%=dto.getMyno()%>'">
<input type="button" value="삭제" onclick="location.href='boardDelete.jsp?seq=<%=dto.getMyno()%>'">
<input type="button" value="목록" onclick="location.href='boardList.jsp'">


</body>
</html>