<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %> 
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/header.jsp" %>

        <!-- 비주얼영역 -->

        <div id="main_visual" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#main_visual" data-slide-to="0" class="active"></li>
                <li data-target="#main_visual" data-slide-to="1"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="main_vText">
                        <h2>도심 속 우리의 연결고리</h2>
                        <p>'Anavada'와 함께하는 이웃거래와 지역축제의 활성화</p>
                        <a class="btn-primary" href="#none" role="button">자세히보기</a>
                    </div>
                </div>

                <div class="item">
                    <div class="main_vText">
                        <h2>여러분, 우리와 함께해요!</h2>
                        <p>'Anavada'의 커뮤니티에서 다양한 정보와 소식을 공유</p>
                        <a class="btn-primary" href="#none" role="button">자세히보기</a>
                    </div>
                </div>

            </div>
            <a class="left carousel-control" href="#main_visual" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#main_visual" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- 비주얼영역 끝 -->


        <div class="main_content">
            <div id="mainNotice" class="mainNotice">
                <ul class="Notice">
                    <li>
                        <h2 onclick="location.href=''"><span>[공지] </span> 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>
                    <li>
                        <h2 onclick="location.href=''">1. 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>
                    <li>
                        <h2 onclick="location.href=''">2. 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>

                </ul>
                <ul class="Notice">
                    <li>
                        <h2 onclick="location.href=''"><span>[문의] </span> 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>
                    <li>
                        <h2 onclick="location.href=''">1. 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>
                    <li>
                        <h2 onclick="location.href=''">2. 'Anavada' 홈페이지가 오픈되었습니다!</h2>
                        <div>조회수 : 1</div>
                    </li>

                </ul>
            </div>

            <div>
                <div class="mianPdt">
                    <h2>지금 당장 만나는 중고거래!</h2>
                    <a href="#none" class="more">더보기 +</a>
                    <ul class="Pdt_list">
                        <li onclick="location.href=''">
                            <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                            <h3>밤하늘의 별</h3>
                            <h4>700,000 <span>원</span></h4>
                            <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                        </li>
                        <li onclick="location.href=''">
                            <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                            <h3>찌릿찌릿</h3>
                            <h4>800,000 <span>원</span></h4>
                            <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                        </li>
                        <li onclick="location.href=''">
                            <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                            <h3>집집집집</h3>
                            <h4>1,000,000 <span>원</span></h4>
                            <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                        </li>
                        <li onclick="location.href=''">
                            <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                            <h3>레몬에이드</h3>
                            <h4>7,800,000 <span>원</span></h4>
                            <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                        </li>
                    </ul>
                </div>

                <div class="mianCnt">
                    <h2>우리동네 커뮤니티!</h2>
                    <a href="#none" class="more">더보기 +</a>
                    <div class="Cnt_list">
                        <dl>
                            <dt><span>1</span></dt>
                            <dd>
                                <h3 onclick="location.href=''"><span>[종로구] </span>응용 SW 기초기술 활용</h3>
                                <p class="con" onclick="location.href=''">정보시스템 진단 및 모의해킹 전문가 양성 과정 1회차_실전대비면접</p>
                                <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i><i class="score_i glyphicon glyphicon-user">조회수<span>+999</span></i></p>
                            </dd>
                        </dl>
                        <dl>
                            <dt><span>2</span></dt>
                            <dd>
                                <h3 onclick="location.href=''"><span>[종로구] </span>응용 SW 기초기술 활용</h3>
                                <p class="con" onclick="location.href=''">정보시스템 진단 및 모의해킹 전문가 양성 과정 1회차_실전대비면접</p>
                                <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i><i class="score_i glyphicon glyphicon-user">조회수<span>+999</span></i></p>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="mainEvent">
                <h2>함께 즐기는 지역축제</h2>
                <p>남녀노소 모두와 나누는 우리 지역만의 축제로!</p>
                <ul>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                    <li><a href="#none"><img src="/anavada/resources/images/test/testImg.jpg" width="150px" height="150px" /></a></li>
                </ul>    
            </div>           
        </div>

        <%@ include file="../include/footer.jsp" %> 
    </div>
</body>
</html>