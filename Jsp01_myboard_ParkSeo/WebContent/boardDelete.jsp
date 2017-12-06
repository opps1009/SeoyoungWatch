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
<title>delete</title>
</head>
<%
int seq = Integer.parseInt(request.getParameter("seq"));


MyDao dao = new MyDao();
int res = dao.delete(seq);
%>
<%
if(res>0){
%>
<script type="text/javascript">
	alert("삭제 성공!!");
	location.href="boardList.jsp";
</script>
<%	
} else{
%>
<script type="text/javascript">
	alert("삭제 실패!!");
	location.href="boardDetail.jsp";
</script>
<%	
}
%>


<body>






</body>
</html>