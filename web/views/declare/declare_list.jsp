<%@page import="declare.model.vo.DBo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<DBo> list = (ArrayList<DBo>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
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
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">신고하기</a></li>
                        </ul>
                    </div>
                    <h2><span>신고하기</span></h2>
                    <h3>관리자에게 신고할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 리스트 -->

            <div class="list-area">
               <!--종류 리스트-->
                <div class="sort-area">  
                    <h4>전체 <%= list.size() %> 개</h4>
                    <a href="/anavada/views/declare/declare_write.jsp" class="write_btn">글쓰기</a>
                    <div>
                        <form action="" method="" id="">
                            유형 선택 : <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">유형</option>
                                    <option value="중고거래 신고">중고거래</option>
                                    <option value="커뮤니티 신고">커뮤니티</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form> 
                    </div>
                </div>
                
                <form action=""> 
                <table >
                <tr><th>번호</th><th>제목</th><th>작성자</th><th>처리상태</th> </tr>
                    <%for(DBo d : list) { 
                    System.out.println(d);%>
                 <tr>
                 <td><%= d.getDboNo() %></td>
                 <td><a href="/anavada/dbodetail.ad?dboNo=<%= d.getDboNo()%>"><%= d.getDboTitle() %></a></td>
                 <td><%= d.getDboMid() %></td>
                 		<td><% if(d.getDboChe().equals("Y")){ %>
                 		            </i>처리완료</span> &nbsp;
                 		         <% }else{// 처리완료된건%>
                 		            </i>처리중</span> &nbsp;
                 		          <% }  %></td>              		          
                 </tr>
                 <% } %>
                </table>


                <div class="list-no">
                    <a href="/anavada/dbolist">목록</a>
                </div>

              </form> 

            </div>
            <!-- 리스트 끝 -->

            <!-- 페이지넘버 -->
            <dl class="list-paging pb80">
                <dd>
                <% if(currentPage <= 1){ %>
           		     <a><i class="glyphicon glyphicon-menu-left"></i></a>
                <% }else{ %>
                	<a href="/anavada/dbolist?page=1"><i class="glyphicon glyphicon-menu-left"></i></a>
                <% } %>
                <!-- 이전으로 이동처리 -->
                <%-- <% if((currentPage) - 10 < startPage && (currentPage - 10) > 1){ %>
                
                <% }else{ %>
                <% } %> --%>
                <!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
                 <% for(int p = startPage; p <= endPage; p++){ 
                 		if(p == currentPage){%>
                 		<a class="active"><%= p %></a>
                		<% }else{ %>
                		<a href="/anavada/dbolist?page=<%= p %>"><%= p %></a>
                <% }} %>
                <!-- 맨끝 페이지로 이동처리 -->
                <% if(currentPage >= maxPage){ %>
                     <a><i class="glyphicon glyphicon-menu-right"></i></a>
                <% }else{ %>
                	<a href="/anavada/dbolist?page=<%= maxPage %>"><i class="glyphicon glyphicon-menu-right"></i></a>
                <% } %>
                    <!-- <a href="#none" class="active">1</a> -->
                    <!-- <a href="#none">2</a> -->
                    <!-- <a href="#none">3</a>활성화 class="active" -->
                    <!-- <a href="#none">4</a> -->
                    <!-- <a href="#none">5</a> -->
                    <!-- <a href="#none"><i class="glyphicon glyphicon-menu-right"></i></a> -->
                </dd>
            </dl>
            <!-- 페이지넘버 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>