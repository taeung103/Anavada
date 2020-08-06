<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
	<script>
		function validate() {
			//암호일치 확인
			var pwdValue = document.getElementById("memberPwd").value;
			var pwdValue2 = document.getElementById("memberPwd2").value;
			if (pwdValue !== pwdValue2) {
				alert("암호와 암호 확인의 값이 일치하지 않습니다.");
				document.getElementById("memberPwd").select();
				return false; //전송 취소함
			}
			return true; //전송함
		}
		//아이디 중복 체크 확인을 위한 ajax 실행 처리용 함수
		function joinldCheck() {
			$.ajax({
				url : "/anavada/idchk",
				type : "post",
				data : {
					memberId : $("#memberId").val()
				}, // input에 입력된 값을 가져올땐 .val() 작성
				success : function(data) {
					if (data == "ok") { // == 같다. 표현
						alert("사용 가능한 아이디입니다.");
						$("#memberPwd").focus();
					} else {
						alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
						$("#memberId").select();
					}
				},
				error : function(jqXHR, textstatus, errorthrown) { // jqXHR, textstatus, errorthrown : 에러표시 함수가 있음.
					console.log("error : " + jqXHR + ", " + textstatus + ", "
							+ errorthrown);
				}
			});
			return false;
		}
	</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/header.jsp" %>

        <!-- 컨텐츠 -->
        <div id="content">
			    
            <!--서브 비주얼/타이틀-->
            <div class="visual-sub-vagas member-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">MEMBER</a></li>
                        </ul>
                    </div>
                    <h2><span>MEMBERS</span></h2>
                    <h3>회원가입으로 'Anavada'의 서비스를 이용하실 수 있습니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->


            <!-- 회원가입 고객가입 -->
            <form name="join" action="/anavada/join" method="post" onsubmit="return validate();" class="form-inline">
                <legend>회원가입</legend>
                <div class="MBwrap">
                    <div class="MBjoin_input-wrap">
                        <ul class="joinDepth">
                            <li>약관동의</li>
                            <li class="on">회원정보 입력</li>
                            <li>회원가입 완료</li>
                        </ul>
                        <div class="MBjoin_input">
                            <h3>회원 정보입력</h3>
                            <div>
                                <ul>
                                    <li class="idArea">
                                        <input type="text" name="memberId" title="아이디" id="memberId" class="form-control w40p" placeholder="아이디(필수입력)" maxlength="12" required/>
                                        <a href="#none" class="btnS1" onclick="return joinldCheck();">중복확인</a>
                                        <p>4자이상 12자이내 입력하세요. 대소문자 구분, 영문, 숫자, 특수문자 입력 가능.</p>
                                    </li>
                                    <li class="pwArea"><input type="password" name="memberPwd" title="비밀번호" id="memberPwd" class="form-control w40p" placeholder="비밀번호(필수입력)" maxlength="12"/><p>4자이상 12자이내 입력하세요. 대소문자 구분, 영문, 숫자, 특수문자 입력 가능.</p></li>
                                    <li class="pwArea">
                                        <input type="password" name="memberPwd2" title="비밀번호 재확인" class="form-control w40p" placeholder="비밀번호 재확인(필수입력)" maxlength="12" required/>
                                    </li>
                                </ul>
                                <div class="line15">&nbsp;</div>
                                <ul>
                                    <li style="margin-bottom: 10px;"><input type="text" name="memberName" title="이름" class="form-control w50p" placeholder="이름(필수입력)" required/></li>
                                    <li><input type="email" name="memberEmail" title="이메일" class="form-control w50p" placeholder="이메일(필수입력)" required/>
                                        <a href="#none" class="btnS1">인증하기</a>
                                    </li>
                                    <li class="certifyArea" style="margin-bottom: 10px;">
                                        <input type="text" name="memberEmailOk" title="인증번호" class="form-control w50p" placeholder="인증번호 입력"/>
                                        <a href="#none" class="btnS1">인증확인</a>
                                    </li>
                                    <li class="telArea"><input type="tel" name="memberPhone" title="휴대폰번호" class="form-control w50p" placeholder="휴대폰 번호 '-' 포함 입력(필수입력)" required/></li>
                                </ul>
                            </div>
                            <p class="MBjoin_input_btn">
			                    <input type="reset" value="작성취소" onclick="location.href='/anavada/'" title="홈으로 이동">
			                    <input type="submit" value="작성완료" title="회원가입 완료">
                            </p>
                        </div>
                    </div>
                </div>
            </form>
            <!-- 회원가입 고객가입 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

    <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>