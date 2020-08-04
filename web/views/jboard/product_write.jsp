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
            <div class="visual-sub-vagas product-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">중고거래</a></li>
                        </ul>
                    </div>
                    <h2><span>중고거래</span></h2>
                    <h3>우리의 이웃과 중고거래를 통해 변화되는 세상</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 글쓰기 -->
            <div class="write-area">
                <h2>중고거래 작성</h2>
                <form action="" method="">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>거래방법</td>
                                <td>
                                    <label><input type="radio" name="deal" id="" title="지역거래">지역거래</label>
                                    <label><input type="radio" name="deal" id="" title="우편거래">우편거래</label>
                                </td>
                            </tr>
                            <tr>
                                <td>지역선택</td>
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
                                <td>상품 이미지</td>
                                <td>
                                    <input type="file" name="" style="margin-bottom:10px;">
                                    <input type="file" name="" style="margin-bottom:10px;">
                                    <input type="file" name="" style="margin-bottom:10px;">
                                    <input type="file" name="" style="margin-bottom:10px;">
                                    <input type="file" name="" style="margin-bottom:10px;">
                                    <p>대표 이미지는 500x500 사이즈로 올려주세요.</p>
                                
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목" /></td>
                            </tr>
                            <tr>
                                <td>판매희망가격</td>
                                <td><input type="text" name="" title="" class="form-control w50p" placeholder="판매가"  style="float:left; margin-right: 20px;"/> 원</td>
                            </tr>
                            <tr>
                                <td>상품설명</td>
                                <td>
<textarea name="" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:600px; max-height:600px;" onfocus="this.value='';">
안녕하세요.
</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="write-btn">
                        <a href="#none" class="btn btn-list">목록</a>
                        <a href="#none" class="btn btn-warning">취소</a>
                        <a href="#" class="btn btn-success">상품등록</a>
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