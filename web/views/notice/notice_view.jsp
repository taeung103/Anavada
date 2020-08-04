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
            <div class="visual-sub-vagas notice-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li><a href="#none">고객센터</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">공지사항</a></li>
                        </ul>
                    </div>
                    <h2><span>공지사항</span></h2>
                    <h3>'Anavada'의 소식을 빠르게 확인할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->


            <!-- 상세 -->
            <div class="view-area">
                <h2><span>공지</span> 'Anavada' 중고거래 홈페이지가 새롭게 오픈했습니다.</h2>
                <ul>
                    <li><span>작성자 : </span>관리자</li>
                    <li><span>등록일 : </span>2019.02.30</li>
                    <li><span>조회수 : </span>30</li>
                    <li><span>첨부파일#1 : </span><a href="#none" download>KH정보교육원.jpg</a></li>
                </ul>

                <div class="view-ctn">
                        너 없는 지금도 눈부신 하늘과<br/>
                        눈부시게 웃는 사람들<br/>
                        나의 헤어짐을 모르는 세상은<br/>
                        슬프도록 그대로인데<br/><br/>

                        시간마저 데려가지 못하게<br/>
                        나만은 널 보내지 못했나봐<br/>
                        가시처럼 깊게 박힌 기억은<br/>
                        아파도 아픈 줄 모르고<br/><br/>

                        그대 기억이 지난 사랑이<br/>
                        내 안을 파고 드는 가시가 되어<br/>
                        제발 가라고 아주 가라고<br/>
                        애써도 나를 괴롭히는데<br/><br/>

                        아픈 만큼 너를 잊게 된다면<br/>
                        차라리 앓고 나면 그만인데<br/>
                        가시처럼 깊게 박힌 기억은<br/>
                        아파도 아픈 줄 모르고<br/>

                        그대 기억이<br/>
                        지난 사랑이<br/>
                        내 안을 파고 드는 가시가 되어<br/>
                        제발 가라고<br/>
                        아주 가라고<br/>
                        애써도 나를 괴롭히는데<br/><br/>

                        너무 사랑했던 나를<br/>
                        그게 두려웠던 나를<br/>
                        미치도록 너를 그리워했던<br/>
                        날 이제는 놓아줘<br/><br/>

                        보이지 않아 내 안에 숨어<br/>
                        잊으려 하면 할수록 더 아파와<br/>
                        제발 가라고 아주 가라고<br/>
                        애써도 나를 괴롭히는데
                </div>

                <div class="view-btn">
                    <a href="#none" class="btn btn-prev">이전글</a>
                    <a href="notice_list.jsp" class="btn btn-list">목록</a>
                    <a href="#none" class="btn btn-next">다음글</a>
                </div>
            </div>
            <!-- 상세 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>