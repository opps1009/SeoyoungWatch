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
<title>update_after</title>
</head>
<%
int myno = Integer.parseInt(request.getParameter("myno"));
String mytitle=request.getParameter("mytitle");
String mycontent=request.getParameter("mycontent");

MyDto dto = new MyDto(myno,mytitle,mycontent);
MyDao dao = new MyDao();
int res = dao.update(dto);
%>
<%
if(res>0){
%>
<script type="text/javascript">
alert("수정 성공!!");
location.href="boardList.jsp?myno=<%=dto.getMyno()%>";
</script>
<%	
} else{
%>
<script type="text/javascript">
alert("수정 실패!!");
location.href="boardUpdate.jsp?myno=<%=dto.getMyno()%>";
</script>
<%
}
%>

<body>

</body>
</html>