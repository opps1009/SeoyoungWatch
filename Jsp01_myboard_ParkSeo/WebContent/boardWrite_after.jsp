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
<title>write_after</title>
</head>
<body>
<%
String myname = request.getParameter("myname");
String mytitle = request.getParameter("mytitle");
String mycontent = request.getParameter("mycontent");

MyDto dto = new MyDto(myname,mytitle,mycontent);
MyDao dao = new MyDao();
int res = dao.insert(dto);
%>
<%
if(res>0){	
%>
<script type="text/javascript">
	alert("작성완료!!");
	location.href="boardList.jsp";
</script>
<%
} else{
%>
<script type="text/javascript">
	alert("작성실패");
	location.href="boardWrite.jsp";
</script>
<%
}
%>

</body>
</html>