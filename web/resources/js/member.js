
//비밀번호 변경
function pwdChange(){
	var memberPwd = document.getElementById('memberPwd').value;
	var memberPwd2 = document.getElementById('memberPwd2').value;
	var memberPwd3 = document.getElementById('memberPwd3').value;
	
	if(memberPwd == null || memberPwd2 == null || memberPwd3 == null || memberPwd == "" || memberPwd2 == "" || memberPwd3 == ""){
		alert("공백은 포함할 수 없습니다.\\n다시 입력해주세요.")
		return false;
	} else if(memberPwd2 != memberPwd3){
		alert("새로운 비밀번호가 일치하지 않습니다.\\n다시 입력해주세요.");
		return false;
	} else {
		return true;
	}
}
