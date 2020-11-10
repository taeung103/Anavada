# Anavada
중고물품 거래와 지역축제 공유로 소규모 지역 활성화를 목적으로 제작한 팀 프로젝트입니다.


# 구현 기능
<사용자>
* 사용자 / 관리자 로그인
* 회원가입
* 계정정보 찾기
* 계정정보 중복 검사
* 이메일 인증
* 사용자 마이페이지(나의 정보 변경) / 회원탈퇴

<관리자>
* 리스트 키워드 검색
* 전체회원 관리 리스트 / 회원 선택탈퇴
* 탈퇴회원 관리 리스트 / 회원DB 선택삭제
* 리스트 페이징
* 관리자 정보변경

* [Anavada/src/member](#https://github.com/taeung103/Anavada/src/member)
* [Anavada/src/admin/member/controller](#src/admin/member/controller)
* [Anavada/web/views/member](Anavada/web/views/member)
* [Anavada/web/views/admin/member](Anavada/web/views/admin/member)


# 상세기능 설명
<사용자>
* 로그인 / 로그인 제한 여부
* 회원가입
* 회원정보 찾기
* 마이페이지 / 나의 정보수정

<관리자>
* 전체회원 리스트 및 정보표시 / 신고여부
* 탈퇴회원 리스트 및 정보표시 / 탈퇴여부
* 관리자 정보변경

<공통>
* 리스트 키워드 검색
* 게시판 페이징
* 회원탈퇴 or 회원DB 삭제 Ajax 처리
* 이메일인증 SHA256 / 계정정보 중복검사
* 사용자가 서비스를 이용할 때 발생할 수 있는 오류 문구 alert창 출력


# 개발환경
* Java | JSP
* HTML | CSS | JavaScript | jQery 3.5.1
* Oracle Database 11g | SQL
* Git | SourceTree
* apache-tomcat-8.5.57
