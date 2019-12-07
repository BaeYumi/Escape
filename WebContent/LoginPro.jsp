<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="univdb.DBMember" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 Proccess</title>
</head>
<body>
	<jsp:useBean id="memberbean" class="univdb.memberbean" scope="page" />
	<jsp:setProperty property="id" name="memberbean" />
	<jsp:setProperty property="pwd" name="memberbean" />
	
	<%
			/* String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			int a = memberdb.Login(id, pwd); */
			DBMember dbc = new DBMember();
			int a = dbc.Login(memberbean.getId(), memberbean.getPwd());
			
			if(a==1){
				session.setAttribute("sessionID",memberbean.getId());	//세션 저장
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='LoginSuccess.jsp'");
				script.println("</script>");
			}else if(a==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(a==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 id입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('실행에 오류가 발생했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
		%>
</body>
</html>