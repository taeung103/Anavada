<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="cboard.model.vo.Cboard, java.util.ArrayList, java.sql.Date"%>
<%
	ArrayList<Cboard> list = (ArrayList<Cboard>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	String toServlet = "/anavada/clselect?local=";
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/head.jsp"%>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>

		<!-- 컨텐츠 -->
		<div id="content">

			<!--서브 비주얼/타이틀-->
			<div class="visual-sub-vagas community-vagas">
				<div class="vsv-copy sub-title">
					<div>
						<ul class="navi">
							<li><a href="#none">홈</a></li>
							<li><a href="#none">고객센터</a></li>
							<li class="glyphicon glyphicon-menu-right"><a href="#none">커뮤니티</a></li>
						</ul>
					</div>
					<h2>
						<span>커뮤니티</span>
					</h2>
					<h3>우리의 이웃과 'Anavada'를 통해 소통할 수 있는 공간입니다.</h3>
				</div>
			</div>
			<!--서브 비주얼/타이틀 끝-->

			<!-- 리스트 -->
			<div class="list-area">
				<!--종류 리스트-->
				<div class="sort-area">
					<h4>
						전체 게시글
						<%=listCount%>개
					</h4>
					<a href="community_write.jsp" class="write_btn">글쓰기</a>
					<div>
						<form action="/anavada//clselect" method="post" style="display: inline-block;">
						<input type="hidden" value="">
							지역 분류 : <select name="local" class="LocationSelect" onChange="window.location.href=this.value">
								<option value="null" selected="selected">지역선택</option>
								<option value="<%= toServlet %>1">강남구</option>
								<option value="<%= toServlet %>2">강동구</option>
								<option value="<%= toServlet %>3">강북구</option>
								<option value="<%= toServlet %>4">강서구</option>
								<option value="<%= toServlet %>5">관악구</option>
								<option value="<%= toServlet %>6">광진구</option>
								<option value="<%= toServlet %>7">구로구</option>
								<option value="<%= toServlet %>8">금천구</option>
								<option value="<%= toServlet %>9">노원구</option>
								<option value="<%= toServlet %>10">도봉구</option>
								<option value="<%= toServlet %>11">동대문구</option>
								<option value="<%= toServlet %>12">동작구</option>
								<option value="<%= toServlet %>13">마포구</option>
								<option value="<%= toServlet %>14">서대문구</option>
								<option value="<%= toServlet %>15">서초구</option>
								<option value="<%= toServlet %>16">성동구</option>
								<option value="<%= toServlet %>17">성북구</option>
								<option value="<%= toServlet %>18">송파구</option>
								<option value="<%= toServlet %>19">양천구</option>
								<option value="<%= toServlet %>20">영등포구</option>
								<option value="<%= toServlet %>21">용산구</option>
								<option value="<%= toServlet %>22">은평구</option>
								<option value="<%= toServlet %>23">종로구</option>
								<option value="<%= toServlet %>24">중구</option>
								<option value="<%= toServlet %>25">중랑구</option>
							</select>
						</form>
						<form action=""  style="display: inline-block;">
							<select name="select" class="ListSelect">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="keyword" placeholder="검색어를 입력해주세요.">
							<button class="top-search" type="submit">
								<i class="xi-search"></i>
							</button>
						</form>
					</div>
				</div>

				<table class="cmnt_list">
					<tbody>
						<%
							for (Cboard c : list) {
						%>
						<tr>
							<td class="number"><%=c.getCboardNo()%></td>
							<td class="title">
								<h2>
									<span>종로구</span><%=c.getCboardTitle()%>
								</h2>
								<ul>
									<li>작성자 : <%=c.getMemberId()%></li>
									<li>작성일 : <%=c.getDate()%></li>
									<li>조회수 : <%=c.getCboardViewCount()%></li>
									<li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span><%=c.getLikeCount()%></span></i></li>
								</ul>
							</td>
							<td class="fileDown"><i class="glyphicon glyphicon-picture"></i></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>


				<div class="list-no">
					<%
						if (endPage + 1 > maxPage) {
					%>
					<p>
						<img src="/anavada/resources/images/btnIcn/icn_big_listNo.png"
							alt="" title="" />
					</p>
					<h1>목록이 없습니다.</h1>
					<%
						}
					%>

				</div>


				<div class="write-btn">
					<a href="community_write.jsp">글쓰기</a>
				</div>

			</div>


			<!-- 리스트 끝 -->


			<!-- 페이지넘버 -->
			<dl class="list-paging pb80">
				<dd>
					<%
						if (startPage - 1 <= 0) {
					%>
					<a><i class="glyphicon glyphicon-menu-left"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/clistview?page=<%=startPage - 10%>"><i
						class="glyphicon glyphicon-menu-left"></i></a>
					<%
						}
					%>
					<%
						for (int p = startPage; p <= endPage; p++) {
					%>
					<%
						if (currentPage == p) {
					%>
					<a href="/anavada/clistview?page=<%=p%>" class="active"><%=p%></a>
					<%
						} else {
					%>
					<a href="/anavada/clistview?page=<%=p%>"><%=p%></a>
					<%
						}
					%>
					<%
						}
					%>
					<%
						if (endPage + 1 > maxPage) {
					%>
					<a><i class="glyphicon glyphicon-menu-right"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/clistview?page=<%=endPage + 1%>"><i class="glyphicon glyphicon-menu-right"></i></a>
					<%
						}
					%>
				</dd>
			</dl>
			<!-- 페이지넘버 끝 -->

		</div>
		<!-- 컨텐츠 끝 -->

		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>