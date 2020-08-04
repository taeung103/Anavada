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
            <div class="visual-sub-vagas community-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li><a href="#none">고객센터</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">커뮤니티</a></li>
                        </ul>
                    </div>
                    <h2><span>커뮤니티</span></h2>
                    <h3>우리의 이웃과 'Anavada'를 통해 소통할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 리스트 -->
            <div class="list-area">
               <!--종류 리스트-->
                <div class="sort-area">  
                    <h4>전체 150개</h4>
                    <a href="community_write.jsp" class="write_btn">글쓰기</a>
                    <div>
                        <form action="" method="" id="">
                           지역 분류 : <select name="" class="LocationSelect">
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
                            <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">분류 선택</option>
                                    <option value="제목">제목</option>
                                    <option value="내용">내용</option>
                                    <option value="작성자">작성자</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>

                <table class="cmnt_list">
                    <tbody>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">10</td>
                            <td class="title">
                                <h2><span>종로구</span>종로구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">9</td>
                            <td class="title">
                                <h2><span>성동구</span>성동구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">8</td>
                            <td class="title">
                                <h2><span>서대문구</span>서대문구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">7</td>
                            <td class="title">
                                <h2><span>동대문구</span>동대문구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">6</td>
                            <td class="title">
                                <h2><span>강남구</span>강남구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">5</td>
                            <td class="title">
                                <h2><span>강동구</span>강동구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">4</td>
                            <td class="title">
                                <h2><span>강서구</span>강서구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">3</td>
                            <td class="title">
                                <h2><span>도봉구</span>도봉구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">2</td>
                            <td class="title">
                                <h2><span>노원구</span>노원구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                        <tr onclick="location.href='community_view.jsp';">
                            <td class="number">1</td>
                            <td class="title">
                                <h2><span>강북구</span>강북구 20대 모여라~</h2>
                                <ul>
                                    <li>작성자 : 홍길동</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                    <li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
                        </tr>
                    </tbody>
                </table>


                <div class="list-no">
                    <p><img src="/anavada/resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
                    <h1>목록이 없습니다.</h1>
                </div>


                <div class="write-btn">
                    <a href="community_write.jsp">글쓰기</a>
                </div>

            </div>


            <!-- 리스트 끝 -->


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

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>