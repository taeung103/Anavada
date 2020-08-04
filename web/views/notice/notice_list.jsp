<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">공지사항</a></li>
                        </ul>
                    </div>
                    <h2><span>공지사항</span></h2>
                    <h3>'Anavada'의 소식을 빠르게 확인할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 리스트 -->

            <div class="list-area">
               <!--종류 리스트-->
				<div class="sort-area">
					<h4>
						전체
						<%= list.size() %>개
					</h4>
					<a href="notice_write.jsp" class="write_btn">글쓰기</a>
					<div>
						<form action="" method="" id="">
							목록 분류 : <select name="" class="ListSelect">
								<option value="분류 선택" selected="selected">분류 선택</option>
								<option value="searchtitle">제목</option>
								<option value="searchcontent">내용</option>
							</select> <input type="text" placeholder="검색어를 입력해주세요.">
							<button class="top-search">
								<i class="xi-search"></i>
							</button>
						</form>
					</div>
				</div>

			<% if(list.size() == 0) { %>
				<div class="list-no">
					<p>
						<img src="/anavada/resources/images/btnIcn/icn_big_listNo.png"
							alt="" title="" />
					</p>
					<h1>목록이 없습니다.</h1>
				</div>
				
			<% }else { %>

				<table>
                    <tbody>
                        <tr onclick="location.href='notice_view.jsp';" class="active">
                            <td class="number">10</td>
                            <td class="title">
                                <h2><span>공지</span>'Anavada'의 소식을 빠르게 확인할 수 있는 공간입니다.</h2>
                                <ul>
                                    <li>작성자 : 관리자</li>
                                    <li>작성일 : 2019.02.30</li>
                                    <li>조회수 : 30</li>
                                </ul>
                            </td>
                            <td class="fileDown"><i class="glyphicon glyphicon-floppy-saved"></i></td>
                        </tr>
                        <% for(Notice n : list) { %>
                        <tr onclick="location.href='notice_view.jsp';">
                            <td class="number"><%= n.getNoNo() %></td>
                            <td class="title">
                                <h2><%= n.getNoTitle() %></h2>
                                <ul>
                                    <li>작성자 : <%= n.getNoId() %></li>
                                    <li>작성일 : <%= n.getNoDate() %></li>
                                    <li>조회수 : <%= n.getNoCount() %></li>
                                </ul>
                            </td>
                            <td class="fileDown">
                            <% if(n.getNoOriginal() != null) { %>
                            <i class="glyphicon glyphicon-floppy-saved"></i>
                            <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

			<% } %>

                <div class="write-btn">
                    <a href="notice_write.jsp">글쓰기</a>
                </div>

            </div>


            <!-- 리스트 끝 -->


            <!-- 페이지넘버 -->
            <dl class="list-paging pb80">
                <dd>
                    <a href="#none"><i class="glyphicon glyphicon-menu-left"></i></a>
                    <a href="#none" class="active">1</a>
                    <a href="#none">2</a>
                    <a href="#none">3</a><!-- 활성화 class="active" -->
                    <a href="#none">4</a>
                    <a href="#none">5</a>
                    <a href="#none"><i class="glyphicon glyphicon-menu-right"></i></a>
                </dd>
            </dl>
            <!-- 페이지넘버 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>