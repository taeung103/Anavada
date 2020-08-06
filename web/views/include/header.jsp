<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginMember = (Member)session.getAttribute("loginMember"); %>
<div id="header">
	<!-- 상단메뉴 -->
    <dl class="gnbWrap clearfix">
    	<dt><h1><a href="/anavada/" title="Anavada">Anavada</a></h1></dt>
        <dd>
            <ul class="gnb clearfix">
                <li><a href="../jboard/product_list.jsp">중고거래</a></li>
                <li><a href="../cboard/community_list.jsp">커뮤니티</a></li>
                <li><a href="../fboard/areaEvent_list.jsp">지역축제</a></li>
                <li>
                    <a href="../notice/notice_list.jsp">고객센터</a>
                    <div class="subGnb">
                        <a href="../notice/notice_list.jsp">공지사항</a>
                        <a href="../notice/faq_list.jsp">FAQ</a>
                        <a href="../inquiry/inquiry_list.jsp">문의하기</a>
                        <a href="../declare/declare_list.jsp">신고하기</a>
                    </div>
                </li>
            </ul>
        </dd>
        <dt>
            <ul class="util">
                <li>
                    <form action="" method="">
                        <input type="text" placeholder="검색어를 입력해주세요.">
                        <button class="top-search"><i class="xi-search"></i></button>
                    </form>
                </li>
                <% if(loginMember == null){ %>
                <li><a class="hover_line01" href="../member/join_agree.jsp">JOIN</a></li>
                <li><a class="hover_line01" href="../member/login.jsp">LOGIN</a></li>
                <% } else if(loginMember.getMemberId().equals("admin")){ %>
                <li><a class="hover_line01" href="../admin/member/memberList.jsp">관리자페이지</a></li>
                <li><a class="hover_line01" href="/anavada/logout">LOGOUT</a></li>
                <% } else { %>
                <li><a class="hover_line01" href="../member/MyInfoModify.jsp">MYPAGE</a></li>
                <li><a class="hover_line01" href="/anavada/logout">LOGOUT</a></li>
                <% } %>
                <li><i id="favorite" class="xi-star-o" title="즐겨찾기 등록"></i></li>
            </ul>
        </dt>
    </dl>
    <!-- //상단메뉴 -->
</div>
