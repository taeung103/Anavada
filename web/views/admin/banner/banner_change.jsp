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
                    <h3>배너관리</h3>
                    <h2>등록</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 ---------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="admin_content">

                <!-- 글쓰기 -->
                <form name="formname" method="post" enctype="" action="" class="form-inline">
                    <fieldset>
                        <div class="admin-library-write">

                            <h2>유료배너 등록</h2>

                            <table>
                                <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>제목</td>
                                        <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목" /></td>
                                    </tr>
                                    <tr>
                                        <td>설명</td>
                                        <td><textarea name="" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:200px; max-height:200px;"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>배경이미지등록</td>
                                        <td><input type="file" name="FileName"></td>
                                    </tr>
                                    <tr>
                                        <td>URL등록</td>
                                        <td><input type="text" name="" title="" class="form-control w100p" placeholder="http://" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </form>
                <!-- //글쓰기 -->

                <!-- 버튼 -->
                <div class="write-btn">
                    <a href="#" class="btn btn-cancel">취소</a>
                    <a href="#" class="btn btn-success">작성하기</a>
                </div>
                <!-- //버튼 -->

            </div>
        <%@ include file="../include/admin_footer.jsp" %> 
        </div>
    </div>
</body>
</html>