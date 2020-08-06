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
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">신고하기</a></li>
                        </ul>
                    </div>
                    <h2><span>신고하기</span></h2>
                    <h3>관리자에게 신고할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 글쓰기 -->
            <div class="write-area">
                <form action="" method="post">

                    <h2>신고하기 작성</h2>

                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>카테고리</td>
                                <td>
                                    <label><input type="radio" name="ctgr" id="" title="신고">신고하기</label>
                                    <!--label><input type="radio" name="ctgr" id="" title="신고">신고</label-->
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목" /></td>
                            </tr>
                            <!--tr>
                                <td>신고회원 아이디</td>
                                <td><input type="text" name="" title="" class="form-control w100p" placeholder="신고회원 아이디" /></td>
                            </tr-->
                            <tr>
                                <td>내용</td>
                                <td><textarea name="" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"></textarea></td>
                            </tr>
                            <tr>
                                <td>url</td>
                                <td><input type="text" name="" title="" class="form-control w100p" placeholder="url" /></td>
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td><input type="file" name="FileName"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="write-btn">
                        <a href="declare_list.jsp" class="btn btn-list">목록</a>
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