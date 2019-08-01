<%@page import="mvc1.test.Member"%>
<%@page import="mvc1.test.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	MemberDao md = MemberDao.getInstance();
	Member me = md.info(request.getParameter("id").toString());
	
%>
</head>
<body>
<form action="updatePro.jsp">


	<table>
		<caption><h2>회원 정보 수정</h2></caption>

		<tr><td>이름</td><td>
		<input type="text" name="name" required="required" value="<%= me.getName()%>"></td></tr>
		
		
		<input type="hidden" name="id" required="required" value="<%= me.getId()%>"></td></tr>
		
		<tr><td>Password</td><td>
		<input type="password" name="passwd" required="required"></td></tr>
		
		<tr><td>주소</td><td>
		<input type="text" name="address" required="required" value="<%= me.getAddress()%>"></td></tr>
		
		<tr><td>전화번호</td><td>
		<input type="text" name="tel" required="required" value="<%= me.getTel()%>"></td></tr>
		
		<tr><td><input type="submit" value="확인"></td>
		<td><input type="reset" value="다시 작성"></td>
		</tr>
	</table>
</form>
</body>
</html>