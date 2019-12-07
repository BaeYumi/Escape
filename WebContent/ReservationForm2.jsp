<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="univdb.*" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예약하기</title>
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
	div.container{width:100%; margin:0; padding:0; background-color:#231816; font-family:'Jalnan';}
	table{width:30%; margin:100px auto; text-align:center;}
	table #t_title{font-size:20px;}
	table tr{border-top:1px solid #666; border-bottom:1px solid #666; border-collapse:collapse;}
	table th{color:white;}
	table td{color:#777; font-size:15px; line-height:2;}
	table th,td{text-align:center; height:50px;}
	/* 푸터 */
	div#footer{width:100%; background-color:#333; border-top:#444;}
	div#footer address{width:90%; margin:0 auto; padding:15px 0; color:white; font-size:16px; font-weight:normal;}
	div#footer p{margin:0; padding:0;}
    </style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="form.js, https://maxcdn.booWtstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="MemberForm.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String theme = request.getParameter("theme");
	%>
	<jsp:useBean id="reservdb" class="univdb.DBReservation" scope="page" />
	<jsp:useBean id="reservbean" class="univdb.reservationbean" scope="page" />
	<!-- setProperty는 request와 같은 역할 -->
	
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
    <!-- submit버튼에 onClick 이벤트를 줄때는 return을 붙이고 자바스크립트 함수에 return false;를 쓴다 -->
	<form action="ReservationPro.jsp" method="get" name="reserInfo" onsubmit="return checkReserv2()">
        <table>
        	<tr>
                <th id="t_title" colspan="3">예약하기</th>     
            </tr> 
            <tr>
                <th>날짜</th>
                <td colspan="2"><input type="date" class="form-control" name="date"></td>
            </tr>
            <tr>
                <th>테마</th>
                <td colspan="2">
            <%	
            if(theme.equals("PC방가는길")){
            %>
            	<input type="radio" name="theme" value="PC방가는 길" checked="checked">PC방가는 길
        	<%		
            }else if(theme.equals("괴짜중딩")){
            %>
            	<input type="radio" name="theme" value="괴짜중딩" checked="checked">괴짜중딩
            <% 			
       		}else if(theme.equals("파커vs파커")){         
     		 %>
                <input type="radio" name="theme" value="파커vs파커" checked="checked">파커vs파커
            <%
            }else if(theme.equals("8585세탁소")){   
            %>
            	<input type="radio" name="theme" value="8585세탁소" checked="checked">8585세탁소
            <%
            }
            %>
                </td>        
            </tr>
            <tr>
                <th>시간</th>
                <td colspan="2">
      <% 
       		if(theme.equals("PC방가는길")){
      %>
      			<select name="time" class="form-control">
                    <option value="12:15">12:15</option>
                    <option value="13:50">13:50</option>
                    <option value="15:20">15:20</option>
                    <option value="17:25">17:25</option>
                    <option value="18:55">18:55</option>
                    <option value="20:25">20:25</option>
                    <option value="21:55">21:55</option>
                </select>
      <% 			
       		}else if(theme.equals("괴짜중딩")){         
      %>
      			<select name="time" class="form-control">
                    <option value="12:10">12:10</option>
                    <option value="13:25">13:25</option>
                    <option value="14:40">14:40</option>
                    <option value="13:55">13:55</option>
                    <option value="17:05">17:05</option>
                    <option value="18:20">18:20</option>
                    <option value="19:35">19:35</option>
                </select>
      <% 			
       		}else if(theme.equals("파커vs파커")){         
      %>
      			<select name="time" class="form-control">
                    <option value="12:30">12:30</option>
                    <option value="14:00">14:00</option>
                    <option value="15:30">15:30</option>
                    <option value="17:00">17:00</option>
                    <option value="18:30">18:30</option>
                    <option value="20:00">20:00</option>
                    <option value="21:30">21:30</option>
                </select>
      <% 			
       		}else if(theme.equals("8585세탁소")){         
      %>
      			<select name="time" class="form-control">
                    <option value="12:20">12:20</option>
                    <option value="13:35">13:35</option>
                    <option value="14:50">14:50</option>
                    <option value="16:00">16:00</option>
                    <option value="17:15">17:15</option>
                    <option value="18:30">18:30</option>
                    <option value="19:45">19:45</option>
                </select>
      <% 			
       		}       
      %>
                </td>
            </tr>
            <tr>
                <th>인원</th>
                <td colspan="2">
                <select name="num" class="form-control">
                    <option value="1명">1명</option>
                    <option value="2명">2명</option>
                    <option value="3명">3명</option>
                    <option value="4명">4명</option>
                    <option value="5명">5명</option>
                    <option value="6명">6명</option>
                </select></td>        
            </tr>
            <tr>
                <th>예약자</th>
                <td colspan="2"><input type="text" class="form-control" name="name"></td>      
            </tr>
             <tr>
                <th>연락처</th>
                <td colspan="2"><input type="text" class="form-control" name="phone" placeholder="'-'제외하고 입력"></td>     
            </tr>
            <tr>
                <th>비고</th>
                <td colspan="2"><input type="text" class="form-control" name="note"></td>       
            </tr>      
            <tr>
                <td colspan="3">
                <input type="submit" class="btn btn-primary" value="예약">
                <input type="reset" class="btn btn-danger" value="취소" onClick="histoty.back()">
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