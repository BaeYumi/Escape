<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시물 등록/수정/삭제 처리 Process</title>
	<script src="boardForm.js"></script>
</head>
<body>
	<jsp:useBean id="dbb" class="univdb.DBBoard" scope="page" />
	<jsp:useBean id="brdb" class="univdb.boardbean" scope="page" />
	
	<%
	request.setCharacterEncoding("utf-8");
	//등록, 수정, 삭제 중 하나 저장
	String menu = request.getParameter("menu");
	//등록 수정 처리 모듈
	if (menu.equals("delete") || menu.equals("update")){
		String num = request.getParameter("num");
		int idnum = Integer.parseInt(num);
		
		if(menu.equals("delete")){
			dbb.deleteDB(idnum);
		}else if(menu.equals("update")){
	%>
		<jsp:setProperty name="brdb" property="num" />
		<jsp:setProperty name="brdb" property="id" />
		<jsp:setProperty name="brdb" property="title" />
		<jsp:setProperty name="brdb" property="content" />
	<%
		dbb.updateDB(brdb);
		}
		response.sendRedirect("Commu.jsp");
	}else if(menu.equals("insert")){
	%>
		<jsp:setProperty name="brdb" property="id" />
		<jsp:setProperty name="brdb" property="title" />
		<jsp:setProperty name="brdb" property="content" />
	<%
		dbb.insertDB(brdb);
		response.sendRedirect("Commu.jsp");
	}	
	%>
	<!-- 푸터 -->
	<div id="footer">
		<address>
			<p><b>대표전화 : 053-123-4567 / 영업시간 : 평일 AM11:00 ~ PM23:00/주말 AM10:30 ~ PM23:30</b><br>
			주소 : 대구광역시 중구 동성로 1길 11, 3층<br>
			사업자 등록번호 : 505-00-00000 / 대표 : 뱀<br><br>
			Copyright &copy; 2019. All Rights Reserved.</p>
		</address>
	</div>
</body>
</html>