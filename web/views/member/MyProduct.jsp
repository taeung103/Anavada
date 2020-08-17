<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="visual-sub-vagas mypage-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li><a href="#none">MYPAGE</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">중고거래조회</a></li>
                        </ul>
                    </div>
                    <h2><span>MYPAGE</span></h2>
                    <h3>'Anavada'의 내 정보를 확인할 수 있습니다..</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->
			    
            <!--서브 카테고리-->
            <div class="MyTap">
                <ul>
                    <li><a href="MyInfoModify.jsp">정보수정</a></li>
                    <li class="active"><a href="MyProduct.jsp">중고거래조회</a></li>
                    <li><a href="MyCmnt.jsp">커뮤니티조회</a></li>
                    <li><a href="/anavada/miq?member=<%= loginMember.getMemberId() %>">문의하기조회</a></li>
                    <li><a href="MyDeclare.jsp">신고하기조회</a></li>
                </ul>
            </div>
            <!--서브 카테고리 끝-->


            <!--마이페이지컨텐츠-->
            <div class="mypage_area product_list">
                <h2 class="mypage_title">나의 중고거래내역</h2>

                <!--종류 리스트-->
                <div class="sort-area">  
                    <h4>전체 150개</h4>
                    <a href="../jboard/product_write.jsp" class="write_btn">글쓰기</a>
                    <div>
                        <form action="" method="" id="">
                            지역선택 : <select name="" class="LocationSelect">
                                    <option value="지역선택" selected="selected">지역선택</option>
                                    <option value="강남구">강남구</option>
                                    <option value="강동구">강동구</option>
                                    <option value="강북구">강북구</option>
                                    <option value="강서구">강서구</option>
                                    <option value="관악구">관악구</option>
                                    <option value="광진구">광진구</option>
                                    <option value="구로구">구로구</option>
                                    <option value="금천구">금천구</option>
                                    <option value="노원구">노원구</option>
                                    <option value="도봉구">도봉구</option>
                                    <option value="동대문구">동대문구</option>
                                    <option value="동작구">동작구</option>
                                    <option value="마포구">마포구</option>
                                    <option value="서대문구">서대문구</option>
                                    <option value="서초구">서초구</option>
                                    <option value="성동구">성동구</option>
                                    <option value="성북구">성북구</option>
                                    <option value="송파구">송파구</option>
                                    <option value="양천구">양천구</option>
                                    <option value="영등포구">영등포구</option>
                                    <option value="용산구">용산구</option>
                                    <option value="은평구">은평구</option>
                                    <option value="종로구">종로구</option>
                                    <option value="중구">중구</option>
                                    <option value="구로구">중랑구</option>
                            </select>
                            목록 분류 : <select name="" class="ListSelect">
                                    <option value="최신등록순" selected="selected">최신등록순</option>
                                    <option value="가격높은순">가격높은순</option>
                                    <option value="가격낮은순">가격낮은순</option>
                                    <option value="좋아요순">좋아요순</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>

                <ul class="product">
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                    <li onclick="location.href='../product/product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2>밤하늘의 별</h2>
                        <h3>7,000,000<span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></p>
                    </li>
                </ul>
                <div class="list-no">
                    <p><img src="/anavada/resources/images/btnIcn/icn_big_listNo.png" alt="" title=""></p>
                    <h1>목록이 없습니다.</h1>
                </div>
                <div class="write-btn">
                    <a href="../jboard/product_write.jsp">글쓰기</a>
                </div>

            </div>
            <!-- 페이지넘버 -->
            <dl class="list-paging pb80">
                <dd>
                    <a href="#none"><i class="glyphicon glyphicon-menu-left"></i></a>
                    <a href="#none" class="active">1</a>
                    <a href="#none">2</a>
                    <a href="#none">3</a><!-- 활성화 class="active" -->
                    <a href="#none">4</a>
                    <a href="#none">5</a>
                    <a href="#none"><i class="glyphicon glyphicon-menu-right"></i></a>
                </dd>
            </dl>
            <!-- 페이지넘버 끝 -->

    <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>