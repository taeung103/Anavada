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
            <div class="visual-sub-vagas areaEvent-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li><a href="#none">고객센터</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">지역축제</a></li>
                        </ul>
                    </div>
                    <h2><span>지역축제</span></h2>
                    <h3>우리의 이웃과 'Anavada'를 통해 소통할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 글쓰기 -->
            <div class="write-area">
                <h2>커뮤니티 작성</h2>
                <form action="" method="">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>개최지역</td>
                                <td>
                                    <select name="" class="LocationSelect">
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
                                </td>
                            </tr>
                            <tr>
                                <td>축제성격</td>
                                <td>
                                    <select name="" class="LocationSelect">
                                        <option value="분류 선택" selected="selected">분류 선택</option>
                                        <option value="문화예술">문화예술</option>
                                        <option value="지역예술">지역예술</option>
                                        <option value="공연예술">공연예술</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>대표사진</td>
                                <td><input type="file" name=""></td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목" /></td>
                            </tr>
                            <tr>
                                <td>url</td>
                                <td><input type="text" name="" title="" class="form-control w60p" placeholder="url" /></td>
                            </tr>
                            <tr>
                                <td>축제장소</td>
                                <td><input type="text" name="" title="" class="form-control w60p" placeholder="축제장소" /></td>
                            </tr>
                            <tr>
                                <td>주최/주관기관</td>
                                <td><input type="text" name="" title="" class="form-control w60p" placeholder="주최/주관기관" /></td>
                            </tr>
                            <tr>
                                <td>개최기간</td>
                                <td><input type="date" name="" title="" class="form-control w25p" placeholder="개최기간" style="display: inline-block;"/> ~ <input type="date" name="" title="" class="form-control w25p" placeholder="개최기간" style="display: inline-block;"/></td>
                            </tr>
                            <tr>
                                <td>주최문의</td>
                                <td><input type="text" name="" title="" class="form-control w60p" placeholder="주최문의" /></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"></textarea></td>
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td><input type="file" name="FileName"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="write-btn">
                        <a href="notice_list.jsp" class="btn btn-list">목록</a>
                        <a href="#" class="btn btn-success">작성하기</a>
                    </div>
                </form>
            </div>
            <!-- 글쓰기 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>