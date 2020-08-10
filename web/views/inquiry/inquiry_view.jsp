<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="inquiry.model.vo.Inquiry"%>
<%
	Inquiry inquiry = (Inquiry)request.getAttribute("inquiry");
	int currentPage = ((Integer)request.getAttribute("page")).intValue();
	String selected = null;
	String keyword = null;
	if(request.getAttribute("selected") != null && request.getAttribute("keyword") != null) {
		selected = (String)request.getAttribute("selected");
		keyword = (String)request.getAttribute("keyword");
	}
%>
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
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">문의하기</a></li>
                        </ul>
                    </div>
                    <h2><span>문의하기</span></h2>
                    <h3>관리자에게 문의할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 상세 -->
            <div class="view-area">
                <h2><span class="inquiry">문의</span> <%= inquiry.getIqTitle() %></h2>
                <ul>
                    <li><span>작성자 : </span><%= inquiry.getIqId() %></li>
                    <li><span>등록일 : </span><%= inquiry.getIqDate() %></li>
                    <% if(inquiry.getIqOriginal() != null) { %>
                    <li><span>첨부파일 : </span><a href="/anavada/ifdown?ofile=<%= inquiry.getIqOriginal() %>&rfile=<%= inquiry.getIqRename() %>" download><%= inquiry.getIqOriginal() %></a></li>
                    <% } if(inquiry.getIqOriginal2() != null) { %>
                    <li><a href="/anavada/ifdown?ofile=<%= inquiry.getIqOriginal2() %>&rfile=<%= inquiry.getIqRename2() %>" download><%= inquiry.getIqOriginal2() %></a></li>
                    <% } if(inquiry.getIqOriginal3() != null) { %>
                    <li><a href="/anavada/ifdown?ofile=<%= inquiry.getIqOriginal3() %>&rfile=<%= inquiry.getIqRename3() %>" download><%= inquiry.getIqOriginal3() %></a></li>
                    <% } %>
                </ul>

                <div class="view-ctn"><%= inquiry.getIqContent() %></div>
				
				<div align="right">
				<br>
				<a href="/anavada/iupdateview?no=<%= inquiry.getIqNo() %>&page=<%= currentPage %>" class="btn btn-list" style="background-color:white; border-color:white; color:black;">수정</a>
				<a href="/anavada/idelete?no=<%= inquiry.getIqNo() %>&rfile=<%= inquiry.getIqRename() %>&rfile2=<%= inquiry.getIqRename2() %>&rfile3=<%= inquiry.getIqRename3() %>" class="btn btn-list" style="background-color:white; border-color:white; color:red;">삭제</a>
				</div>
				
				
				<% if(selected == null && keyword == null) { %>
                <div class="view-btn">
                    <a href="/anavada/idetail?no=<%= inquiry.getIqNo()-1 %>" class="btn btn-prev">이전글</a>
                    <a href="/anavada/ilist?page=<%= currentPage %>" class="btn btn-list">목록</a>
                    <a href="/anavada/idetail?no=<%= inquiry.getIqNo()+1 %>" class="btn btn-next">다음글</a>
                </div>
                <% }else { %>
                <div class="view-btn">
                    <!-- <a href="#none" class="btn btn-prev">이전글</a> -->
                    <a href="/anavada/isearch?page=<%= currentPage %>&selected=<%= selected %>&keyword=<%= keyword %>" class="btn btn-list">목록</a>
                    <!-- <a href="#none" class="btn btn-next">다음글</a> -->
                </div>
                <% } %>
                
                <div class="cmt_wrap">
                
                
                    <ul class="cmt_con">
                        <li>
                            <div>
                                <h4>user : asdf123</h4><span>2020.08.16. 12:12:00</span>
                            </div>
                            <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 상세 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>