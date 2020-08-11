<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="declare.model.vo.Declare"%>
<%
	ArrayList<Declare> list = (ArrayList<Declare>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고자관리</title>
<%@ include file="../include/admin_head.jsp"%>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<div id="wrap">
		<%@ include file="../include/admin_header.jsp"%>

		<!-- 컨텐츠 -->
		<div id="admin_container">

			<!-- 상단 타이틀 -->
			<div class="admin_title">
				<div class="admin_path">
					<h3>신고자관리</h3>
					<h2>등록</h2>
				</div>
			</div>

			<!-- 리스트 -->
			<div class="list-area">
				<!--종류 리스트-->
				<div style="width: 500px; float: left;">
					<div class="sort-area">
						<h4>
							전체
							<%= list.size() %>
							개
						</h4>
						<!-- <a href="/anavada/views/admin/declare/admindeclareWriteView.jsp" class="write_btn">블랙회원 등록</a> -->
						<!-- <a href="/anavada/ddelete.ad" class="write_btn">삭제하기</a> -->
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
<script type="text/javascript" src="/anavada/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
		$("#all").on("click", function(){
			if($('input:checkbox[id="all"]').is(":checked")==ture){
				$('input:checkbox[name="no"]').each(function(){
					this.checked = true;		
				});
			}else{
				$('input:checkbox[name="no"]').each(function){
					this.checked = false;	
				});
			}
		})
	$("#del").on("click",function(){
		paramdata=""
		$('input:checkbox[name="no"]').each(function() {
			if(this.checked){
				//alert($(this).closest("td").next().children('input:text[name="id"]').val())
				paramdata=paramdata+"id="+
					$(this).closest("td").next().children('input:text[name="no"]').val()+"&"
			}
		})
		location.href="/kimsaemERP/admin/passmodify.do?"
							+paramdata.substr(0, paramdata.length-1)
	})
}) */
function checkAll(){
	if($("input[name=checkAll]").is(":checked")){
		$("input[name=checkDel]").prop("checked", true);
	}else{
		$("input[name=checkDel]").prop("checked", false);
	}
}
function deleteAction(){
	var checkRow = "";
	$("input[name='checkDel']:checked").each(function(){
		checkRow = checkRow + $(this).val()+",";
	});
	checkRow = checkRow.substring(0, checkRow.lastIndexOf(","));
	
	if(checkRow == ""){
		alert("삭제할 대상을 선택하세요.");
		return false;
	}
	console.log("### checkRow => {"+checkRow+"}");
	
	if(confirm("삭제 하시겠습니까?"))
		location.href = "/anavada/ddelete.ad?checkRow="+checkRow;
}
	</script>
					<form action="">
						<table>
							<tbody>
								<tr>
								    <th></th>
									<th>번호</th>
									<th>신고회원</th>
									<th>신고횟수</th>
									<th>제한설정</th>
								</tr>
								<% for(Declare d : list){ %>
								<tr>
									<td class="checkBox"><input type="checkbox" name="checkDel" value="<%= d.getDeclareNo() %>"></td>
									<td><%= d.getDeclareNo() %></td>
									<td><%= d.getDeclareId() %></td>
									<td><%= d.getDeclareCount() %></td>
									<td>
										<% if(d.getDeclareOk().equals("N")){ %> 
										</i>제한없음</span> &nbsp; 
										<% }else{// 배너가 보이게 하려면%>
										</i>제한설정</span> &nbsp; <% }  %>
									</td>
								</tr>
								<% } %>
							</tbody>
						</table>

						<!-- <div class="list-no">
							<a href="/anavada/dlist.ad">목록</a>
						</div> -->
						<!-- 버튼 -->
						<input type="checkBox" name="checkAll" onclick="checkAll();" class="checkBox"> 전체 선택<br>
                	<div class="btn_wrap">
                   	 <a onclick="deleteAction();" class="btn-left btn_gray">선택삭제</a>
              		</div>
                <!-- //버튼 -->

					</form>
					<!-- 페이지넘버 -->
					<dl class="list-paging pb80" style="width: 100%;">
						<dd>
							<% if(currentPage <= 1){ %>
							<a><i class="glyphicon glyphicon-menu-left"></i></a>
							<% }else{ %>
							<a href="/anavada/dlist.ad?page=1"><i
								class="glyphicon glyphicon-menu-left"></i></a>
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
							<a href="/anavada/dlist.ad?page=<%= p %>"><%= p %></a>
							<% }} %>
							<!-- 맨끝 페이지로 이동처리 -->
							<% if(currentPage >= maxPage){ %>
							<a><i class="glyphicon glyphicon-menu-right"></i></a>
							<% }else{ %>
							<a href="/anavada/dlist.ad?page=<%= maxPage %>"><i
								class="glyphicon glyphicon-menu-right"></i></a>
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
				<!-- 리스트 끝 -->
				<div style="width: 500px; float: right;">
					<!-- 글쓰기 -->
					<form action="/anavada/dinsert.ad" method="post"
						class="form-inline" onesubmit="return validate();">
						<fieldset>
							<div class="admin-library-write">

								<h2>블랙회원 등록</h2>

								<table>
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<tbody>
										<tr>
											<td>회원아이디</td>
											<td><input type="text" name="blackid" title=""
												class="form-control w100p" placeholder="회원아이디" /></td>
										</tr>
										<!--   <tr>
                                        <td>신고당한 횟수</td>
                                        <td>
                                        	<label><input type="radio" name="count" id="숨기기" value="1">처음이면</label>
                                        </td>
                                    </tr> -->
										<tr>
											<td>로그인제한 설정(Y/N)</td>
											<td>
												<!-- <input type="text" name="check" title="" class="form-control w100p" placeholder="Y/N" /> -->
												<label><input type="radio" name="controller"
													id="제한설정" value="Y">제한설정</label> <label><input
													type="radio" name="controller" id="제한없음" value="N" checked>제한없음</label>
											</td>
										</tr>
										<!-- <tr>
                                        <td>설명</td>
                                        <td><textarea name="content" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:200px; max-height:200px;"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>배너파일등록</td>
                                        <td><input type="file" name="ofile"></td>
                                    </tr>
                                    <tr>
                                        <td>URL등록</td>
                                        <td><input type="text" name="url" title="" class="form-control w100p" placeholder="http://" /></td>
                                    </tr>
                                    <tr>
                                        <td>배경사이즈</td>
                                       <td><input type="text" name="size" title="" class="form-control w100p" placeholder="사이즈" /></td>
                                    </tr> -->
									</tbody>
								</table>
							</div>
						</fieldset>

						<!-- //글쓰기 -->

						<!-- 버튼 -->
						<div class="write-btn">
							<a href="javascript:history.go(-1);" class="btn btn-cancel">작성취소</a>
							<input type="submit" class="btn btn-success" value="등록">
						</div>
						<!-- //버튼 -->
					</form>
				</div>

			</div>
		</div>
		<!-- 컨텐츠 끝 -->

		<%@ include file="../include/admin_footer.jsp"%>
	</div>

</body>
</html>