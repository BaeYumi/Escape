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
	div.container{width:100%; margin:0; padding:0; background-color:#231816; font-family:'Jalnan';}
	table{width:50%; margin:150px auto; font-size:20px;}
	table #t_title{font-size:30px; color:#fff; text-align:center; line-height:2;}
	table th{color:white;}
	table td{color:#777;}
	table th,td{text-align:center; height:40px;}
	/* 푸터 */
	div#footer{width:100%; background-color:#333; border-top:#444;}
	div#footer address{width:90%; margin:0 auto; padding:15px 0; color:white; font-size:16px; font-weight:normal;}
	div#footer p{margin:0; padding:0;}
    </style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="boardForm.js"></script>
</head>
<body>
	<jsp:useBean id="boarddb" class="univdb.DBBoard" scope="page" />
	
	<%
	String num = request.getParameter("num");
	String id = "";
	String title = "";
	String content = "";
	
	if (num != null){
		int idnum = Integer.parseInt(num);
		DBBoard dbb = new DBBoard();
		boardbean drb = dbb.getBoard(idnum);
		//로그인한 아이디와 가져온 레코드 아이디가 같은지 확인 
		if(session.getAttribute("sessionID").equals(drb.getId())||session.getAttribute("sessionID").equals("admin")){
			id = drb.getId();
			title = drb.getTitle();
			content = drb.getContent();
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('id가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
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
    <form name=boardform action="BoardPro.jsp" method="post">
    	<input type=hidden name="menu" value="insert">
    	<input type=hidden name="num" value="<%=num %>">
        <table>
       		<tr>
        		<th id="t_title" colspan="4">글 수정/삭제</th>
        	</tr>
        	 <tr>
                <td width=20% align=center>아이디 :</td>
                <td>
                <input type=text name=id value="<%=id %>" size=30 maxlength=20 readonly>
                </td>
            </tr>
            <tr>
                <td width=20% align=center>글 제목 :</td>
                <td>
                <input type=text name=title value="<%=title%>" size=30 maxlength=20>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <textarea name=content rows=10 cols=90><%=content %></textarea>
                </td>
            </tr>
            <%
    		//세션ID값이 admin이면 관리자 페이지로 가는 버튼 생성
			if(session.getAttribute("sessionID").equals("admin")){
			%>
			<tr>
            	<td colspan="2" align=right>
                <input type="submit" class="btn btn-primary" value="삭제" onClick="deletecheck()">
                </td>
            </tr>
            <%
			}else{
            %>
            <tr>
            	<td colspan="2" align=right>
                <input type="submit" class="btn btn-primary" value="수정" onClick="updatecheck()">
                <input type="submit" class="btn btn-primary" value="삭제" onClick="deletecheck()">
                </td>
            </tr> 
            <%
			}
            %>       
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