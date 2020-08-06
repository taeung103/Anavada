<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp" %>

    <script type="text/javascript">
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
        });
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
                <div class="faqTap">
                    <a href="#none" class="active" data-tab="tab01">전체</a>
                    <a href="#none" data-tab="tab02">회원정보</a>
                    <a href="#none" data-tab="tab03">중고거래</a>
                    <a href="#none" data-tab="tab04">커뮤니티</a>
                    <a href="#none" data-tab="tab05">지역축제</a>
                </div>
                <!--종류 리스트-->
                <div class="sort-area" style="margin-top:30px;">  
                    <h4>전체 150개</h4>
                    <a href="faq_write.jsp" class="write_btn">글쓰기</a>
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
                
                <div class="qna_list on" id="tab01">
                    <ul class="question active">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn first_ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div class="qna_list" id="tab02">
                    <ul class="question active">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn first_ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Msel">회원정보</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div class="qna_list" id="tab03">
                    <ul class="question active">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn first_ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Psel">중고거래</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div class="qna_list" id="tab04">
                    <ul class="question active">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn first_ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Csel">커뮤니티</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                </div>
                <div class="qna_list" id="tab05">
                    <ul class="question active">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn first_ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                    <ul class="question">
                        <li class="Qmarker"><span>Q</span></li>
                        <li class="title"><span class="Esel">지역축제</span>아이디/비밀번호는 어디서 찾나요?</li>
                        <li>관리자</li>
                        <li>2020.07.31</li>
                    </ul>
                    <ul class="ctn">
                        <li class="Amarker"><span>A</span></li>
                        <li>
                            <h4>답변</h4>
                            <p>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.<br/>아이디/비밀번호는 로그인 > 회원정보 찾기를 통해 찾으실 수 있습니다.</p>
                        </li>
                    </ul>
                </div>
                
                <div class="write-btn">
                    <a href="faq_write.jsp">글쓰기</a>
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