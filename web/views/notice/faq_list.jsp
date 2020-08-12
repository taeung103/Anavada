<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>
    
    <style type="text/css">
    input[type="radio"] { display:none; }
    input[type="radio"] + label { display:inline-block;padding:20px;background:#ccc;color:#999;font-size:14px;cursor:pointer; }
    input[name="tabmenu"]:checked + label { background:#aaa;color:#000; }
    
    .conbox { width:500px;margin:0 auto;display:none; }
	input[id="tab01"]:checked ~ .con1 { display:block; }
	input[id="tab02"]:checked ~ .con2 { display:block; }
	input[id="tab03"]:checked ~ .con3 { display:block; }
	input[id="tab04"]:checked ~ .con4 { display:block; }
	input[id="tab05"]:checked ~ .con5 { display:block; }
	
	
	/* input[id*="answer"] { display:none; } */
	input[id*="answer"] + label {
		display:block;
	 	padding:20px;
		border:1px solid #232188;
		border-bottom:0;
		color:#fff;
		font-weight:900;
		background:#3634a5;
		cursor:pointer;
	}
	input[id*="answer"] + label + div {
		max-height:0;
		transition: all .35s;
		overflow:hidden;
		background:#ebf8ff;
		font-size:11px; 
	} 
	 input[id*="answer"] + label + div p {
		display:inline-block;
		padding:20px;
	}
	input[id*="answer"]:checked + label + div { max-height:100px; } /**/
    </style>
    
    <script type="text/javascript">
    $(function(){
    	$("input[name=tabmenu]").each(function(index){
    		$(this).click(function(){
    			category = $(this).val();
    			$.ajax({
    				url: "/anavada/fselect",
    				type: "get",
    				data: { "category":category },
    				dataType: "json",
    				success: function(data){
    					
    					var jsonStr = JSON.stringify(data);
    					var json = JSON.parse(jsonStr);
    					
    					var values = "";
    					for(var i in json.list){
    							
    						values += "<input type='radio' name='accordion' id='answer"+ json.list[i].no +"'><label for='answer"
    								+ json.list[i].no +"'>"+ decodeURIComponent(json.list[i].title).replace(/\+/gi, " ")
    								+"</label><div><p>"+ decodeURIComponent(json.list[i].content).replace(/\+/gi, " ") +"</p></div>";
                			
    					} //for in
    					switch(category){
    					case "회원정보" : $("#t02").html(values); break;
    					case "중고거래" : $("#t03").html(values); break;
    					case "커뮤니티" : $("#t04").html(values); break;
    					case "지역축제" : $("#t05").html(values); break;
    					}
    				},
    				error: function(a,b,c){
    					console.log(c);
    				}
    			}); //ajax;
    		}); //click;
    	}); //each;
    });
    
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
            <br><br><br>
            <div class="tab_content" align="center">
            	<input type="radio" name="tabmenu" id="tab01" checked> <!-- value="전체"> -->
            	<label for="tab01">전체</label>
            	<input type="radio" name="tabmenu" id="tab02" value="회원정보">
            	<label for="tab02">회원정보</label>
            	<input type="radio" name="tabmenu" id="tab03" value="중고거래">
            	<label for="tab03">중고거래</label>
            	<input type="radio" name="tabmenu" id="tab04" value="커뮤니티">
            	<label for="tab04">커뮤니티</label>
            	<input type="radio" name="tabmenu" id="tab05" value="지역축제">
            	<label for="tab05">지역축제</label>
            	<br><br><br>
            	
            	<div class="conbox con1" id="t01">
            	 	<div class="open" id="open">
            		<% for(Faq f : list) { %>
            			<input type="radio" name="accordion" id="Fanswer<%= f.getFaqNo() %>">
            			<label for="Fanswer<%= f.getFaqNo() %>"><%= f.getFaqTitle() %></label>
            			<div><p><%= f.getFaqContent() %></p></div>
            		<% } %></div>
            	</div>
            	<div class="conbox con2" id="t02"></div>
            	<div class="conbox con3" id="t03"></div>
            	<div class="conbox con4" id="t04"></div>
            	<div class="conbox con5" id="t05"></div>
            </div>
            <br><br><br>
            
            
                    
          </div>  
        <%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>