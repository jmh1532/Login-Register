<%@page import="mvc1.test.Member"%>
<%@page import="mvc1.test.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%

	String id = request.getParameter("id").toString();
%>
<form action="deletePro.jsp">
	<table>
		<caption><h2>회원 탈퇴</h2></caption>
		<h5>비밀 번호를 입력하시면 회원 탈퇴가 이루어 집니다.</h5>
		<tr><td>Password</td><td>
		<input type="password" name="passwd" required="required"></td></tr>
		<input type="hidden" name="id" value=<%=id %>>
		<tr><td><input type="submit" value="확인"></td>
		<td><input type="button" value="취소" onclick="location.href='loginForm.jsp'"></td>
		</tr>
	</table>
</form>
</body>
</html>