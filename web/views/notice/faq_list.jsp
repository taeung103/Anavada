<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>

 	 <script type="text/javascript">
 	 function slideContent(){
        $(function(){
            var qna = $(".qna_list .question");
            var i;
            for (i=0; i < qna.length; i++){
                qna.eq(i).click(function(){
                    qna.removeClass("active");
                    $(this).toggleClass("active");
                    qna.next().css("display","none");
                    $(this).next(".ctn").slideToggle(300);
                })            
            }
        });}
    </script> 
    <script type="text/javascript">
        $(function(){
            $('.faqTap a').click(function(){
                var tab_data = $(this).attr('data-tab');

                $('.faqTap a').removeClass('active');
                $('.qna_list').removeClass('on');

                $(this).addClass('active');
                $("#" + tab_data).addClass('on');
            })
        });
    </script> 
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#faqCategory>a").each(function(){
    			$(this).click(function(){
    				category = $(this).text();
    				//alert(category+"가 선택되었습니다");
    				$("faqCategory>a").removeAttr("class")
    				$(this).attr("class","active");
    				$.ajax({
    					url: "/anavada/fselect",
    					type: "get",
    					data: { "category":category },
    					dataType: "json",
    					success: function(data){
    							console.log(category);
    						//object ==> string으로 변환
    						var jsonStr = JSON.stringify(data);
    						//string ==> json객체로 바꿈
    						var json = JSON.parse(jsonStr);
    						
    						var values = "";
    						for(var i in json.list){
    							values += "<ul class='question' onclick='slideContent();'><li class='Qmarker'><span>Q</span></li><li class='title'>";
    							
    							switch(json.list[i].cate){
    							case 1 : values += "<span class='Msel'>회원정보</span>"; break;
        						case 2 : values += "<span class='Psel'>중고거래</span>"; break;
        						case 3 : values += "<span class='Csel'>커뮤니티</span>"; break;
        						case 4 : values += "<span class='Esel'>지역축제</span>"; break;
    							}
    							
    							values += decodeURIComponent(json.list[i].title).replace(/\+/gi, " ") 
    									+ "</li><li>관리자</li><li>" + json.list[i].date + "</li></ul><ul class='ctn'><li class='Amarker'><span>A</span></li><li><h4>답변</h4><p>" 
    									+ decodeURIComponent(json.list[i].content).replace(/\+/gi, " ") 
    									+ "</p></li></ul>";
    									
    						} //for in
    						switch(category){
    						case "전체" : $("#tab01").html(values); break;
    						case "회원정보" : $("#tab02").html(values); break;
    						case "중고거래" : $("#tab03").html(values); break;
    						case "커뮤니티" : $("#tab04").html(values); break;
    						case "지역축제" : $("#tab05").html(values); break;
    						}
    					},
    					error: function(a,b,c){
    						console.log(c);
    					}
    				});
    			})
    		})
    	})
    </script>
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
                            <li class="glyphicon glyphicon-menu-right"><a href="#none">FAQ</a></li>
                        </ul>
                    </div>
                    <h2><span>FAQ</span></h2>
                    <h3>자주하는 질문/답변 공간입니다.</h3>
                </div>
            </div>
            <!--서브 비주얼/타이틀 끝-->

            <!-- 리스트 -->
            <div class="list-area">
                <div class="faqTap" id="faqCategory">
                    <a href="#none" class="active" data-tab="tab01">전체</a>
                    <a href="#none" data-tab="tab02">회원정보</a>
                    <a href="#none" data-tab="tab03">중고거래</a>
                    <a href="#none" data-tab="tab04">커뮤니티</a>
                    <a href="#none" data-tab="tab05">지역축제</a>
                </div>
                <!--종류 리스트-->
                <div class="sort-area" style="margin-top:30px;">  
                    <div>
                        <form action="" method="" id="">
                            목록 분류 : <select name="" class="ListSelect">
                                    <option value="분류 선택" selected="selected">분류 선택</option>
                                    <option value="제목">제목</option>
                                    <option value="내용">내용</option>
                            </select>
                            
                            <input type="text" placeholder="검색어를 입력해주세요.">
                            <button class="top-search"><i class="xi-search"></i></button>
                        </form>
                    </div>
                </div>
                
                
                 
                
                
                
                
                <div class="qna_list">
                <% if(list != null) { %>
                <% for(Faq f : list) { %>
                	<ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title">
                        <% switch(f.getFaqCategory()) { 
    							case 1 : %><span class='Msel'>회원정보</span><%break;
        						case 2 : %><span class='Psel'>중고거래</span><%break;
        						case 3 : %><span class='Csel'>커뮤니티</span><%break;
        						case 4 : %><span class='Esel'>지역축제</span><%break; } %>
                        	<%= f.getFaqTitle() %></li>
                        <li>관리자</li>
                        <li><%= f.getFaqDate() %></li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p><%= f.getFaqContent() %></p>
                        </li>
                    </ul>
                <% } } %>
                </div>
                
                <div class="qna_list" id="tab02">
                </div>
                
                <div class="qna_list" id="tab03">
                </div>
                
                <div class="qna_list" id="tab04">
                </div>
                
                <div class="qna_list" id="tab05">
                </div>
                

                </div>
                
            </div>
            <!-- 리스트 끝 -->
<br><br><br><br><br><br>

        </div>
        <!-- 컨텐츠 끝 -->

        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>