	// JoinForm.jsp의 submit에 onClick 기능구현
	// 회원가입 시 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
function checkJoin(){
	if(!document.userInfo.id.value){
		alert("아이디를 입력하세요!");
		return false;
	}
	if(!document.userInfo.pwd.value){
		alert("비밀번호를 입력하세요!");
		return false;
	}
	
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(document.userInfo.pwd.value != document.userInfo.pwdcheck.value){
		alert("비밀번호확인이 맞지않습니다!");
		return false;
	}
}
	// 예약 시 필수입력정보가 채워졌는지 확인하는 함수
function checkReserv1(){
	if(!document.reserInfo.date.value){
		alert("날짜를 선택하세요!");
		return false;
	}
	if(!document.reserInfo.theme.value){
		alert("테마를 선택하세요!");
		return false;
	}
}
	// 예약 시 필수입력정보가 채워졌는지 확인하는 함수2
function checkReserv2(){
	if(!document.reserInfo.time.value){
		alert("시간을 선택하세요!");
		return false;
	}
	if(!document.reserInfo.num.value){
		alert("인원을 선택하세요!");
		return false;
	}
	if(!document.reserInfo.name.value){
		alert("이름을 입력하세요!");
		return false;
	}
	if(!document.reserInfo.phone.value){
		alert("연락처를 입력하세요!");
		return false;
	}
}
	
	//게시판 글쓰기: 로그인되어있는지 확인하는 함수
function checkLogin(){
	if(!session.getAttribute("sessionID")){
		alert("로그인 후 이용가능합니다.");
		return false;
	}
}