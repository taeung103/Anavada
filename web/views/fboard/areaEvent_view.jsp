<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fboardNo = request.getParameter("fboardno");
 	int festivalEndDate = Integer.parseInt(request.getParameter("festivalEndDate").toString());
	System.out.println(fboardNo + ",  "  + festivalEndDate); 
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %> 
</head>
	<!-- 현재 진행중이지 않은 축제 알리기 -->
	<script type="text/javascript">
 	console.log(<%=fboardNo %>, <%= festivalEndDate%>);
	<% 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    Calendar c1 = Calendar.getInstance();
	int strToday = Integer.parseInt(sdf.format(c1.getTime()));
	
	if(festivalEndDate < strToday) { %>
		alert('지난 축제 입니다');
	<% } %>

	</script>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <%@ include file="../include/header.jsp" %>

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
                    <h2><span>지역축제</span></h2>
                    <h3>우리의 이웃과 'Anavada'를 통해 소통할 수 있는 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->
            
            <!-- 축제 상세보기 -->
            		<script type="text/javascript">
					$(function() {
					$.ajax({
						url : "/anavada/fbdetail",
						type : "get",
						data : {fboardno : <%= fboardNo%>},
						dataType : "json",
						success : function(data) {
							console.log("success : " + data);
								
						$('#title').text(data.title);
						$('#localname').text("서울시  ", data.localName);
						$('#createdd').text("축제 수정일 : " + data.festivalmodifiedDate);
						$('#readcount').text("조회수 " + data.readcount);
						$('#firstimage').attr("src", data.firstimage);
						
						$('#festivaloverview').html(data.overview);
						
						var values = 
						'<tr><th>축제 상세 주소</th><td colspan="3">' + data.addr1 + data.addr2 + '</td></tr>' +
                         '<tr><th>축제 기간</th><td colspan="3">'+ data.period  + '</td></tr>' +
                    	'<tr><th>홈페이지</th><td colspan="3">'  + data.homepage + '</td></tr>' +
                    	'<tr><th>주최/주최기간 문의</th><td colspan="3">' + data.telname + ", " + data.tel + '</td></tr>';
                    	
						$('#fbdetail').append(values);
						},
						error : function(jqXHR, textstatus, errorthrown) {
							console.log("error : " + jqXHR + ", " + textstatus
									+ ", " + errorthrown);
						}
					}); //ajax

		}); //document.ready
	</script>
            

            <!-- 상세 -->
            <div class="view-area areaEvent_view">
                 <h2 id="title"><span id="localname">서울시 종로구</span>여우樂 페스티벌 2020</h2>
                <ul>
                    <li><span>작성자 : </span>관리자</li>
                    <li id="createdd"></li>
                    <li id="readcount"></li>
                </ul>
                <div class="areaEvent_info">
                   <div><img id="firstimage" src="" width="500px" height="333px"></div>
                    <table id="fbdetail">
                        <colgroup>
                            <col width="15%">
                            <col width="35%">
                            <col width="15%">
                            <col width="35%">
                        </colgroup>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <h2>축제설명</h2>
                <div id="festivaloverview" class="view-ctn">
                </div>  



                <div class="view-btn">
                  	<!--  <a href="#none" class="btn btn-prev">이전글</a> -->
                    <a href="areaEvent_list.jsp" class="btn btn-list">목록</a>
                   <!--  <a href="#none" class="btn btn-next">다음글</a> -->
                </div>
                
                
                
                
                <div class="cmt_wrap">
                
                
<!--                     <form action="" method="">
                        <fieldset>
                            <div class="cmt_form">
                                <h4 class="cmt_head">댓글 77</h4>
                                <div class="cmt_body">
					<textarea name="" style="resize: none; width:100%; min-height:100px; max-height:100px;" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
                                    <div class="cmt_ok"><input type="submit" value="등록"></div>
                                </div>
                            </div>
                        </fieldset>
                    </form> -->
                    
                                        <form name="replysubmit" method="post" action="">
                        <fieldset>
                            <div class="cmt_form">
                            <h4 id="totalcount" class="cmt_head">댓글 : 4</h4>
                                <div class="cmt_body">
                                <input type="hidden" id="boardno" name="boardno" value="<%= fboardNo%>">    
                                <input type="hidden" id= "memberid" name="memberid" value="user01">	<!-- 나중에 멤버아이디 변경하기 -->
								<textarea id="replyContent" name="replyContent" style="resize: none; width:100%; min-height:100px; max-height:100px;" placeholder="댓글을 작성해주세요"></textarea>
                                 <div class="cmt_ok"><input type="button" value="등록" onclick="ReplySubmit(${result.code})"></div>
                               	 </div>
                            </div>
                        </fieldset>
                    </form>
                    
                     <script type="text/javascript">
                      $(function(){
                    	  getCommentList()
                      });
                    	  
                      function getCommentList() {
                    	  $.ajax({
      						url : "/anavada/fbreplylist",
      						type : "get",
      						data : {fboardno : <%= fboardNo%>},
      						dataType : "json",
      						success : function(data) {
      							console.log("success : " + data);
      							console.log("댓글 나오기")
      							
      							var jsonStr = JSON.stringify(data);
								var json = JSON.parse(jsonStr);
								var totalcount = (json.list).length;	//가지고온 축제 개수
								var values = "";
								$("#totalcount").text('댓글 : ' + totalcount );
								
								for(var i in json.list) {
								values += '<li><div>' +
                                '<h4>user : ' + json.list[i].memberId + '</h4><span>' + json.list[i].fboardReplyCreatDate + '</span>' +
                                '</div><p>' + decodeURIComponent(json.list[i].fboardReplyContent).replace(/\+/gi, " ") + '</p>' + 
                                '<div class="cmt_ok"><input type="submit" value="삭제" onclick="Replydelete(' + json.list[i].fboardReplyNo + ');"></div>' +
                                '<button onclick="">대댓글</button>'
                                
                                /* '<div class="Subcmt_form">' +
                                '<form name="replysubmit" method="post" action="/testjosn/fbreplyinsert.ss?fboardReplyLev=2&fboardReplyPNo=' + json.list[i].fboardReplyNo + '">' +
                                    '<fieldset><div class="cmt_form"><div class="cmt_body"><textarea id="replycontent" style="resize: none; width:100%; min-height:100px; max-height:100px;">비방글은 작성하실 수 없습니다.</textarea>' +
                                            '<div class="cmt_ok"><input type="submit" value="등록" onclick="ReplySubmit()"></div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</fieldset></form></div>' +
                          		'</li>' */
								}	//for in
								
								$("#fbreply").empty();
								 $("#fbreply").html($("#reply").html() + values);

								/* $("#reply").html($("#reply").html() + values); */
      						},
      						error : function(jqXHR, textstatus, errorthrown) {
      							console.log("error : " + jqXHR + ", " + textstatus
      									+ ", " + errorthrown);
      						}
      					}); //ajax
                      }	
                      
                      
                      function ReplySubmit(code) {
                          if (document.getElementById("replyContent").value == "") {
                              alert("내용을 입력해주세요");
                              return false;
                    }else
                  	  $.ajax({
                  		url : "/anavada/fbreplyinsert.ss",
                	        type:'POST',
                	        data : {replyContent : $('#replyContent').val(), memberid : $('#memberid').val(), boardno : $('#boardno').val()},
                	        success : function(data){
                	        	 alert("댓글이 등록되었습니다."); 
                	                getCommentList();
                	                $("#replyContent").val("");
                	        },
                	        error:function(request,status,error){
                	        	console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
                	       }
                	    });
                    }
                    
                    function Replydelete(fboardReplyNo) {
                  	  console.log(fboardReplyNo + "댓글 삭제하기")
                  	  /* location.href="/testjson/fbreplydelete?fboardReplyNo=" + fboardReplyNo; */
                  	  
                  	  $.ajax({
                    		url : "/anavada/fbreplydelete.ss",
                  	        type:'POST',
                  	        data : {fboardReplyno : fboardReplyNo},
                  	        success : function(data){
                  	        	 alert("댓글이 삭제되었습니다."); 
                  	                getCommentList();
                  	        },
                  	        error:function(request,status,error){
                  	        	console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
                  	       }
                  	        
                  	    });
                    }

                      
                    </script>
                    
                    <ul id="fbreply" class="cmt_con">
<!--                        <li>
                            <div>
                                <h4>user : asdf123</h4><span>2020.08.16. 12:12:00</span>
                            </div>
                            <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                            <button>대댓글</button>
                            <div class="Subcmt_form">
                                <form action="" method="">
                                    <fieldset>
                                        <div class="cmt_form">
                                            <div class="cmt_body">
							<textarea name="" style="resize: none; width:100%; min-height:100px; max-height:100px;" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
                                            <div class="cmt_ok"><input type="submit" value="등록"></div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h4>user : asdf123</h4><span>2020.08.16. 12:12:00</span>
                            </div>
                            <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                            <button>대댓글</button>
                            <div class="Subcmt_form">
                                 <div>
                                    <h4>user : asdf123</h4><span>2020.08.16. 12:12:00</span>
                                </div>
                                <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h4>user : asdf123</h4><span>2020.08.16. 12:12:00</span>
                            </div>
                            <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                            <button>대댓글</button>
                        </li>  -->
                    </ul>
                    <button class="cmt_in">댓글 더보기 <i class="glyphicon glyphicon-menu-right"></i></button>
                </div>
            </div>
            <!-- 상세 끝 -->

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>