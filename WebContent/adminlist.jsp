<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="univdb.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 페이지</title>
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
	div#header h1 a img{display:block; width:20%; margin:10px auto;}
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
	table td{color:#777;}
	table th,td{text-align:center; height:50px;}
	/* 푸터 */
	div#footer{width:100%; background-color:#333; border-top:#444;}
	div#footer address{width:90%; margin:0 auto; padding:15px 0; color:white; font-size:16px; font-weight:normal;}
	div#footer p{margin:0; padding:0;}
	
</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="Reservation.js"></script>
</head>
<body>
	<jsp:useBean id="reservdb" class="univdb.DBReservation" scope="page" />

	<%
	ArrayList<reservationbean>list = reservdb.getreservList();
	int counter = list.size();
	int row=0;
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
    <form name=reservform action="adminPro.jsp" method="post">
        <table>
        	<tr>
        		<th id="t_title" colspan="9">예약 목록 조회</th>
        	</tr>
            <tr>
                <th align=center>예약번호</th>
                <th align=center>날짜</th>
                <th align=center>테마</th>
                <th align=center>시간</th>
                <th align=center>인원</th>
                <th align=center>이름</th>
                <th align=center>연락처</th>
                <th align=center>비고</th> 
                <th align=center> </th>
            </tr>
       	<%
		if(counter > 0){
       		for(reservationbean rvb : list){
       			//홀짝 색상 다르게 지정
       			String color = "Lavender";
       			if(++row%2==0) color = "white";
       		
       	%>
            <tr bgcolor =<%=color %>
            	onmouseover="this.style.backgroundColor='SkyBlue'"
            	onmouseout="this.style.backgroundColor='<%=color %>'">
            	<td align=center><%=rvb.getIndex() %></td>
            	<td align=center><%=rvb.getDate() %></td>
            	<td align=center><%=rvb.getTheme() %></td>
            	<td align=center><%=rvb.getTime() %></td>
            	<td align=center><%=rvb.getNum() %></td>
            	<td align=center><%=rvb.getName() %></td>
            	<td align=center><%=rvb.getPhone() %></td>
            	<td align=center><%=rvb.getNote() %></td>
            	<td align=center>
            		<input type=hidden name="idx" value="<%=rvb.getIndex() %>">
            		<input type="submit" class="btn btn-primary" value="삭제" onClick="deleteck()">
            	</td>
            </tr>
        <%
       		}	
		}
        %>
            <tr>
            	<td colspan="3" align=left><b>total <%=counter %></b></td>
                <td colspan="6" align=right>
                <input type="button" class="btn btn-primary" value="확인" onClick="location.href='main.jsp'">
                </td>
            </tr>            
        </table>
    </form>
    </div>
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