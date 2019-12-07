<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="univdb.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>커뮤니티</title>
    <style>
    html,body{width:100%; height:100%;}
	body{margin:0; padding:0; background-color:#231816;}
	ul{list-style:none;}
	a{text-decoration:none;}
	/* 헤더 */
	div#header{width:100%; padding:0; background-color:#f5bb0c; border-botton:1px solid #444; font-family:'Jalnan';}
	div#header ul.nav1{margin:0 auto; margin-right:20px; height:10px;}
	div#header ul.nav1 li{float:right; width:3%; padding:1%; text-align:center;}
	div#header ul li#s_name{width:6%; font-size:12px;}
	div#header ul.nav1 li a{font-size:12px; font-weight:bold; color:#555;}
	div#header ul.nav1 li a:visited{font-size:12px; font-weight:bold; color:#fff; border-top:1px solid #fff;}
	div#header ul.nav1 li a:hover{font-size:12px; font-weight:bold; color:#fff;}
	div#header h1{width:100%; padding:10px 0;}
	div#header h1 a{text-decoration:none; cursor:pointer;}
	div#header h1 a img{display:block; width:50%; margin:10px auto;}
	div#header ul.nav2{margin:0 auto; height:70px;}
	div#header ul.nav2 li{float:left; width:30%; padding:1%; color:#fff; text-align:center;}
	div#header ul.nav2 li a{font-size:20px; font-weight:bold; color:#555;}
	div#header ul.nav2 li a:visited{font-size:20px; font-weight:bold; color:#fff; border-top:1px solid #fff;}
	div#header ul.nav2 li a:hover{font-size:20px; font-weight:bold; color:#fff;}
	/* 테이블 */
	div.container{width:100%; margin:0; padding:0; background-color:#aaa; font-family:'BinggraeⅡ';}
	table{width:90%; margin:100px auto;  text-align:center;}
	table #t_title{font-size:20px;}
	table tr{border-top:1px solid #666; border-bottom:1px solid #666; border-collapse:collapse;}
	table th{color:white;}
	table td{color:#888; background-color:#fff;}
	table th,td{text-align:center; height:50px;}
	table td#btn{background-color:#CEE3F6;}
	/* 푸터 */
	div#footer{width:100%; background-color:#333; border-top:#444;}
	div#footer address{width:90%; margin:0 auto; padding:15px 0; color:white; font-size:16px; font-weight:normal;}
	div#footer p{margin:0; padding:0;}
    </style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:useBean id="boarddb" class="univdb.DBBoard" scope="page" />
	
	<%
	String num = request.getParameter("num");
	String id = "";
	String title = "";
	String content = "";
	
	if(session.getAttribute("sessionID")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용가능합니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	//글번호를 이용해서 레코드를 불러옴
	if (num != null){	
		int idnum = Integer.parseInt(num);
		DBBoard dbb = new DBBoard();
		boardbean drb = dbb.getBoard(idnum);
		id = drb.getId();
		title = drb.getTitle();
		content = drb.getContent();
	}
	%>

	<!-- 헤더 -->
	<div id="header">
		<ul class="nav1">
		<%
		if(session.getAttribute("sessionID")==null){
		%>
			<li><a href="LoginForm.jsp">Login</a></li>
			<li><a href="JoinForm.jsp">Join</a></li>
		<%
		}else{
		%>		
			<li><a href="LogoutPro.jsp">Logout</a></li>
			<li id="s_name"><%=session.getAttribute("sessionID") %>님</li>
		<%
		}
		%>
		</ul>
		<h1><a href="main.jsp"><img src="img/main.png"></a></h1>
		<ul class="nav2">
			<li><a href="ReservationForm1.jsp">테마예약</a></li>
			<li><a href="info.jsp">이용안내</a></li>
			<li><a href="Commu.jsp">커뮤니티</a></li>
		</ul>
	</div>
	
	<!-- 테이블 -->
  	<div class="container">
    <form action="BoardEdit.jsp" method="post">
    	<input type=hidden name="num" value="<%=num %>">
        <table>
        	<tr>
                <th width=20% align=center>아이디 :</th>
                <td><%=id %></td>
            </tr>
            <tr>
                <th width=30% align=center>글 제목 :</th>
                <td><%=title%></td>
            </tr>
            <tr>
            	<th width=20% align=center>내용 :</th>
                <td align=left><%=content %></td>
            </tr>
            <tr>
            	<td id="btn" colspan=2 align=left>
                <input type="button" class="btn btn-primary" value="목록보기" onClick="location.href='Commu.jsp'">
                <input type="submit" class="btn btn-primary" value="수정하기">
                </td>
            </tr>    
        </table>
    </form>
    </div>
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