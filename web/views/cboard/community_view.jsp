<%@page import="java.util.ArrayList"%>
<%@page import="cboard.model.service.CboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cboard.model.vo.Cboard"%>
<%@page import="creply.model.vo.Creply"%>
<%
	ArrayList<Creply> rlist = (ArrayList<Creply>) request.getAttribute("rlist");
	Cboard cboard = (Cboard) request.getAttribute("cboard");
	String local = String.valueOf(request.getAttribute("local"));
	String search = String.valueOf(request.getAttribute("search"));
	String keyword = String.valueOf(request.getAttribute("keyword"));
	int currentPage = ((Integer) request.getAttribute("page")).intValue();
	int allListCount = ((Integer) request.getAttribute("allListCount")).intValue();
	int allReplyCount = ((Integer) request.getAttribute("allReplyCount")).intValue();
	String[] localArr = { "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
			"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" };
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<script type="text/javascript">
	$(function (){
		$("button").click(function () {
			$(this).next().toggle(300);
		});
	});
</script>
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

			<!-- 상세 -->
			<div class="view-area cmnt_view">
				<h2>
					<span><%=localArr[Integer.parseInt(cboard.getLocalNo()) - 1]%></span><%=cboard.getCboardTitle()%></h2>
				<ul>
					<li><span>작성자 : </span><%=cboard.getMemberId()%></li>
					<li><span>등록일 : </span><%=cboard.getDate()%></li>
					<li><span>조회수 : </span><%=cboard.getCboardViewCount()%></li>
					<li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span><%=cboard.getLikeCount()%></span></i></li>
				</ul>
				<%if((cboard.getCfilesOriginalFilepath1() != null) || (cboard.getCfilesOriginalFilepath2() != null) || (cboard.getCfilesOriginalFilepath3() != null) || (cboard.getCfilesOriginalFilepath4() != null)) { %>
				<ul>
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<%
						if (i == 0 && (cboard.getCfilesOriginalFilepath1() != null)) {
					%>
					<li><span>첨부파일#1 : </span><a
						href="/anavada/cfdown?ofile=<%=cboard.getCfilesOriginalFilepath1()%>&rfile=<%=cboard.getCfilesRenameFilepath1()%>"><%=cboard.getCfilesOriginalFilepath1()%></a></li>
					<%
						} else if (i == 1 && cboard.getCfilesOriginalFilepath2() != null) {
					%>
					<li><span>첨부파일#2 : </span><a
						href="/anavada/cfdown?ofile=<%=cboard.getCfilesOriginalFilepath2()%>&rfile=<%=cboard.getCfilesRenameFilepath2()%>"><%=cboard.getCfilesOriginalFilepath2()%></a></li>
					<%
						} else if (i == 2 && cboard.getCfilesOriginalFilepath3() != null) {
					%>
					<li><span>첨부파일#3 : </span><a
						href="/anavada/cfdown?ofile=<%=cboard.getCfilesOriginalFilepath3()%>&rfile=<%=cboard.getCfilesRenameFilepath3()%>"><%=cboard.getCfilesOriginalFilepath3()%></a></li>
					<%
						} else if (i == 3 && cboard.getCfilesOriginalFilepath4() != null) {
					%>
					<li><span>첨부파일#4 : </span><a
						href="/anavada/cfdown?ofile=<%=cboard.getCfilesOriginalFilepath4()%>&rfile=<%=cboard.getCfilesRenameFilepath4()%>"><%=cboard.getCfilesOriginalFilepath4()%></a></li>
					<%
						}
					%>

					<%
						}
					%>
				</ul>
				<%} %>
				<div class="view-ctn">
					<%=cboard.getCboardContent()%>
				</div>

				<div class="view-btn">
					<%
						if (cboard.getCboardNo() > 1) {
					%>
					<a
						href="/anavada/cdetail?cnum=<%=cboard.getCboardNo() - 1%>&page=<%=currentPage%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"
						class="btn btn-prev">이전글</a>
					<%
						}
					%>
					<%
						if (cboard.getCboardNo() < allListCount) {
					%>
					<a
						href="/anavada/cdetail?cnum=<%=cboard.getCboardNo() + 1%>&page=<%=currentPage%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"
						class="btn btn-next">다음글</a>
					<%
						}
					%>
				</div>
				<div class="view-btn">
					<% if(loginMember != null && loginMember.getMemberId().equals(cboard.getMemberId())) { %>
					<a href="/anavada/cupdateview.ss?cnum=<%= cboard.getCboardNo() %>&local=<%= cboard.getLocalNo() %>"
						class="btn btn-list">수정</a> 
					<% } %>
					<% if(loginMember != null && loginMember.getMemberId().equals(cboard.getMemberId())) { %>
					<a href="/anavada/cdelete?cnum=<%=cboard.getCboardNo()%>&rfile1=<%=cboard.getCfilesRenameFilepath1()%>
						&rfile2=<%=cboard.getCfilesRenameFilepath2()%>&rfile3=<%=cboard.getCfilesRenameFilepath3()%>&rfile4=<%=cboard.getCfilesRenameFilepath4()%>"
						class="btn btn-list">삭제</a>
					<% } %>
						 
					<a href="/anavada/clistview?page=<%=currentPage%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"
						class="btn btn-list">목록</a>
				</div>
				<div class="cmt_wrap">
					<form action="crwrite.ss" method="post">
						<input type="hidden" name="writer" value="<%=loginMember.getMemberId()%>">
						<input type="hidden" name="cnum" value="<%=cboard.getCboardNo()%>">
						<fieldset>
							<div class="cmt_form">
								<h4 class="cmt_head">댓글 <%= allReplyCount %></h4>
								<div class="cmt_body">
									<textarea name="content" style="resize: none; width: 100%; min-height: 100px; max-height: 100px;" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
									<div class="cmt_ok">
										<input type="submit" value="등록">
									</div>
								</div>
							</div>
						</fieldset>
					</form>
					<ul class="cmt_con">
					<% for(Creply c : rlist) {%>
						<li>
							<div>
								<h4>user : <%= c.getMemberId() %></h4>
								<span><%= c.getCreplyDate() %></span>
							</div>
							<p><%= c.getCreplyContent() %></p>
							<button>대댓글</button>
								<div class="Subcmt_form" style="display: none;">
									<form action="" method="">
										<fieldset>
											<div class="cmt_form">
												<div class="cmt_body">
													<textarea name=""
														style="resize: none; width: 100%; min-height: 100px; max-height: 100px;"
														onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
													<div class="cmt_ok">
														<input type="submit" value="등록">
													</div>
												</div>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="Subcmt_form" style="background-color: #E6E6E6;">
									<div>
										<h4>user : asdf123</h4>
										<span>2020.08.16. 12:12:00</span>
									</div>
									<p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를
										미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
								</div>
						</li>
					<% } %>
					</ul>
					<button class="cmt_in">
						댓글 더보기 <i class="glyphicon glyphicon-menu-right"></i>
					</button>
				</div>
			</div>
			<!-- 상세 끝 -->

		</div>
		<!-- 컨텐츠 끝 -->

		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>