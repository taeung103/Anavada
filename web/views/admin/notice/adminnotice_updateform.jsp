<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
	int currentPage = (Integer)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../include/head.jsp" %> 
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">

            <!-- 글쓰기 -->
            <div class="write-area">
                <h2>공지사항 수정</h2>
                <form action="/anavada/anupnotice" method="post" enctype="multipart/form-data">
<%-- 최후에 합치기      <input type="hidden" value="<%= loginMember.getUserId()%>" name="writer"> --%>
				<input type="hidden" value="<%= notice.getNoNo()%>" name="no">
				<input type="hidden" value="<%= currentPage %>" name="page">
				<input type="hidden" value="<%= notice.getNoOriginal() %>" name="ofile">
				<input type="hidden" value="<%= notice.getNoRename() %>" name="rfile">
                    <table>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" title="" class="form-control w100p" value="<%= notice.getNoTitle() %>"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"><%= notice.getNoContent() %></textarea></td>
                            </tr>
                            <tr>
                                <td>첨부파일</td>
                                <td>
                                <% if(notice.getNoOriginal() != null) { %>
                                <%= notice.getNoOriginal() %> &nbsp; &nbsp; &nbsp; &nbsp;<input type="checkbox" value="yes" name="delcheck"> 파일삭제
                                <% } %>
                                <input type="file" name="upfile"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="write-btn">
                    	<input type="reset" class="btn btn-list" value="수정취소">
                        <a onclick="javascipt:history.go(-1); return false;" class="btn btn-list">목록</a>
                        <input type="submit" class="btn btn-success" value="수정하기">
                    </div>
                </form>
            </div>
            <!-- 글쓰기 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/admin_footer.jsp" %>
</body>
</html>