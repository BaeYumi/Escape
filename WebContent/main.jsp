<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방탈출 Y</title>
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
	/* 컨텐츠 */
	div#content1{width:100%; margin:0 auto; text-align:center;}
	img#slide{width:100%;}
	div#event{width:1020px; margin:30px auto;}
	div#content2{width:1024px; margin:50px auto;}
	div#content2 h2{font-size:38px; text-align:center; color:white;}
	div#content2 h3{margin-bottom:20px; color:#ffe200; font-size:33px; font-weight:bold;}
	div.theme{width:1020px; height:550px; margin:30px auto; border:2px solid #ffe200;}
	div.left_div{width:35%; float:left; padding:2%;}
	div.left_div img{width:100%; display:block; margin:0 auto;}
	div.right_div{width:60%; float:right; padding:50px 0; text-align:left; font-family:'Jalnan';}
	div.right_div p.t_info{color:#fff; width:100%; font-size:20px; line-height:32px; font-weight:bold; display:block;}
	div.right_div p.t_cont{width:100%; color:white; font-size:16px; line-height:1.5; margin-top:25px;}
	div.reserv{margin-right:60px;}
	div.reserv input{float:right; display:block; width:150px; height:60px; background-color:#231816; font-size:26px; font-weight:bold; font-family:'Jalnan'; color: #ffe200; text-decoration: none; margin: 20px; border: 2px solid #ffe200;}
	/* 푸터 */
	div#footer{width:100%; background-color:#333; border-top:#444;}
	div#footer address{width:90%; margin:0 auto; padding:15px 0; color:white; font-size:16px; font-weight:normal;}
	div#footer p{margin:0; padding:0;}
</style>
</head>
<script type="text/javascript">
	var image1=new Image();
	image1.src="img/slide1.png";
	var image2=new Image();
	image2.src="img/slide2.png";
	var step=1;
	function slideit(){
		document.images.slide.src=eval("image"+step+".src");
	if(step<2)
		step++;
	else
		step=1;
		setTimeout("slideit()",2500);
	}
</script>
<body>
	<!-- 헤더 -->
	<div id="header">
		<ul class="nav1">
		<%
		if(session.getAttribute("sessionID")==null){
		%>
			<li><a href="LoginForm.jsp">Login</a></li>
			<li><a href="JoinForm.jsp">Join</a></li>
		<%
		}else if(session.getAttribute("sessionID").equals("admin")){
		%>
			<li><a href="LogoutPro.jsp">Logout</a></li>
			<li id="s_name"><%=session.getAttribute("sessionID") %>님</li>
			<li id="s_name"><a href="adminlist.jsp">관리자페이지로</a></li>
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
	<!-- 컨텐츠 -->
	<div id="content1">
		<!-- 슬라이더 -->
		<img id="slide" src="img/slide1.png" name=slide>
		<script>slideit();</script>
		<div id="event">
			<img src="img/event.png">
		</div>
	</div>
	<div id="content2">
		<h2>Theme</h2>
		<div class="theme">	
			<div class="left_div">
				<img src="img/theme1.jpg">
			</div>
			<div class="right_div">
				<h3>PC방 가는 길</h3>
				<p class="t_info">난이도 ★★★☆☆ <br>적정인원 2~6명</p>
				<p class="t_cont">
				PC방 가는 길.<br>엘리베이터 앞에 떨어져 있는 수상한 암호가 적힌 카드를 발견했다.
				<br>이게 도대체 무엇일까?<br>뭔가 기묘한 느낌에 엘리베이터 안을 둘러보는데...</p>
			</div>
			<div class="reserv">
				<form action="ReservationForm2.jsp" method="post">
				<input type="hidden" name="theme" value="PC방가는길">
				<input type="submit" value="예약">
				</form>
			</div>
		</div>
		<div class="theme">		
			<div class="left_div">
				<img src="img/theme2.jpg">
			</div>
			<div class="right_div">
				<h3>괴짜중딩 사차원</h3>
				<p class="t_info">난이도 ★★★★★ <br>적정인원 2~4명</p>
				<p class="t_cont">
				우리 반에 아싸 있거든? 이름까지 '사차원'임ㅋㅋㅋㅋㅋㅋ<br>뭐 하는 건지 맨날 과학실이랑 쓰레기장 왔다 갔다 하는데
				<br>오늘도 이상한 쓰레기를 한 가득 들고 집에 가더라고?<br>그래서 내가 뒤따라가 봤지...</p>
			</div>
			<div class="reserv">
				<form action="ReservationForm2.jsp" method="post">
				<input type="hidden" name="theme" value="괴짜중딩">
				<input type="submit" value="예약">
				</form>
			</div>
		</div>
		<div class="theme">
			<div class="left_div">
				<img src="img/theme3.jpg">
			</div>
			<div class="right_div">
				<h3>파커vs파커</h3>
				<p class="t_info">난이도 ★★★☆☆ <br>적정인원 2~6명</p>
				<p class="t_cont">
				어느 날 갑자기 사라진 딸 엘리스의 행방을 찾아<br> 긴 시간을 헤매던 토니파커는 엘리스가 있다는 곳의 정보를 받아 찾아 나선다.
				<br>그 곳에서 만난 의외의 인물 김파커...<br>그 둘의 운명은 과연...?</p>
			</div>
			<div class="reserv">
				<form action="ReservationForm2.jsp" method="post">
				<input type="hidden" name="theme" value="파커vs파커">
				<input type="submit" value="예약">
				</form>
			</div>	
		</div>	
		<div class="theme">		
			<div class="left_div">
				<img src="img/theme4.jpg">
			</div>
			<div class="right_div">
				<h3>8585세탁소</h3>
				<p class="t_info">난이도 ★★☆☆☆ <br>적정인원 2~4명</p>
				<p class="t_cont">
				이 동네에서 제일 잘나가는 빨래, 수선 전문점 8585 세탁소 주인 표벽재.<br>가끔 수상한 빨래들이 와서 이상한 느낌이 들기도 했지만,
				<br>어차피 나는 열심히 빨아서 돈이나 벌면 그만이었다.<br>그러던 어느 날, 내 금쪽같은 아들이 갑자기 사라졌다.</p>
			</div>
			<div class="reserv">
				<form action="ReservationForm2.jsp" method="post">
				<input type="hidden" name="theme" value="8585세탁소">
				<input type="submit" value="예약">
				</form>
			</div>	
		</div>
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