const form = document.insertF;

let userNum = 0;

function insertOn() {
	if(form.REGIST_MONTH.value == "") {
		alert("수강월을 입력해주세요");
		form.REGIST_MONTH.focus();
	} else if(form.C_Name.value == "") {
		alert("회원명을 입력해주세요");
		form.REGIST_MONTH.focus();
	} else if(form.C_NO.value == "") {
		alert("회원번호를 입력해주세요");
		form.C_NO.focus();
	} else if(form.CLASS_AREA.value == "") {
		alert("강의장소를 입력해주세요");
		form.CLASS_AREA.focus();
	} else if(form.Class_name.value == "") {
		alert("강의를 선택해주세요");
		form.Class_name.focus();
	} else if(form.TUITION.value == "") {
		alert("수강료를 입력해주세요");
		form.TUITION.focus();
	} else {
		form.submit();
	}
}


function reInsert() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	location.href = "insert.jsp";
}

function changValue() {
	userNum = form.C_Name.value;
	
	if(userNum!="") {
		form.C_NO.value = form.C_Name.value;
	}
	
	if(form.Class_name.value!="") {
		if(userNum >= 20000) {
			form.TUITION.value = form.Class_name.value / 2;
		} else {
			form.TUITION.value = form.Class_name.value;
		}
	}
}