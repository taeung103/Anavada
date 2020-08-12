<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="cboard.model.vo.Cboard"%>
<%
	ArrayList<Cboard> clist = (ArrayList<Cboard>)request.getAttribute("list");
	String local = String.valueOf(request.getAttribute("local"));
	String search = String.valueOf(request.getAttribute("search"));
	String keyword = String.valueOf(request.getAttribute("keyword"));
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	String[] localArr = { "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", 
			"서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" };
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/admin_head.jsp" %> 
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/admin_header.jsp" %> 

        <div id="admin_container">

            <!-- 상단 타이틀 -->
            <div class="admin_title">
                <div class="admin_path">
                    <h3>커뮤니티</h3>
                    <h2>| 리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="list-area">


                <!-- 검색영역 -->
                <div class="sort-area">  
                    <h4>전체 150개</h4>
                    <div>
                        <form action="" method="" id="">
                           	 목록 분류 : <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">분류 선택</option>
                                    <option value="아이디">아이디</option>
                                    <option value="이름">글제목</option>
                                    <option value="이메일">글내용</option>
                                    <option value="전화번호">좋아요</option>
                                    <option value="전화번호">지역명</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>
                <!-- 검색영역 끝 -->

                <table class="cboardTable" style="width: inherit;" co>
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="15%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>선택</th>
                            <th>글번호</th>
                            <th>아이디</th>
                            <th>지역명</th>
                            <th>글제목</th>
                            <th>조회수</th>
                            <th>좋아요</th>
                            <th>작성일자</th>
                            <th>수정일자</th>
                        </tr>
                        <%for(Cboard c : clist) {%>
                        <tr onclick="location.href='/anavada/cdetail?cnum=<%= c.getCboardNo()%>'">
                            <td class="checkBox"><input type="checkbox"></td>
                            <td class="number"><%= c.getCboardNo() %></td>
                            <td class="id"><%= c.getMemberId() %></td>
                            <td class="name"><%= c.getLocalNo() %></td>
                            <td class="originalFile"><%= c.getCboardTitle() %></td>
                            <td class="email"><%= c.getCboardViewCount() %></td>
                            <td class="renameFile"><%= c.getLikeCount() %></td>
                            <td class="phone"><%= c.getDate() %></td>
                            <td class="phone"><%= c.getLastmodifiedDate() %></td>
                        </tr>
                        <% } %>
                                               
                    </tbody>
                </table>

                <p class="warning_text"> *삭제한 회원은 복구가 불가능하니 신중하게 선택하세요.</p>
                <!-- //게시판 -->

                <!-- 버튼 -->
                <div class="btn_wrap">
                    <a href="#" class="btn-left btn_gray">선택삭제</a>
                    <a href="notice_write.php" class="btn-right btn_white">등록</a>
                </div>
                <!-- //버튼 -->

                <!-- 페이징 -->
                <dl class="list-paging">
                    <dd>
                        <%
						if (currentPage <= 1) {
					%>
					<a><i class="glyphicon glyphicon-backward"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/adclistview?local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"><i class="glyphicon glyphicon-backward"></i></a>
					<% } %>
					<%
						if (startPage  <= 1) {
					%>
					<a><i class="glyphicon glyphicon-menu-left"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/adclistview?page=<%=startPage - 10%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>">
						<i class="glyphicon glyphicon-menu-left"></i>
					</a>
					<%
						}
					%>
					<%
						for (int p = startPage; p <= endPage; p++) {
					%>
					<%
						if (currentPage == p) {
					%>
					<a href="/anavada/adclistview?page=<%=p%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>" class="active"><%= p %></a>
					<%
						} else {
					%>
					<a href="/anavada/adclistview?page=<%=p%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"><%=p%></a>
					<%
						}
					%>
					<%
						}
					%>
					<%
						if (endPage >= maxPage) {
					%>
					<a><i class="glyphicon glyphicon-menu-right"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/adclistview?page=<%=endPage + 1%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"><i class="glyphicon glyphicon-menu-right"></i></a>
					<%
						}
					%>
					<%
						if (currentPage >= maxPage) {
					%>
					<a><i class="glyphicon glyphicon-forward"></i></a>
					<%
						} else {
					%>
					<a href="/anavada/adclistview?page=<%=maxPage%>&local=<%=local%>&search=<%=search%>&keyword=<%=keyword%>"><i class="glyphicon glyphicon-forward"></i></a>
					<%
						}
					%> 
                    </dd>
                </dl>
                <!-- //페이징 -->

            </div>
        <%@ include file="../include/admin_footer.jsp" %> 
        </div>
    </div>
</body>
</html>