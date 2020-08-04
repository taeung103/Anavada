<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/admin_head.jsp" %> 
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/admin_header.jsp" %> 

        <div id="admin_container">

            <!-- 상단 타이틀 -->
            <div class="admin_title">
                <div class="admin_path">
                    <h3>탈퇴회원</h3>
                    <h2>| 리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="list-area">


                <!-- 검색영역 -->
                <div class="sort-area">  
                    <h4>전체 150개</h4>
                    <div>
                        <form action="" method="" id="">
                            목록 분류 : <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">분류 선택</option>
                                    <option value="아이디">아이디</option>
                                    <option value="이름">이름</option>
                                    <option value="이메일">이메일</option>
                                    <option value="전화번호">전화번호</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>
                <!-- 검색영역 끝 -->

                <table class="memberTable">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="15%">
                        <col width="*">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>번호</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>가입일</th>
                            <th>탈퇴일</th>
                        </tr>
                        <tr>
                            <td class="number">5</td>
                            <td class="id">user05</td>
                            <td class="name">이순신</td>
                            <td class="email">user@naver.com</td>
                            <td class="phone">010-1111-1111</td>
                            <td class="joinDate">2020.08.02</td>
                            <td class="secessionDate">2020.08.02</td>
                        </tr>
                        <tr>
                            <td class="number">4</td>
                            <td class="id">user04</td>
                            <td class="name">이순신</td>
                            <td class="email">user@naver.com</td>
                            <td class="phone">010-1111-1111</td>
                            <td class="joinDate">2020.08.02</td>
                            <td class="secessionDate">2020.08.02</td>
                        </tr>
                        <tr>
                            <td class="number">3</td>
                            <td class="id">user03</td>
                            <td class="name">이순신</td>
                            <td class="email">user@naver.com</td>
                            <td class="phone">010-1111-1111</td>
                            <td class="joinDate">2020.08.02</td>
                            <td class="secessionDate">2020.08.02</td>
                        </tr>
                        <tr>
                            <td class="number">2</td>
                            <td class="id">user02</td>
                            <td class="name">이순신</td>
                            <td class="email">user@naver.com</td>
                            <td class="phone">010-1111-1111</td>
                            <td class="joinDate">2020.08.02</td>
                            <td class="secessionDate">2020.08.02</td>
                        </tr>
                        <tr>
                            <td class="number">1</td>
                            <td class="id">user01</td>
                            <td class="name">이순신</td>
                            <td class="email">user@naver.com</td>
                            <td class="phone">010-1111-1111</td>
                            <td class="joinDate">2020.08.02</td>
                            <td class="secessionDate">2020.08.02</td>
                        </tr>
                    </tbody>
                </table>

                <p class="warning_text">*탈퇴한 회원의 정보는 탈퇴일로부터 90일간 보관되며 90일 초과시 자동 삭제됩니다.</p>
                <!-- //게시판 -->

                <!-- 버튼 -->
                <div class="btn_wrap">
                    <a href="#" class="btn-left btn_gray">선택삭제</a>
                    <a href="notice_write.php" class="btn-right btn_white">등록</a>
                </div>
                <!-- //버튼 -->

                <!-- 페이징 -->
                <dl class="list-paging">
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
                <!-- //페이징 -->

            </div>
        <%@ include file="../include/admin_footer.jsp" %> 
        </div>
    </div>
</body>
</html>