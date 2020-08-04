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
                    <h3>관리자</h3>
                    <h2>| 계정변경</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 ---------------------------------------------------------------------------------------------------------------------------------------------------->
            <div class="admin_content">

            <!-- 카테고리 -->
                <div class="admin-area">
                    <h2>관리자 계정변경</h2>
                    <div>
                        <table>
                            <colgroup>
                                <col width="30%">
                                <col width="70%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>아이디</td>
                                    <td><input type="text" name="" title="" class="form-control w100p" placeholder="admin" readonly></td>
                                </tr>
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" name="" title="" class="form-control w100p" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>비밀번호 확인</td>
                                    <td><input type="password" name="" title="" class="form-control w100p" placeholder=""></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <a href="#none" class="btnS1">확인</a>
                </div>
            <!-- //카테고리 -->
            </div>
        <%@ include file="../include/admin_footer.jsp" %> 
        </div>
    </div>
</body>
</html>