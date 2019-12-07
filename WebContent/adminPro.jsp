<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 페이지 리스트 삭제 프로세스</title>
	<script src="Resrvation.js"></script>
</head>
<body>
	<jsp:useBean id="reservdb" class="univdb.DBReservation" scope="page" />
	<jsp:useBean id="brdb" class="univdb.reservationbean" scope="page" />

	<%
	String idx = request.getParameter("idx");
	int idnum = Integer.parseInt(idx);
	reservdb.deleteList(idnum);
	response.sendRedirect("adminlist.jsp");
	%>
</body>
</html>