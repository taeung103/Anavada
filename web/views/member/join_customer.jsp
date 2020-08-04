<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
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
            <form name="join" method="post" action="#" class="form-inline">
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
                                        <input type="text" name="" title="아이디" class="form-control w40p" placeholder="아이디" />
                                        <a href="#none" class="btnS1">중복확인</a>
                                        <p>4자이상 12자이내 입력하세요. 대소문자 구분, 영문, 숫자, 특수문자 입력 가능.</p>
                                    </li>
                                    <li class="pwArea"><input type="password" name="" title="비밀번호" class="form-control w40p" placeholder="비밀번호" /><p>4자이상 12자이내 입력하세요. 대소문자 구분, 영문, 숫자, 특수문자 입력 가능.</p></li>
                                    <li class="pwArea">
                                        <input type="password" name="" title="비밀번호 재확인" class="form-control w40p" placeholder="비밀번호 재확인" />
                                    </li>
                                </ul>
                                <div class="line15">&nbsp;</div>
                                <ul>
                                    <li style="margin-bottom: 10px;"><input type="text" name="" title="이름" class="form-control w50p" placeholder="이름" /></li>
                                    <li><input type="email" name="" title="이메일" class="form-control w50p" placeholder="이메일" />
                                        <a href="#none" class="btnS1">인증하기</a>
                                    </li>
                                    <li class="certifyArea" style="margin-bottom: 10px;">
                                        <input type="text" name="" title="인증번호" class="form-control w50p" placeholder="인증번호" />
                                        <a href="#none" class="btnS1">인증확인</a>
                                    </li>
                                    <li class="telArea"><input type="tel" name="" title="휴대폰번호" class="form-control w50p" placeholder="휴대폰 번호 '-' 포함 입력"/></li>
                                </ul>
                            </div>
                            <p class="MBjoin_input_btn">
                                <a href="#none">취소</a>
                                <a href="join_complete.jsp">완료</a>
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