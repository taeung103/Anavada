<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, fboard.model.vo.Fboard"%>
	
<%
	ArrayList<Fboard> list = (ArrayList<Fboard>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/head.jsp"%>

<style>
/* 카카오맵 오버레이 꾸미기  */
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 25px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 14px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
/* 카카오맵 오버레이 꾸미기  끝 */
</style>

</head>

<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>

		<!-- 컨텐츠 -->
		<div id="content">

			<!--서브 비주얼/타이틀-->
			<div class="visual-sub-vagas areaEvent-vagas">
				<div class="vsv-copy sub-title">
					<div>
						<ul class="navi">
							<li><a href="#none">홈</a></li>
							<li><a href="#none">고객센터</a></li>
							<li class="glyphicon glyphicon-menu-right"><a href="#none">지역축제</a></li>
						</ul>
					</div>
					<h2>
						<span>지역축제</span>
					</h2>
					<h3>우리의 이웃과 'Anavada'를 통해 소통할 수 있는 공간입니다.</h3>
				</div>
			</div>
			<!--서브 비주얼/타이틀 끝-->

			<!-- 리스트 -->
			    <div class="areaEvent_list">
                <div class="areaEvent_map">
                    <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.453554125798!2d126.98089706565142!3d37.56793627979763!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2eee632d73f%3A0x15cc2733ad91fd28!2zS0gg7KCV67O06rWQ7Jyh7JuQ!5e0!3m2!1sko!2skr!4v1595997675697!5m2!1sko!2skr" width="100%" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div> -->
                    <div id="map" style="width: 100%; height: 500px;"></div>
                    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53d444db7d449eb66c0229426868cf97"></script>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center : new kakao.maps.LatLng(37.5311008, 126.9810742), // 지도의 중심좌표
                            level : 9 // 지도의 확대 레벨
                           /*  mapTypeId : kakao.maps.MapTypeId.ROADMAP */
                        };

                        // 지도를 생성한다 
                        var map = new kakao.maps.Map(mapContainer, mapOption);
                     // 지도에 마커를 표시합니다 
                 		<% int index = 0;%>
                		<%for (Fboard f : list) { index++;%>
                		var marker<%=index%> = new daum.maps.Marker({
                			map : map,
                			position : new daum.maps.LatLng(<%=f.getMapY()%>, <%=f.getMapX()%>)
                		});

                		// 커스텀 오버레이에 표시할 컨텐츠 입니다
                		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                		// 별도의 이벤트 메소드를 제공하지 않습니다 
                		var content<%=index%> = '<div class="wrap">'
                				+ '    <div class="info">'
                				+ '        <div class="title">' + "<%=  f.getFestivalTitle()%>"
                				+ '            <div class="close" onclick="closeOverlay<%=index%>()" title="닫기"></div>'
                				+ '        </div>'
                				+ '        <div class="body">'
                				+ '            <div class="img">'
                				+ '                <img src="<%= f.getThumbnail() %>" width="73" height="70" alt="NoImage">'
                				+ '           </div>'
                				+ '            <div class="desc">'
                				+ '                <div class="ellipsis">서울시 <%= f.getLocalName()%></div>'
                				+ '                <div class="jibun ellipsis"><%=f.getFestivalStartDate()%> ~ <%=f.getFestivalEndDate()%></div>'
                				+ '                <div><a href="/anavada/views/fboard/areaEvent_view.jsp?fboardno=<%=f.getFboardNo()%>&festivalEndDate=<%=f.getFestivalEndDate()%>" target="_blank" class="link">상세 페이지로 이동</a></div>'
                				+ '           </div>' + '        </div>' + '    </div>'
                				+ '</div>'; 
                	
                 		// 마커 위에 커스텀오버레이를 표시합니다
                		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                		var overlay<%=index%> = new daum.maps.CustomOverlay({
                			content : content<%=index%>,
                			map : map,
                			position : marker<%=index%>.getPosition()
                		});
                		
                		overlay<%=index%>.setMap(null);	// 처음 시작할때는 오버레이 표시 안하기
                		
                		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                		daum.maps.event.addListener(marker<%=index%>, 'click', function() {
                			overlay<%=index%>.setMap(map);
                		});

                		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
                		function closeOverlay<%=index%>() {
                			overlay<%=index%>.setMap(null); 
                			}
                		<%}%>
                		
                	</script>
                <!-- 카카오맵 지도 끝 -->
			
					
					<!--종류 리스트-->
					<div class="sort-area">
						<h4 id="totalcount">전체 150개</h4>
						<a href="areaEvent_write.jsp" class="write_btn">글쓰기</a>
						<div>
							<form action="" method="" id="">
								지역 분류 : <select name="" class="LocationSelect">
									<option value="지역선택" selected="selected">지역선택</option>
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
								</select> <select name="" class="ListSelect">
									<option value="분류 선택" selected="selected">분류 선택</option>
									<option value="제목">제목</option>
									<option value="내용">내용</option>
									<option value="작성자">작성자</option>
									<option value="작성자">조회순</option>
									<option value="작성자">마감순</option>
								</select> <input type="text" placeholder="검색어를 입력해주세요.">
								<button class="top-search">
									<i class="xi-search"></i>
								</button>
							</form>
						</div>
					</div>
					
						<!-- 지난 축제 모두보기 -->
				<script type="text/javascript">
				/* 축제 정보 ajax로 처리하기  */
				$(document).ready(function() {
					$.ajax({
					url : "/anavada/fblist",
					type : "get",
					dataType : "json",
					success : function(data){
						console.log("success : " + data);
				
						//object ==> string 으로 변환
						var jsonStr = JSON.stringify(data);
						//string ==> json 객체로 바꿈
						var json = JSON.parse(jsonStr);
						var totalcount = (json.list).length;	//가지고온 축제 개수
						var values = "";
						$("#totalcount").text( '전체 : ' + totalcount);
				
						for(var i in json.list) {
						values += "<tr onclick='moveDetailPage(" + json.list[i].fboardNo + ", " + json.list[i].festivalEndDate + ");'>" +
						"<td class='number'>" + json.list[i].fboardNo + "</td>" +
						"<td class='sum'><img src='"+ json.list[i].thumbnail +"' width='150px' height='100px' ></td>" +
						"<td class='title'><h2><span>" +  decodeURIComponent(json.list[i].festivalTitle).replace(/\+/gi, " ") + "</span></h2>" +
						"<ul>" +
							"<li>축제 지역 : " + json.list[i].localName + "</li>" +
							"<li>축제기간 : "+ json.list[i].festivalStartDate + " ~ " + json.list[i].festivalEndDate+ "</li>" +
							"<li>조회수 : " + json.list[i].readcount + "<span>  댓글 : " + json.list[i].replycount +  "</span></li>" +
						"</ul></td></tr>" 
						}	//for in
					
					$("#fboard-table").html(values);	
				
				},
				error : function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				}
			});	//ajax
		});	//document.ready
		/* 축제 정보 ajax로 처리하기 끝내기 */
		
		/* 상세페이지로 이동 */
		function moveDetailPage(boardNo, festivalEndDate) {
			console.log(boardNo, festivalEndDate);
			location.href = '/anavada/views/fboard/areaEvent_view.jsp?fboardno=' + boardNo + '&festivalEndDate=' + festivalEndDate;
		}

	</script>
					
					
					<!-- 축제 목록 table  -->
					<table id="fboard-table" class="cmnt_list">
						<tbody>
<!-- 							<tr onclick="location.href='areaEvent_view.jsp';">
								<td class="number">10</td>
								<td class="sum"><img
									src="/anavada/resources/images/test/testImg.jpg" width="150px"
									height="150px"></td>
								<td class="title">
									<h2>
										<span>서울시 종로구</span>여우樂 페스티벌 2020
									</h2>
									<p>올해로 11회를 맞이하는 여우락 페스티벌은 전통의 뿌리를 이어오는 명인들의 내공과 우리 음악의 외연을
										넓힌 실력파 앙상블의 연주로 믿고보는 무대를 선보인다. 끊임없이 우리 음악의 가능성을 실험하는 아티스트들의
										도전적이고 새로운 무대를 가장 먼저 확인할 수 있으며, 대중성 있는 음악과의 협업으로 에너지를 뿜어내는 신나는
										공연까지 만날 수 있다. 2020 여우樂 페스티벌은 전통에서부터 현재에 이르는 우리 음악의 다양한 스펙트럼을
										보여 줄 것이다.</p>
									<ul>
										<li>작성자 : 홍길동</li>
										<li>축제기간 : 2020.07.30 ~ 2020.08.30</li>
										<li>조회수 : 30</li>
										<li><i class="good_i glyphicon glyphicon-heart-empty">좋아요<span>+999</span></i></li>
									</ul>
								</td>
							</tr> -->
						</tbody>
					</table>
					<!-- 축제 목록 table 끝 -->

					<div class="list-no">
						<p>
							<img src="/anavada/resources/images/btnIcn/icn_big_listNo.png"
								alt="" title="" />
						</p>
						<h1>목록이 없습니다.</h1>
					</div>


					<div class="write-btn">
						<a href="areaEvent_write.jsp">글쓰기</a>
					</div>

				</div>
				<!-- 리스트 끝 -->


				<!-- 페이지넘버 -->
				<dl class="list-paging pb80">
					<dd>
						<a href="#none"><i class="glyphicon glyphicon-menu-left"></i></a>
						<a href="#none" class="active">1</a> <a href="#none">2</a> <a
							href="#none">3</a>
						<!-- 활성화 class="active" -->
						<a href="#none">4</a> <a href="#none">5</a> <a href="#none"><i
							class="glyphicon glyphicon-menu-right"></i></a>
					</dd>
				</dl>
				<!-- 페이지넘버 끝 -->

			</div>
			<!-- 컨텐츠 끝 -->

			<%@ include file="../include/footer.jsp"%>
		</div>
</body>
</html>