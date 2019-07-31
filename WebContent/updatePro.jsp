<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mvc1.test.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mvc1.test.MemberDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		MemberDao md = MemberDao.getInstance();
		Member me = new Member();
		me.setId(id);
		me.setPasswd(passwd);
		me.setName(name);
		me.setTel(tel);
		me.setAddress(address);
		
		int result = md.update(me);
		if(result == 1){
			session.setAttribute("id", id);
			response.sendRedirect("updateSuccess.jsp");
		} else{ %>
		<script type="text/javascript">
			alert("회원 정보 수정 실패");
			history.go(-1);
		</script>
		<% } %>
</body>
</html>