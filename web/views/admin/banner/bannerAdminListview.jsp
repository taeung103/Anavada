<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, banner.model.vo.Banner"%>
<%
	ArrayList<Banner> list = (ArrayList<Banner>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>   
<!DOCTYPE html>
<html>
<head>
<title>banner</title>
   <%@ include file="../include/admin_head.jsp" %> 
</head>
<body>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/admin_header.jsp" %>

        <!-- 컨텐츠 -->
        <div id="admin_container">
        
        <!-- 상단 타이틀 -->
            <div class="admin_title">
                <div class="admin_path">
                    <h3>배너관리</h3>
                    <h2>등록</h2>
                </div>
            </div>

            <!-- 리스트 -->

            <div class="list-area">
               <!--종류 리스트-->
                <div class="sort-area">  
                    <h4>전체 <%= list.size() %> 개</h4>
                    <a href="/anavada/views/admin/banner/banner_change.jsp" class="write_btn">배너 등록</a>
                    <div>
                        <!-- <form action="" method="" id="">
                            유형 선택 : <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">유형</option>
                                    <option value="중고거래 신고">중고거래</option>
                                    <option value="커뮤니티 신고">커뮤니티</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>  -->
                    </div>
                </div>
                
                <form action=""> 
                <table >
                <tr><th>번호</th><th>제목</th><th>게시여부확인</th><th>배너보이기/숨기기</th><th>첨부파일</th><th>사이즈</th></tr>
                    <%for(Banner b : list) { 
                    System.out.println(b);%>
                 <tr>
                 <td><%= b.getBannerNo() %></td>
                 <td><a href="/anavada/bselone.ad?bannerNo=<%= b.getBannerNo()%>"><%= b.getBannerTitle() %></a></td>
                 <td><%= b.getBannerOk() %></td>
                 		<td><% if(b.getBannerChk().equals("H")){ %>
                 		            </i>숨기기</span> &nbsp;
                 		         <% }else{// 배너가 보이게 하려면%>
                 		            </i>보이기</span> &nbsp;
                 		          <% }  %></td> 
                 <td><%= b.getBannerOriginal() %></td>
				 <td><%= b.getBannerSize() %></td>         		          
                 </tr>
                 <% } %>
                </table>


                <div class="list-no">
                    <a href="/anavada/blist.ad">목록</a>
                   
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
                	<a href="/anavada/blist.ad?page=1"><i class="glyphicon glyphicon-menu-left"></i></a>
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
                		<a href="/anavada/blist.ad?page=<%= p %>"><%= p %></a>
                <% }} %>
                <!-- 맨끝 페이지로 이동처리 -->
                <% if(currentPage >= maxPage){ %>
                     <a><i class="glyphicon glyphicon-menu-right"></i></a>
                <% }else{ %>
                	<a href="/anavada/blist.ad?page=<%= maxPage %>"><i class="glyphicon glyphicon-menu-right"></i></a>
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

	 <%@ include file="../include/admin_footer.jsp" %>
    </div>
</body>
</html>