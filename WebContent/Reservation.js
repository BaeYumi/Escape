function deleteck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok) {
		document.reservform.submit();
	}else{
		return;
	}
}