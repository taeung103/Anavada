<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@  page 
 	import="jboard.model.vo.Jboard , java.util.ArrayList, java.sql.Date"%>
 <%
 	ArrayList<Jboard> list = (ArrayList<Jboard>) request.getAttribute("list");
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
    <script type="text/javascript">
   function showWriteForm() {
      location.href = "/anavada/views/jboard/product_write.jsp";
   }
</script>

</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/header.jsp" %>

        <!-- 컨텐츠 -->
        <div id="content">


            <!--서브 비주얼/타이틀-->
            <div class="visual-sub-vagas product-vagas">
                <div class="vsv-copy sub-title">
                   <div>
                        <ul class="navi">
                            <li><a href="#none">홈</a></li>
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">중고거래</a></li>
                        </ul>
                    </div>
                    <h2><span>중고거래</span></h2>
                    <h3>우리의 이웃과 중고거래를 통해 변화되는 세상</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!--중고거래-->
            <div class="product_list">

                <!--종류 리스트-->
                <div class="sort-area">  
                    <h4>전체 <%=listCount%>개</h4>
                    <button onclick="showWriteForm();" class="write_btn">글쓰기</button>
                    <div>
                        <form action="" method="" id="">
                            지역선택 : <select name="" class="LocationSelect">
                                    <option value="0" selected="selected">전체보기</option>
                                    <option value="1">강남구</option>
                                    <option value="2">강동구</option>
                                    <option value="3">강북구</option>
                                    <option value="4">강서구</option>
                                    <option value="5">관악구</option>
                                    <option value="6">광진구</option>
                                    <option value="7">구로구</option>
                                    <option value="8">금천구</option>
                                    <option value="9">노원구</option>
                                    <option value="10">도봉구</option>
                                    <option value="11">동대문구</option>
                                    <option value="12">동작구</option>
                                    <option value="13">마포구</option>
                                    <option value="14">서대문구</option>
                                    <option value="15">서초구</option>
                                    <option value="16">성동구</option>
                                    <option value="17">성북구</option>
                                    <option value="18">송파구</option>
                                    <option value="19">양천구</option>
                                    <option value="20">영등포구</option>
                                    <option value="21">용산구</option>
                                    <option value="22">은평구</option>
                                    <option value="23">종로구</option>
                                    <option value="24">중구</option>
                                    <option value="25">중랑구</option>
                            </select>
                            목록 분류 : <select name="" class="ListSelect">
                                    <option value="최신등록순" selected="selected">최신등록순</option>
                                    <option value="가격높은순">가격높은순</option>
                                    <option value="가격낮은순">가격낮은순</option>
                                    <option value="좋아요순">좋아요순</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>

                <ul class="product">
                <% for (Jboard j : list ){ %>
                    <li onclick="location.href='product_view.jsp'">
                        <div><img src="/anavada/resources/images/test/testImg.jpg"/></div>
                        <h2><%= j.getJboardTitle()%></h2>
                        <h3><%=j.getJboardPrice() %><span> 원</span></h3>
                        <p><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span><%=j.getJboardLike() %></span></i></p>
                    </li>
                    <%} %>
                  
                </ul>
                <div class="list-no">
                    <p><img src="/anavada/resources/images/btnIcn/icn_big_listNo.png" alt="" title=""></p>
                    <h1>목록이 없습니다.</h1>
                </div>
                <div class="write-btn">
                    <a><button onclick="showWriteForm();" class="write_btn">글쓰기</button></a>
                </div>

            </div>
            <!--  페이징 처리 -->
            <dl class="list-paging pb80">
                <dd>
                	<% if (currentPage <= 1){ %>
              		<a><i class= "glyphicon glyphicon-backward"></i></a>
              		<%}else {%>
              		<a href="/anavada/jblist?page=1"><i class= "glyphicon glyphicon-backward"></i></a>
              		<%} %>
              		<% if ((currentPage - 10) < startPage && (currentPage - 10) > 10){ %>
                    <a href="/anavada/jblist?page=<%= startPage- 10%>"><i class="glyphicon glyphicon-menu-left"></i></a>
					<% }else{ %>
					<a><i class="glyphicon glyphicon-menu-left"></i></a>
					<%} %>
					<!-- 현재 페이지가 속한 페이지 그룹의 숫자 출력처리 -->
					<% for (int p = startPage; p <= endPage; p++){
						if (p == currentPage){%>
                    <a href="#none" class="active"><%=p %></a>
                    <%} else {%>
                    <a href="/anavada/jblist?page=<%=p%>"><%=p %></a>
                    <%}} %>
                    <!--  다음 그룹으로 이동처리 -->
                    <% if ((currentPage + 10) > endPage && (currentPage + 10) < maxPage){ %>
                    <a href="/anavada/jblist?page=<%= endPage + 10 %>"><i class="glyphicon glyphicon-menu-right"></i></a>
                    <%}else{ %>
                    <a><i class="glyphicon glyphicon-menu-right"></i></a>
                    <%} %>
                    
                    <% if (currentPage >= maxPage){ %>
                    <a><i class="glyphicon glyphicon-forward"></i></a>
                    <%}else{ %>
                    <a href="/anavada/jblist?page=<%=maxPage%>"><i class="glyphicon glyphicon-forward"></i> </a>
                    <%} %>
                </dd>
            </dl>
            <!-- 페이지넘버 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>