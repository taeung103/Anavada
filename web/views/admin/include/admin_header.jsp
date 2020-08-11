<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.Member"%>
  <header id="admin_header">
   
    <h1 class="logo">Anavada</h1>  
    
    <!-- gnb -->
    <div class="admin_gnb">
        
        <h2><p>회원관리</p></h2>
        <ul>
            <li><a href="/anavada/mlist.cp">전체회원</a></li>
            <li><a href="../member/memberSecession.jsp">탈퇴회원</a></li>
            <li><a href="../member/memberDeclare.jsp">신고회원</a></li>
        </ul>
        <h2><p>중고거래/커뮤니티관리</p></h2>
        <ul>
            <li><a href="../product/product_list.jsp">중고거래</a></li>
            <li><a href="../community/community_list.jsp">커뮤니티</a></li>
        </ul>
        <h2><p>지역축제</p></h2>
        <ul>
            <li><a href="../fboard/adminfboardList.jsp">지역축제</a></li>
        </ul>
        
        
        <h2><p>게시판관리</p></h2>
        <ul>
            <li><a href="/anavada/anlist.ss">공지사항</a></li>
            <li><a href="/anavada/aflist.ss">FAQ</a></li>
            <li><a href="/anavada/ailist.ss">문의하기</a></li>
            <li><a href="../notice/declare_list.jsp">신고자관리</a></li>
        </ul>
        
        <h2><p>홈페이지관리</p></h2>
        <ul>
            <li><a href="/anavada/blist.ad">사용자배너</a></li>
            <li><a href="../member/adminPwd.jsp">관리자 계정변경</a></li>
            <li class="homeBtn"><a href="/anavada/">home</a></li>
            <li class="logoutBtn"><a href="#none">로그아웃</a></li>
        </ul>
    </div>
    <!-- //gnb -->

</header>
