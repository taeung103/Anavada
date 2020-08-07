<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../include/head.jsp" %> 
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/admin_header.jsp" %>

        <div id="admin_container">

            <!-- 상단 타이틀 -->
            <div class="admin_title">
                <div class="admin_path">
                    <h3>공지사항</h3>
                    <h2>| 리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->


            <!-- 글쓰기 -->
            <div class="write-area">
                <h2>공지사항 작성</h2>
                <form action="/anavada/aninsert" method="post" enctype="multipart/form-data">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" title="" class="form-control w100p" placeholder="제목" /></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content"  class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"></textarea></td>
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td><input type="file" name="FileName"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="write-btn">
                    	<input type="reset" class="btn btn-list" value="작성취소">
                        <a onclick="javascipt:history.go(-1); return false;" class="btn btn-list">목록</a>
                        <input type="submit" class="btn btn-success" value="작성하기">
                    </div>
                </form>
            </div>
            <!-- 글쓰기 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/admin_footer.jsp" %>
    </div>
</body>
</html>