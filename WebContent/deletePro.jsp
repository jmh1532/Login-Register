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

		int result = 0;
		String id = request.getParameter("id").toString();
		String passwd = request.getParameter("passwd").toString();
		MemberDao md = MemberDao.getInstance();
		Member me = md.info(id);
		
		if(me.getPasswd().equals(passwd)){
		
		result = md.delete(id, passwd);
		if(result > 0){
			response.sendRedirect("loginForm.jsp");
		}else{

			%>
		<script type="text/javascript">
			alert("암호몰라");
			history.go(-1);
		</script>		
		<% }
		}%>
</body>
</html>