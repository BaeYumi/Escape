function deletecheck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok) {
		document.boardform.menu.value='delete';
		document.boardform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	ok = confirm("등록하시겠습니까?");
	if(ok) {
		document.boardform.menu.value='insert';
		document.boardform.submit();
	}else{
		return;
	}
}

function updatecheck(){
	ok = confirm("수정하시겠습니까?");
	if(ok) {
		document.boardform.menu.value='update';
		document.boardform.submit();
	}else{
		return;
	}
}