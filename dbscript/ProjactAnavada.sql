--**********************************************************************************************************************
-- MEMBER 테이블 삭제
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    MEMBER_ID VARCHAR2(20) CONSTRAINT PKID PRIMARY KEY NOT NULL,
    MEMBER_PWD VARCHAR2(20) CONSTRAINT MPWD NOT NULL,
    MEMBER_NAME VARCHAR2(20) CONSTRAINT MNAME NOT NULL,
    PROFILE_ORIGINAL VARCHAR2(50),
    PROFILE_RENAME VARCHAR2(50),
    MEMBER_EMAIL VARCHAR2(20) CONSTRAINT MEMAIL NOT NULL,
    EMAILAUTH VARCHAR2(20) CONSTRAINT MAUTH NOT NULL,
    MEMBER_PHONE VARCHAR2(15) CONSTRAINT MPHONE NOT NULL,
    JOIN_DATE DATE DEFAULT SYSDATE,
    LAST_ACCESS_DATE DATE DEFAULT SYSDATE
);

-- MEMBER 컬럼명
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 패스워드';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름';
COMMENT ON COLUMN MEMBER.PROFILE_ORIGINAL IS '첨부파일기존명';
COMMENT ON COLUMN MEMBER.PROFILE_RENAME IS '첨부파일변경명';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER.EMAILAUTH IS '이메일인증';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '회원 전화번호';
COMMENT ON COLUMN MEMBER.JOIN_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.LAST_ACCESS_DATE IS '최근접속일';

INSERT INTO MEMBER VALUES('admin', 'YWRtaW4=', '공태웅', NULL, NULL, 'spark1048@naver.com', 'SHA1', '010-3387-7583', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('user01', 'dXNlcjAx', '이순신', NULL, NULL, 'user01@naver.com', 'SHA2', '010-1111-1111', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('user02', 'dXNlcjAy', '권율', NULL, NULL, 'user02@naver.com', 'SHA3', '010-2222-2222', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('user03', 'dXNlcjAz', '김시민', NULL, NULL, 'user03@naver.com', 'SHA4', '010-3333-3333', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('user08', 'dXNlcjA4', '공태웅', NULL, NULL, 'taeung103@naver.com', 'SHA5', '010-3387-7583', DEFAULT, DEFAULT);


-- SECESSION 테이블 삭제
DROP TABLE SECESSION CASCADE CONSTRAINTS;
-- SECESSION 테이블 생성
CREATE TABLE SECESSION (
    SECESSION_ID VARCHAR2(20) CONSTRAINT SMID PRIMARY KEY NOT NULL,
    SECESSION_PWD VARCHAR2(20) CONSTRAINT SMPWD NOT NULL,
    SECESSION_NAME VARCHAR2(20) CONSTRAINT SMNAME NOT NULL,
    SECESSION_EMAIL VARCHAR2(20) CONSTRAINT SMEMAIL NOT NULL UNIQUE,
    SECESSION_PHONE VARCHAR2(15) CONSTRAINT SMPHONE NOT NULL UNIQUE,
    MJOIN_DATE DATE DEFAULT SYSDATE,
    SECESSION_DATE DATE DEFAULT SYSDATE
);

-- SECESSION 컬럼명
COMMENT ON COLUMN SECESSION.SECESSION_ID IS '탈퇴회원 아이디';
COMMENT ON COLUMN SECESSION.SECESSION_PWD IS '탈퇴회원 패스워드';
COMMENT ON COLUMN SECESSION.SECESSION_NAME IS '탈퇴회원 이름';
COMMENT ON COLUMN SECESSION.SECESSION_EMAIL IS '탈퇴회원 이메일';
COMMENT ON COLUMN SECESSION.SECESSION_PHONE IS '탈퇴회원 전화번호';
COMMENT ON COLUMN SECESSION.MJOIN_DATE IS '가입일';
COMMENT ON COLUMN SECESSION.SECESSION_DATE IS '탈퇴일';

INSERT INTO SECESSION VALUES('user06', 'user06', '곽재우', 'user06@naver.com', '010-6666-6666', DEFAULT, DEFAULT);
INSERT INTO SECESSION VALUES('user07', 'user07', '신립', 'user07@naver.com', '010-7777-7777', DEFAULT, DEFAULT);

COMMIT;

--**********************************************************************************************************************


-- 테이블 삭제
DROP TABLE BANNER  CASCADE CONSTRAINTS;
-- 배너 관리 테이블 생성
CREATE TABLE BANNER (
	BANNER_NO	 NUMBER CONSTRAINT PK_BA PRIMARY KEY,
	BANNER_TITLE	VARCHAR2(50),	 
	BANNER_CHK	CHAR(1)	DEFAULT 'H',
	BANNER_OK	CHAR(1)	DEFAULT 'Y',	
	BANNER_ORIGINAL	VARCHAR2(50),
	BANNER_RENAME	VARCHAR2(50),
	BANNER_SIZE	VARCHAR2(20),
    CONSTRAINT CHK_BAO CHECK (BANNER_OK IN ('Y','N')),
    CONSTRAINT CHK_BAC CHECK (BANNER_CHK IN ('H','W'))
);

COMMENT ON COLUMN "BANNER"."BANNER_NO" IS '글번호';
COMMENT ON COLUMN "BANNER"."BANNER_TITLE" IS '배너제목';
COMMENT ON COLUMN "BANNER"."BANNER_CHK" IS '게시배너관리';
COMMENT ON COLUMN "BANNER"."BANNER_OK" IS '게시여부확인';
COMMENT ON COLUMN "BANNER"."BANNER_ORIGINAL" IS '원본파일명';
COMMENT ON COLUMN "BANNER"."BANNER_RENAME" IS '바뀐파일명';
COMMENT ON COLUMN "BANNER"."BANNER_SIZE" IS '사이즈';


-- 테이블 삭제
DROP TABLE DECLARE_ADMIN CASCADE CONSTRAINTS;
-- 신고자 관리 테이블 생성
CREATE TABLE DECLARE_ADMIN (
	DECLARE_NO NUMBER	 CONSTRAINT PK_DNO PRIMARY KEY,
	DECLARE_ID	VARCHAR2(20)		CONSTRAINT NN_ID NOT NULL,
	DECLARE_COUNT	NUMBER		CONSTRAINT NN_COUNT  NOT NULL,
	DECLARE_OK CHAR(1)	DEFAULT 'N'	CONSTRAINT NN_OK NOT NULL,
    CONSTRAINT CHK_DOK CHECK (DECLARE_OK IN ('Y','N'))
);

COMMENT ON COLUMN "DECLARE_ADMIN"."DECLARE_NO" IS '순번';
COMMENT ON COLUMN "DECLARE_ADMIN"."DECLARE_ID" IS '신고회원';
COMMENT ON COLUMN "DECLARE_ADMIN"."DECLARE_COUNT" IS '신고당한 횟수';
COMMENT ON COLUMN "DECLARE_ADMIN"."DECLARE_OK" IS '제한설정';

ALTER TABLE DECLARE_ADMIN ADD CONSTRAINT FK_DECLARE_ID FOREIGN KEY(DECLARE_ID) REFERENCES MEMBER(MEMBER_ID);

INSERT INTO DECLARE_ADMIN VALUES(1, 'user05', 2, 'N');
INSERT INTO DECLARE_ADMIN VALUES(2, 'user01', 1, 'N');
INSERT INTO DECLARE_ADMIN VALUES(3, 'user03', 4, 'N');

COMMIT;

-- 제한 설정된 멤버 아이디 조회시 사용할 쿼리문
SELECT MEMBER_ID, DECLARE_OK FROM MEMBER 
LEFT JOIN DECLARE_ADMIN ON(MEMBER_ID = DECLARE_ID)
where declare_ok='Y';

INSERT INTO BANNER
VALUES(1, '우주', DEFAULT, DEFAULT, 'MAIIN.jpg', '', '1080x350' );
INSERT INTO BANNER
VALUES(2, 'sky', DEFAULT, DEFAULT, 'sky.jpg', '', '1080x350' );
INSERT INTO BANNER
VALUES(3, 'bless', DEFAULT, DEFAULT, 'visual.jpg', '', '1920x740' );

COMMIT;


-- 기존에 있던 지역관련 DB삭제
DROP TABLE FBOARD_COMMENT CASCADE CONSTRAINTS;    --테이블 삭제
DROP TABLE FESTIVAL_INFORMATION CASCADE CONSTRAINTS;    -- 축제 정보

-- 지역 분류
DROP TABLE LOCATION CASCADE CONSTRAINTS;    --테이블 삭제

CREATE TABLE LOCATION (
	local_no	VARCHAR2(3)		NOT NULL,   -- PK
	local_name	VARCHAR2(20)		NOT NULL,
	kmap_y	VARCHAR2(30)		NULL,
    kmap_x	VARCHAR2(30)		NULL,
    CONSTRAINT PK_local_no PRIMARY KEY (local_no)
);

COMMENT ON COLUMN LOCATION.local_no IS '지역번호';
COMMENT ON COLUMN LOCATION.local_name IS '지역이름(구)';
COMMENT ON COLUMN LOCATION.kmap_y IS '지역별 중심 위치 위도';
COMMENT ON COLUMN LOCATION.kmap_x IS '지역별 중심 위치 경도';

-- 지역 데이터 삽입
INSERT INTO LOCATION(local_no, local_name, kmap_y, kmap_x)
SELECT '1', '강남구', '37.4959854', '127.0664091' FROM DUAL UNION ALL
SELECT '2', '강동구', '37.5492077', '127.1464824' FROM DUAL UNION ALL
SELECT '3', '강북구', '37.6469954', '127.0147158' FROM DUAL UNION ALL
SELECT '4', '강서구', '37.5657617', '126.8226561' FROM DUAL UNION ALL
SELECT '5', '관악구', '37.4653993', '126.9438071' FROM DUAL UNION ALL
SELECT '6', '광진구', '37.5481445', '127.0857528' FROM DUAL UNION ALL
SELECT '7', '구로구', '37.4954856', '126.858121' FROM DUAL UNION ALL
SELECT '8', '금천구', '37.4600969', '126.9001546' FROM DUAL UNION ALL
SELECT '9', '노원구', '37.655264', '127.0771201' FROM DUAL UNION ALL
SELECT '10', '도봉구', '37.6658609', '127.0317674' FROM DUAL UNION ALL
SELECT '11', '동대문구', '37.5838012', '127.0507003' FROM DUAL UNION ALL
SELECT '12', '동작구', '37.4965037', '126.9443073' FROM DUAL UNION ALL
SELECT '13', '마포구', '37.5622906', '126.9087803' FROM DUAL UNION ALL
SELECT '14', '서대문구', '37.5820369', '126.9356665' FROM DUAL UNION ALL
SELECT '15', '서초구', '37.4769528', '127.0378103' FROM DUAL UNION ALL
SELECT '16', '성동구', '37.5506753', '127.0409622' FROM DUAL UNION ALL
SELECT '17', '성북구' ,'37.606991', '127.0232185' FROM DUAL UNION ALL
SELECT '18', '송파구' ,'37.5048534', '127.1144822' FROM DUAL UNION ALL
SELECT '19', '양천구', '37.5270616', '126.8561534' FROM DUAL UNION ALL
SELECT '20', '영등포구', '37.520641', '126.9139242' FROM DUAL UNION ALL
SELECT '21', '용산구', '37.5311008', '126.9810742' FROM DUAL UNION ALL
SELECT '22', '은평구', '37.6176125', '126.9227004' FROM DUAL UNION ALL
SELECT '23', '종로구', '37.5990998', '126.9861493' FROM DUAL UNION ALL
SELECT '24', '중구', '37.5579452', '126.9941904' FROM DUAL UNION ALL
SELECT '25', '중랑구', '37.5953795', '127.0939669' FROM DUAL;

COMMIT;


-- 축제 게시판
DROP TABLE FBOARD CASCADE CONSTRAINTS;    -- 테이블 삭제

CREATE TABLE FBOARD (
	fboard_no	VARCHAR2(30)		NOT NULL,   -- PK
    festival_title	VARCHAR2(600)		NOT NULL,
    local_no	VARCHAR2(3)		NOT NULL,
    festival_startdate	VARCHAR2(8),
	festival_enddate	VARCHAR2(8),
    festival_modifieddate	VARCHAR2(20),
    map_y	VARCHAR2(30),
	map_x	VARCHAR2(30),
	bmodify_date	DATE	DEFAULT SYSDATE	,
    MEMBER_ID	VARCHAR2(20)	,    -- FK : MEMBER(MEMBER_ID)
	readcount	NUMBER	DEFAULT 0 	NULL,
	THUMBNAIL VARCHAR2(100 BYTE) DEFAULT 'NoImage', 
    CONSTRAINT PK_fboard_no PRIMARY KEY (fboard_no)
);

COMMENT ON COLUMN FBOARD.fboard_no IS '축제게시판 번호';
COMMENT ON COLUMN FBOARD.festival_title IS '축제 이름';
COMMENT ON COLUMN FBOARD.local_no IS '지역 번호';
COMMENT ON COLUMN FBOARD.festival_startdate IS '축제 시작일';
COMMENT ON COLUMN FBOARD.festival_enddate IS '축제 종료일';
COMMENT ON COLUMN FBOARD.festival_modifieddate IS '축제 수정일';
COMMENT ON COLUMN FBOARD.map_y IS '축제 위도';
COMMENT ON COLUMN FBOARD.map_x IS '축제 경도';
COMMENT ON COLUMN FBOARD.bmodify_date IS '축제게시판 수정일';
COMMENT ON COLUMN FBOARD.MEMBER_ID IS '작성자';
COMMENT ON COLUMN FBOARD.readcount IS '조회수';
COMMENT ON COLUMN FBOARD.Thumbnail IS '썸네일';


-- 축제 게시판 댓글
DROP TABLE FBOARD_REPLY CASCADE CONSTRAINTS;    -- 테이블 삭제

CREATE TABLE FBOARD_REPLY (
	fboardReply_no 	NUMBER	NOT NULL,   -- PK
	fboard_no	VARCHAR2(30)		NOT NULL,   -- FK : FBOARD(fboard_no), 게시물 번호
	MEMBER_ID	VARCHAR2(20),   --작성자 아이디
    fboardReply_content VARCHAR2(4000) NOT NULL, --댓글 내용
    fboardReply_lev NUMBER NOT NULL,    -- 댓글 (1), 대댓글 (2)
    fboardReply_ref NUMBER,    -- 참조 댓글 번호 댓글이 1일때는 자기번호
	fboardReply_creatdate	VARCHAR2(40) 	NOT NULL,   --댓글 작성날짜
    CONSTRAINT PK_fboardReply_no PRIMARY KEY (fboardReply_no)
);

COMMENT ON COLUMN FBOARD_REPLY.fboardReply_no IS '댓글 번호';
COMMENT ON COLUMN FBOARD_REPLY.fboard_no IS '게시판 번호';
COMMENT ON COLUMN FBOARD_REPLY.MEMBER_ID IS '작성자 id';
COMMENT ON COLUMN FBOARD_REPLY.fboardReply_content IS '댓글 내용';
COMMENT ON COLUMN FBOARD_REPLY.fboardReply_lev IS '글레벨';
COMMENT ON COLUMN FBOARD_REPLY.fboardReply_ref IS '부모 댓글번호';
COMMENT ON COLUMN FBOARD_REPLY.fboardReply_creatdate IS '댓글 작성날짜';

-- fboardReply_no 전용 시퀀스 생성
CREATE SEQUENCE FBREPLY_SEQ INCREMENT BY 1 START WITH 1;

-- FK설정
ALTER TABLE FBOARD ADD CONSTRAINT FK_local_no FOREIGN KEY(local_no) REFERENCES LOCATION(local_no);    -- LOCATION(local_no);
ALTER TABLE FBOARD ADD CONSTRAINT FK_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID); -- MEMBER(MEMBER_ID); 
ALTER TABLE FBOARD_REPLY ADD CONSTRAINT FK_fboard_no FOREIGN KEY(fboard_no) REFERENCES FBOARD(fboard_no) ON DELETE CASCADE;   -- FBOARD(fboard_no),  축제 게시판 삭제 시 댓글도 삭제

--oracle sessions 수 늘리기
--show parameter processes;
--alter system set processes=300 scope=spfile;

-- 축제 정보 데이터 넣기 X

-- 게시판 정보 넣기 X

--**********************************************************************************************************************

--커뮤니티
DROP SEQUENCE CBOARD_SEQ;
DROP SEQUENCE CREPLY_SEQ;
DROP TABLE CBOARD CASCADE CONSTRAINTS;
DROP TABLE CREPLY CASCADE CONSTRAINTS;

CREATE SEQUENCE CBOARD_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE CREPLY_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE TABLE CBOARD (
	"CBOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"CBOARD_TITLE"	VARCHAR2(50)		NOT NULL,
	"CBOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CBOARD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CBOARD_LASTMODIFIED"	DATE	DEFAULT SYSDATE	NULL,
	"CBOARD_VIEWCOUNT"	NUMBER	DEFAULT 0	NULL,
	"CBOARD_REPLYCOUNT"	NUMBER	DEFAULT 0	NULL,
	"CBOARD_LIKECOUNT"	NUMBER	DEFAULT 0	NULL,
	"CBOARD_REPORTCOUNT"	NUMBER	DEFAULT 0	NULL,
	"CBOARD_DISPLAY"	CHAR(1)	DEFAULT 'Y'	NULL,
	"LOCAL_NO"	VARCHAR2(3)		NOT NULL,
	"CFILES_ORIGINAL_FILEPATH1"	VARCHAR2(50)		NULL,
	"CFILES_RENAME_FILEPATH1"	VARCHAR2(50)		NULL,
	"CFILES_ORIGINAL_FILEPATH2"	VARCHAR2(50)		NULL,
	"CFILES_RENAME_FILEPATH2"	VARCHAR2(50)		NULL,
	"CFILES_ORIGINAL_FILEPATH3"	VARCHAR2(50)		NULL,
	"CFILES_RENAME_FILEPATH3"	VARCHAR2(50)		NULL,
	"CFILES_ORIGINAL_FILEPATH4"	VARCHAR2(50)		NULL,
	"CFILES_RENAME_FILEPATH4"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "CBOARD"."CBOARD_NO" IS '글번호';
COMMENT ON COLUMN "CBOARD"."MEMBER_ID" IS '회원 아이디';
COMMENT ON COLUMN "CBOARD"."CBOARD_TITLE" IS '글제목';
COMMENT ON COLUMN "CBOARD"."CBOARD_CONTENT" IS '글내용';
COMMENT ON COLUMN "CBOARD"."CBOARD_DATE" IS '작성일';
COMMENT ON COLUMN "CBOARD"."CBOARD_LASTMODIFIED" IS '마지막수정일';
COMMENT ON COLUMN "CBOARD"."CBOARD_VIEWCOUNT" IS '조회수';
COMMENT ON COLUMN "CBOARD"."CBOARD_REPLYCOUNT" IS '댓글수';
COMMENT ON COLUMN "CBOARD"."CBOARD_LIKECOUNT" IS '좋아요수';
COMMENT ON COLUMN "CBOARD"."CBOARD_REPORTCOUNT" IS '신고수';
COMMENT ON COLUMN "CBOARD"."CBOARD_DISPLAY" IS '글표시여부';
COMMENT ON COLUMN "CBOARD"."LOCAL_NO" IS '지역번호';
COMMENT ON COLUMN "CBOARD"."CFILES_ORIGINAL_FILEPATH1" IS '기존파일명1';
COMMENT ON COLUMN "CBOARD"."CFILES_RENAME_FILEPATH1" IS '변경파일명1';
COMMENT ON COLUMN "CBOARD"."CFILES_ORIGINAL_FILEPATH2" IS '기존파일명2';
COMMENT ON COLUMN "CBOARD"."CFILES_RENAME_FILEPATH2" IS '변경파일명2';
COMMENT ON COLUMN "CBOARD"."CFILES_ORIGINAL_FILEPATH3" IS '기존파일명3';
COMMENT ON COLUMN "CBOARD"."CFILES_RENAME_FILEPATH3" IS '변경파일명3';
COMMENT ON COLUMN "CBOARD"."CFILES_ORIGINAL_FILEPATH4" IS '기존파일명4';
COMMENT ON COLUMN "CBOARD"."CFILES_RENAME_FILEPATH4" IS '변경파일명4';

CREATE TABLE CREPLY (
	"CREPLY_NO"	NUMBER		NOT NULL,
	"CBOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"CREPLY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CREPLY_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"PARANT_REPLY"	NUMBER		NULL,
	"CREPLY_DEPTH"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "CREPLY"."CREPLY_NO" IS '댓글번호';
COMMENT ON COLUMN "CREPLY"."CBOARD_NO" IS '글번호';
COMMENT ON COLUMN "CREPLY"."MEMBER_ID" IS '회원 아이디';
COMMENT ON COLUMN "CREPLY"."CREPLY_DATE" IS '작성일';
COMMENT ON COLUMN "CREPLY"."CREPLY_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "CREPLY"."PARANT_REPLY" IS '부모댓글번호';
COMMENT ON COLUMN "CREPLY"."CREPLY_DEPTH" IS '댓글깊이';

ALTER TABLE CBOARD ADD CONSTRAINT PK_CBOARD PRIMARY KEY (CBOARD_NO);
ALTER TABLE CREPLY ADD CONSTRAINT PK_CREPLY PRIMARY KEY (CREPLY_NO);
ALTER TABLE CBOARD ADD CONSTRAINT CHK_COBARD_DISPLAY CHECK (CBOARD_DISPLAY IN ('Y', 'N'));
ALTER TABLE CREPLY ADD CONSTRAINT CHK_CREPLY_DEPTH CHECK (CREPLY_DEPTH IN (1, 2));
ALTER TABLE "CBOARD" ADD CONSTRAINT "FK_MEMBER_TO_CBOARD" FOREIGN KEY(MEMBER_ID)REFERENCES MEMBER (MEMBER_ID);
ALTER TABLE "CBOARD" ADD CONSTRAINT "FK_LOCATION_TO_CBOARD" FOREIGN KEY (LOCAL_NO)REFERENCES LOCATION (LOCAL_NO);
ALTER TABLE "CREPLY" ADD CONSTRAINT "FK_CBOARD_TO_CREPLY" FOREIGN KEY (CBOARD_NO)REFERENCES CBOARD (CBOARD_NO);
ALTER TABLE "CREPLY" ADD CONSTRAINT "FK_MEMBER_TO_CREPLY" FOREIGN KEY (MEMBER_ID)REFERENCES MEMBER (MEMBER_ID);

commit;

-- sample data
INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '첫번째 게시글', '첫번째 내용', DEFAULT, 1);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '두번째 게시글', '두번째 내용', DEFAULT, 2);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '세번째 게시글', '세번째 내용', DEFAULT, 3);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '네번째 게시글', '네번째 내용', DEFAULT, 4);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '다섯번째 게시글', '다섯번째 내용', DEFAULT, 5);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '여섯번째 게시글', '여섯번째 내용', DEFAULT, 6);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '일곱번째 게시글', '일곱번째 내용', DEFAULT, 7);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '여덟번째 게시글', '여덟번째 내용', DEFAULT, 8);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '아홉번째 게시글', '아홉번째 내용', DEFAULT, 9);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '열번째 게시글', '열번째 내용', DEFAULT, 10);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '첫번째 게시글', '첫번째 내용', DEFAULT, 1);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '두번째 게시글', '두번째 내용', DEFAULT, 2);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '세번째 게시글', '세번째 내용', DEFAULT, 3);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '네번째 게시글', '네번째 내용', DEFAULT, 4);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '다섯번째 게시글', '다섯번째 내용', DEFAULT, 5);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '여섯번째 게시글', '여섯번째 내용', DEFAULT, 6);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '일곱번째 게시글', '일곱번째 내용', DEFAULT, 7);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user03', '여덟번째 게시글', '여덟번째 내용', DEFAULT, 8);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user01', '아홉번째 게시글', '아홉번째 내용', DEFAULT, 9);

INSERT INTO CBOARD(CBOARD_NO, MEMBER_ID, CBOARD_TITLE, CBOARD_CONTENT, CBOARD_DATE, LOCAL_NO) 
VALUES(CBOARD_SEQ.NEXTVAL, 'user02', '열번째 게시글', '열번째 내용', DEFAULT, 10);
-- sample data
INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 1, 'user01', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 2, 'user02', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 3, 'user03', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 4, 'user01', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 5, 'user02', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 6, 'user03', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 7, 'user01', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 8, 'user02', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 9, 'user03', DEFAULT, '첫번째 내용', DEFAULT);

INSERT INTO CREPLY(CREPLY_NO, CBOARD_NO, MEMBER_ID, CREPLY_DATE, CREPLY_CONTENT, CREPLY_DEPTH) 
VALUES(CREPLY_SEQ.NEXTVAL, 10, 'user01', DEFAULT, '첫번째 내용', DEFAULT);

commit;

--**********************************************************************************************************************

--중고거래파트
DROP TABLE JBOARD_COMMENT CASCADE CONSTRAINTS;
DROP TABLE JBOARD CASCADE CONSTRAINTS;


CREATE TABLE JBOARD (
	JBOARD_NO	NUMBER		NOT NULL,
	JBOARD_TITLE	VARCHAR2(50)		NOT NULL,
	JBOARD_CONTENT	VARCHAR2(4000)		NOT NULL,
	JBOARD_PRICE	NUMBER		NOT NULL,
	JBOARD_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	JBOARD_UPDATE	DATE	DEFAULT SYSDATE	NULL,
	JBOARD_COUNT	NUMBER	DEFAULT 0	NULL,
	JBOARD_LIKE	NUMBER	DEFAULT 0	NULL,
	JFILES_ORIGINAL_FILEPATH1	VARCHAR2(50)		NULL,
	JFILES_RENAME_FILEPATH1	VARCHAR2(50)		NULL,
	JFILES_ORIGINAL_FILEPATH2	VARCHAR2(50)		NULL,
	JFILES_RENAME_FILEPATH2	VARCHAR2(50)		NULL,
	JFILES_ORIGINAL_FILEPATH3	VARCHAR2(50)		NULL,
	JFILES_RENAME_FILEPATH3	VARCHAR2(50)		NULL,
	JFILES_ORIGINAL_FILEPATH4	VARCHAR2(50)		NULL,
	JFILES_RENAME_FILEPATH4	VARCHAR2(50)		NULL,
	JBOARD_CHECK	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	JBOARD_MEET CHAR(1)	DEFAULT 'N'	NULL,
	JBOARD_POST	CHAR(1)	DEFAULT 'N'	NULL,
	MEMBER_ID	VARCHAR2(20)		NOT NULL,
	local_no	VARCHAR2(3)		NOT NULL
);

COMMENT ON COLUMN JBOARD.JBOARD_NO IS '글번호';
COMMENT ON COLUMN JBOARD.JBOARD_TITLE IS '제목';
COMMENT ON COLUMN JBOARD.JBOARD_CONTENT IS '상품설명';
COMMENT ON COLUMN JBOARD.JBOARD_PRICE IS '가격';
COMMENT ON COLUMN JBOARD.JBOARD_DATE IS '작성일';
COMMENT ON COLUMN JBOARD.JBOARD_UPDATE IS '수정일';
COMMENT ON COLUMN JBOARD.JBOARD_COUNT IS '조회수';
COMMENT ON COLUMN JBOARD.JBOARD_LIKE IS '좋아요수';
COMMENT ON COLUMN JBOARD.JFILES_ORIGINAL_FILEPATH1 IS '첨부파일기존명1';
COMMENT ON COLUMN JBOARD.JFILES_RENAME_FILEPATH1 IS '첨부파일변경명1';
COMMENT ON COLUMN JBOARD.JFILES_ORIGINAL_FILEPATH2 IS '첨부파일기존명2';
COMMENT ON COLUMN JBOARD.JFILES_RENAME_FILEPATH2 IS '첨부파일변경명2';
COMMENT ON COLUMN JBOARD.JFILES_ORIGINAL_FILEPATH3 IS '첨부파일기존명3';
COMMENT ON COLUMN JBOARD.JFILES_RENAME_FILEPATH3 IS '첨부파일변경명3';
COMMENT ON COLUMN JBOARD.JFILES_ORIGINAL_FILEPATH4 IS '첨부파일기존명4';
COMMENT ON COLUMN JBOARD.JFILES_RENAME_FILEPATH4 IS '첨부파일변경명4';
COMMENT ON COLUMN JBOARD.JBOARD_CHECK IS '게시글표시여부';
COMMENT ON COLUMN JBOARD.JBOARD_MEET IS '직거래';
COMMENT ON COLUMN JBOARD.JBOARD_POST IS '우편거래';
COMMENT ON COLUMN JBOARD.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN JBOARD.local_no IS '지역번호';


ALTER TABLE JBOARD ADD CONSTRAINT PK_JBOARD PRIMARY KEY (JBOARD_NO);
ALTER TABLE JBOARD ADD CONSTRAINT FK_MEMBER_TO_JBOARD_1 FOREIGN KEY (MEMBER_ID)
REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE ;
ALTER TABLE JBOARD ADD CONSTRAINT FK_LOCATION_TO_JBOARD_1 FOREIGN KEY (local_no)
REFERENCES LOCATION (local_no);
COMMIT;
CREATE TABLE JBOARD_COMMENT (
	COMMENT_NO	NUMBER		NOT NULL,
	COMMENT_ID	VARCHAR2(20)		NOT NULL,
	COMMENT_DATE	DATE	DEFAULT SYSDATE	NOT NULL,
	COMMENT_CONTENT	VARCHAR2(1000)		NOT NULL,
	COMMENT_PARENT	NUMBER		NULL,
	COMMENT_LASTMODIFIED	DATE	DEFAULT SYSDATE	NULL,
	JBOARD_NO	NUMBER		NOT NULL,
	COMMENT_DEPTH	NUMBER		NULL,
	COMMENT_ORDER	NUMBER		NULL,
    COMMENT_LEVEL NUMBER DEFAULT 0,
    COMMENT_REF NUMBER,
    COMMENT_REPLY_REF NUMBER,
    COMMENT_REPLY_SEQ NUMBER DEFAULT 0
);

ALTER TABLE JBOARD_COMMENT ADD CONSTRAINT PK_BOARD_COMMENT PRIMARY KEY (COMMENT_NO);
ALTER TABLE JBOARD_COMMENT ADD CONSTRAINT FK_MEMBER_TO_JCOMMNET_1 FOREIGN KEY (COMMENT_ID)
REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE ;

COMMIT;

COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_NO IS '댓글번호';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_ID IS '댓글작성자';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_DATE IS '댓글작성일';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_CONTENT IS '댓글목록';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_PARENT IS '부모글';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_LASTMODIFIED IS '마지막수정일';
COMMENT ON COLUMN JBOARD_COMMENT.JBOARD_NO IS '글번호';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_DEPTH IS '댓글깊이';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_LEVEL IS '글레벨';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_REF IS '구분번호';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_REPLY_REF IS '답글번호';
COMMENT ON COLUMN JBOARD_COMMENT.COMMENT_REPLY_SEQ IS '답글순번';

CREATE SEQUENCE 
SEQ_JBOARD_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE 
NOCACHE;

COMMIT;
INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'글의제목1','글의내용',14000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목2','상품 설명 2',133000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목3','상품 설명 3',13000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목4','상품 설명 4',1300,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목5','상품 설명 5',100,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목5','상품 설명 5',133000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목6','상품 설명 6',233000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목7','상품 설명 7',533000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목8','상품 설명 8',132000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목9','상품 설명 9',33000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목10','상품 설명 10',333000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

INSERT INTO JBOARD VALUES
(SEQ_JBOARD_NO.nextval,'상품의 제목11','상품 설명 11',133000,SYSDATE,SYSDATE,DEFAULT,DEFAULT,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,DEFAULT,DEFAULT,DEFAULT,'admin01', 1);

-- 중고거래댓글
INSERT INTO JBOARD_COMMENT VALUES
(1,'admin01',SYSDATE,'이것이 댓글',1,SYSDATE,1,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(2,'admin01',SYSDATE,'이것이 댓글',2,SYSDATE,2,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(3,'admin01',SYSDATE,'이것이 댓글',3,SYSDATE,3,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(4,'admin01',SYSDATE,'이것이 댓글',4,SYSDATE,4,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(5,'admin01',SYSDATE,'이것이 댓글',5,SYSDATE,5,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(6,'admin01',SYSDATE,'이것이 댓글',6,SYSDATE,6,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(7,'admin01',SYSDATE,'이것이 댓글',7,SYSDATE,7,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(8,'admin01',SYSDATE,'이것이 댓글',8,SYSDATE,8,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(9,'admin01',SYSDATE,'이것이 댓글',9,SYSDATE,9,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(10,'admin01',SYSDATE,'이것이 댓글',1,SYSDATE,10,1,1,1,1,1,1);
INSERT INTO JBOARD_COMMENT VALUES
(11,'admin01',SYSDATE,'이것이 댓글',11,SYSDATE,11,1,1,1,1,1,1);

DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE IQTYPE CASCADE CONSTRAINTS;
DROP TABLE INQUIRY CASCADE CONSTRAINTS;
DROP TABLE ANSWER CASCADE CONSTRAINTS;

--****************************************************************************************************

--공지사항
CREATE TABLE NOTICE(
    NO_NO NUMBER,
    NO_ID VARCHAR2(20) NOT NULL,
    NO_TITLE VARCHAR2(50) NOT NULL,
    NO_CONTENT VARCHAR2(4000) NOT NULL,
    NO_DATE DATE DEFAULT SYSDATE,
    NO_COUNT NUMBER DEFAULT 0,
    NO_ORIGINAL VARCHAR2(50),
    NO_RENAME VARCHAR2(50),
    
    CONSTRAINT PK_NNO PRIMARY KEY (NO_NO),
    CONSTRAINT FK_NID FOREIGN KEY (NO_ID) REFERENCES MEMBER ON DELETE SET NULL
);
COMMENT ON COLUMN NOTICE.NO_NO IS '글번호';
COMMENT ON COLUMN NOTICE.NO_ID IS '관리자아이디';
COMMENT ON COLUMN NOTICE.NO_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NO_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NO_DATE IS '작성날짜';
COMMENT ON COLUMN NOTICE.NO_COUNT IS '조회수';
COMMENT ON COLUMN NOTICE.NO_ORIGINAL IS '오리지널파일';
COMMENT ON COLUMN NOTICE.NO_RENAME IS '리네임파일';

INSERT INTO NOTICE VALUES(1, 'admin', '공지사항 오픈입니다.', '공지사항이 드디어 오픈했습니다. 많이 이용해주세요~', '2020/06/30', 5, null, null);
INSERT INTO NOTICE VALUES(2, 'admin', '공지사항1', '중고거래할 때 주의해주세요~', '2020/07/01', 3, null, null);
INSERT INTO NOTICE VALUES(3, 'admin', '공지사항2', '커뮤니티에 글을 올릴 때 욕은 금지입니다~', '2020/07/03', 1, null, null);
INSERT INTO NOTICE VALUES(4, 'admin', '공지사항3', '신고를 당하면 블랙리스트에 올려질 수 있습니다. 주의해주세요', '2020/07/03', 6, null, null);
INSERT INTO NOTICE VALUES(5, 'admin', '공지사항4', '블랙리스트에 올려지면 로그인 제한이 있을 수 있습니다.', '2020/07/05', 10, null, null);
INSERT INTO NOTICE VALUES(6, 'admin', '공지사항5', '공지사항이 드디어 오픈했습니다. 많이 이용해주세요~', '2020/07/07', 5, null, null);
INSERT INTO NOTICE VALUES(7, 'admin', '공지사항6', '중고거래할 때 주의해주세요~', '2020/07/10', 3, null, null);
INSERT INTO NOTICE VALUES(8, 'admin', '공지사항7', '커뮤니티에 글을 올릴 때 욕은 금지입니다~', '2020/07/11', 1, null, null);
INSERT INTO NOTICE VALUES(9, 'admin', '공지사항8', '신고를 당하면 블랙리스트에 올려질 수 있습니다. 주의해주세요', '2020/07/13', 6, null, null);
INSERT INTO NOTICE VALUES(10, 'admin', '공지사항9', '블랙리스트에 올려지면 로그인 제한이 있을 수 있습니다.', '2020/07/20', 10, null, null);
INSERT INTO NOTICE VALUES(11, 'admin', '공지사항10', '공지사항이 드디어 오픈했습니다. 많이 이용해주세요~', '2020/07/25', 5, null, null);
INSERT INTO NOTICE VALUES(12, 'admin', '공지사항11', '중고거래할 때 주의해주세요~', '2020/07/26', 3, null, null);
INSERT INTO NOTICE VALUES(13, 'admin', '공지사항12', '커뮤니티에 글을 올릴 때 욕은 금지입니다~', '2020/07/24', 1, null, null);
INSERT INTO NOTICE VALUES(14, 'admin', '공지사항13', '신고를 당하면 블랙리스트에 올려질 수 있습니다. 주의해주세요', '2020/07/27', 6, null, null);
INSERT INTO NOTICE VALUES(15, 'admin', '공지사항14', '블랙리스트에 올려지면 로그인 제한이 있을 수 있습니다.', '2020/07/30', 10, null, null);

--자주묻는질문
CREATE TABLE FAQ(
    FAQ_NO NUMBER,
    FAQ_ID VARCHAR2(20) NOT NULL,
    FAQ_TITLE VARCHAR2(50) NOT NULL,
    FAQ_CONTENT VARCHAR2(4000) NOT NULL,
    FAQ_DATE DATE DEFAULT SYSDATE,
    FAQ_COUNT NUMBER DEFAULT 0,
    FAQ_CATEGORY NUMBER NOT NULL,
    
    CONSTRAINT PK_FNO PRIMARY KEY (FAQ_NO),
    CONSTRAINT FK_FID FOREIGN KEY (FAQ_ID) REFERENCES MEMBER ON DELETE SET NULL
);
COMMENT ON COLUMN FAQ.FAQ_NO IS '글번호';
COMMENT ON COLUMN FAQ.FAQ_ID IS '관리자 아이디';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '제목';
COMMENT ON COLUMN FAQ.FAQ_CONTENT IS '내용';
COMMENT ON COLUMN FAQ.FAQ_DATE IS '작성날짜';
COMMENT ON COLUMN FAQ.FAQ_COUNT IS '조회수';
COMMENT ON COLUMN FAQ.FAQ_CATEGORY IS '회원1, 중고2, 커뮤3, 축제4';

INSERT INTO FAQ VALUES(1, 'admin', '중고거래는 어떤 방식인가요?', '직거래 방식입니다~', '2020/06/30', 5, 2);
INSERT INTO FAQ VALUES(2, 'admin', '로그인은 어떻게 하나요?', '오른쪽 상단 위에 로그인 버튼을 눌러주세요~', '2020/07/01', 3, 1);
INSERT INTO FAQ VALUES(3, 'admin', '로그아웃은 어떻게 하나요?', '오른쪽 상단 위에 로그인 버튼을 눌러주세요~', '2020/07/03', 1, 1);
INSERT INTO FAQ VALUES(4, 'admin', '탈퇴는 어떻게 하나요?', '회원정보수정페이지에서 탈퇴하기 버튼을 눌러주세요', '2020/07/03', 6, 1);
INSERT INTO FAQ VALUES(5, 'admin', '내정보는 어떻게 수정하나요', '회원정보수정페이지에서 수정하기 버튼을 눌러주세요', '2020/07/05', 10, 1);
INSERT INTO FAQ VALUES(6, 'admin', '중고거래~~', 'ㅁㅇ롬ㄹ옴오몸ㄹ옹ㄹ몸ㅇㄹ홈ㅇ롬ㅇㅎㅇㄴㅁㅎㅁㅇㄿㅌㅊ', '2020/07/07', 5, 2);
INSERT INTO FAQ VALUES(7, 'admin', '커뮤니티~~', 'ㅈㄷㄱㄷㄱ쇼ㅕ;ㅣㅎㅇㄹㅋㄹㅇ로텨ㅑㅛㅅㄱㄹㅇㄴ코톻', '2020/07/10', 3, 3);
INSERT INTO FAQ VALUES(8, 'admin', '커뮤니티~~3', '~~~~~~~~ㅇㅁ리ㅏㄴㅇㄹㄴ뫃남올ㅇㄴㅁㅎㄴㅁㄴㅇㅎㄴㅁㅎ~~~~~~~~~~~~~~~', '2020/07/11', 1, 3);
INSERT INTO FAQ VALUES(9, 'admin', '지역축제', '~~~~~~~~ㅎㅁㄶㄴㅁㅇㅎㄴㅁㅎㅁ~~~~~~ㄴㅁㅎㄴㅁㅇㅎㄴㅁㅇㅎㄴㅁ~~~~~~~~~', '2020/07/13', 6, 4);
INSERT INTO FAQ VALUES(10, 'admin', '지역축제123', '~~~~~~~~ㅁㄶㄴㅁ옴놈ㅎㅁ놈농놈옴오~~~~~~~~~~~~~~~', '2020/07/20', 10, 4);
INSERT INTO FAQ VALUES(11, 'admin', '중고거래32~~', 'ㅁㅇ롬ㄹ옴오몸ㄹ옹ㄹ몸ㅇㄹ홈ㅇ롬ㅇㅎㅇㄴㅁㅎㅁㅇㄿㅌㅊ', '2020/07/23', 5, 2);
INSERT INTO FAQ VALUES(12, 'admin', '커뮤니티235~~', 'ㅈㄷㄱㄷㄱ쇼ㅕ;ㅣㅎㅇㄹㅋㄹㅇ로텨ㅑㅛㅅㄱㄹㅇㄴ코톻', '2020/07/24', 3, 3);
INSERT INTO FAQ VALUES(13, 'admin', '커뮤니티~~', '~~~~~~~~ㅇㅁ리ㅏㄴㅇㄹㄴ뫃남올ㅇㄴㅁㅎㄴㅁㄴㅇㅎㄴㅁㅎ~~~~~~~~~~~~~~~', '2020/07/12', 1, 3);
INSERT INTO FAQ VALUES(14, 'admin', '지역축제26', '~~~~~~~~ㅎㅁㄶㄴㅁㅇㅎㄴㅁㅎㅁ~~~~~~ㄴㅁㅎㄴㅁㅇㅎㄴㅁㅇㅎㄴㅁ~~~~~~~~~', '2020/07/13', 6, 4);
INSERT INTO FAQ VALUES(15, 'admin', '지역축제98', '~~~~~~~~ㅁㄶㄴㅁ옴놈ㅎㅁ놈농놈옴오~~~~~~~~~~~~~~~', '2020/07/26', 10, 4);

--테이블 삭제
DROP TABLE IQTYPE CASCADE CONSTRAINTS;
--유형
CREATE TABLE IQTYPE(
    IQ_TYPE VARCHAR2(20) CONSTRAINT PK_IQTYPE PRIMARY KEY
);
COMMENT ON COLUMN IQTYPE.IQ_TYPE IS '유형';

INSERT INTO IQTYPE VALUES('회원정보');
INSERT INTO IQTYPE VALUES('중고거래 신고');
INSERT INTO IQTYPE VALUES('커뮤니티 신고');
INSERT INTO IQTYPE VALUES('오류');
INSERT INTO IQTYPE VALUES('제안하기');
INSERT INTO IQTYPE VALUES('기타');

--테이블 삭제
DROP TABLE INQUIRY CASCADE CONSTRAINTS;

--문의게시글
CREATE TABLE INQUIRY(
    IQ_NO NUMBER,
    IQ_ID VARCHAR2(20) CONSTRAINT FK_IQID REFERENCES MEMBER ON DELETE CASCADE,
    IQ_TITLE VARCHAR2(50) NOT NULL,
    IQ_CONTENT VARCHAR2(4000) NOT NULL,
    IQ_DATE DATE DEFAULT SYSDATE,
    IQ_ANSWER CHAR(1) DEFAULT 'N' NOT NULL CHECK (IQ_ANSWER = 'Y' OR IQ_ANSWER = 'N'),
    IQ_ORIGINAL VARCHAR2(50),
    IQ_RENAME VARCHAR2(50),
    IQ_ORIGINAL2 VARCHAR2(50),
    IQ_RENAME2 VARCHAR2(50),
    IQ_ORIGINAL3 VARCHAR2(50),
    IQ_RENAME3 VARCHAR2(50),
    IQ_TYPE VARCHAR2(20) NOT NULL CONSTRAINT FK_IQTYPE REFERENCES IQTYPE,
    CONSTRAINT PK_IQNOID PRIMARY KEY (IQ_NO, IQ_ID)
);
COMMENT ON COLUMN INQUIRY.IQ_NO IS '글번호';
COMMENT ON COLUMN INQUIRY.IQ_ID IS '회원아이디';
COMMENT ON COLUMN INQUIRY.IQ_TITLE IS '제목';
COMMENT ON COLUMN INQUIRY.IQ_CONTENT IS '내용';
COMMENT ON COLUMN INQUIRY.IQ_DATE IS '작성날짜';
COMMENT ON COLUMN INQUIRY.IQ_ANSWER IS '답변여부';
COMMENT ON COLUMN INQUIRY.IQ_ORIGINAL IS '오리지널 파일';
COMMENT ON COLUMN INQUIRY.IQ_RENAME IS '리네임 파일';
COMMENT ON COLUMN INQUIRY.IQ_ORIGINAL2 IS '오리지널 파일2';
COMMENT ON COLUMN INQUIRY.IQ_RENAME2 IS '리네임 파일2';
COMMENT ON COLUMN INQUIRY.IQ_ORIGINAL3 IS '오리지널 파일3';
COMMENT ON COLUMN INQUIRY.IQ_RENAME3 IS '리네임 파일3';
COMMENT ON COLUMN INQUIRY.IQ_TYPE IS '유형';

-- INSERT하려면 아이디정보가 필요합니다~~~~~
INSERT INTO INQUIRY VALUES(1, 'user01', '문의할께요', '문의문의문의문의문의문의문의문의문의문의', '2020/06/01', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(2, 'user08', '회원정보', '문의문의문의문의문의문의문의문의문의문의', '2020/06/02', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(3, 'user02', '안녕~~', '문의문의문의문의문의문의문의문의문의문의', '2020/06/03', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(4, 'user03', '탈퇴할래요~', '문의문의문의문의문의문의문의문의문의문의', '2020/06/07', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(5, 'user01', '회원정보 수정하고싶어요', '문의문의문의문의문의문의문의문의문의문의', '2020/06/09', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(6, 'user02', '수정할래요', '문의문의문의문의문의문의문의문의문의문의', '2020/06/12', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(7, 'user03', '수정하고 싶은데 어떻게 해요', '문의문의문의문의문의문의문의문의문의문의', '2020/06/14', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '회원정보');
INSERT INTO INQUIRY VALUES(8, 'user08', '오류발견했어요', '문의문의문의문의문의문의문의문의문의문의', '2020/07/03', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '오류');
INSERT INTO INQUIRY VALUES(9, 'user01', '검색오류입니다/', '문의문의문의문의문의문의문의문의문의문의', '2020/07/07', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '오류');
INSERT INTO INQUIRY VALUES(10, 'user02', '회원가입하려는데 안되네요', '문의문의문의문의문의문의문의문의문의문의', '2020/07/07', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, '오류');
INSERT INTO INQUIRY VALUES(11, 'user02', '사진은 3개이상안되나요', '문의문의문의문의문의문의문의문의문의문의', '2020/07/16', DEFAULT, NULL, NULL, NULL, NULL, NULL, NULL, '오류');
INSERT INTO INQUIRY VALUES(12, 'user03', '제안할께요', '문의문의문의문의문의문의문의문의문의문의', '2020/07/17', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, '제안하기');
INSERT INTO INQUIRY VALUES(13, 'user08', '기타문의사항입니다.', '문의문의문의문의문의문의문의문의문의문의', '2020/07/18', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, '기타');

--테이블 삭제
DROP TABLE ANSWER CASCADE CONSTRAINTS;

--답변게시글
CREATE TABLE ANSWER(
    AN_NO NUMBER NOT NULL CONSTRAINT PK_ANNO PRIMARY KEY,
    AN_CONTENT VARCHAR2(4000) NOT NULL,
    AN_DATE DATE DEFAULT SYSDATE,
    IQ_NO NUMBER NOT NULL,
    IQ_ID VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_IQUNOID FOREIGN KEY (IQ_NO, IQ_ID) REFERENCES INQUIRY ON DELETE CASCADE
);
COMMENT ON COLUMN ANSWER.AN_NO IS '글번호';
COMMENT ON COLUMN ANSWER.AN_CONTENT IS '내용';
COMMENT ON COLUMN ANSWER.AN_DATE IS '작성날짜';
COMMENT ON COLUMN ANSWER.IQ_NO IS '원글번호';
COMMENT ON COLUMN ANSWER.IQ_ID IS '원글작성자';

-- INSERT하려면 아이디정보가 필요합니다~~~~~
INSERT INTO ANSWER VALUES(1, '문의문의문의문의문의문의문의문의문의문의', '2020/06/03', '3', 'user02');
INSERT INTO ANSWER VALUES(2, '문의문의문의문의문의문의문의문의문의문의', '2020/06/07', '4', 'user03');
INSERT INTO ANSWER VALUES(3, '문의문의문의문의문의문의문의문의문의문의', '2020/06/16', '12', 'user03');
INSERT INTO ANSWER VALUES(4, '문의문의문의문의문의문의문의문의문의문의', '2020/07/01', '13', 'user04');
INSERT INTO ANSWER VALUES(5, '문의문의문의문의문의문의문의문의문의문의', '2020/06/16', '10', 'user02');

COMMIT;

-- 테이블 삭제
DROP TABLE DECLARE_BOARD CASCADE CONSTRAINTS;
-- 신고 관리 게시판 테이블 생성
CREATE TABLE DECLARE_BOARD (
	DECLARE_NO	NUMBER	 CONSTRAINT PK_NO PRIMARY KEY,
	MEMBER_ID	 VARCHAR2(20),
	DECLARE_TITLE	 VARCHAR2(50) CONSTRAINT NN_BTITLE	NOT NULL,
	DECLARE_DATE	 DATE DEFAULT SYSDATE,
	DECLARE_TYPE 	VARCHAR2(20),
	DECLARE_CONTENT	VARCHAR2(4000),
	DECLARE_ORIGINAL	VARCHAR2(50),
	DECLARE_RENAME	 VARCHAR2(50),
	DECLARE_URL	 VARCHAR2(100),
	DECLARE_ID	 VARCHAR2(20),	
    	DECLARECHE  CHAR(1)	DEFAULT 'N'
);

COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_NO" IS '글번호';
COMMENT ON COLUMN "DECLARE_BOARD"."MEMBER_ID" IS '작성자';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_TITLE" IS '글제목';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_DATE" IS '등록일';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_TYPE" IS '신고유형';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_CONTENT" IS '내용';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_ORIGINAL" IS '원본파일명';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_RENAME" IS '변경파일명';
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARE_URL" IS '해당글URL';오후 10:24 2020-08-07 [금]오후 10:24 2020-08-07 [금]
COMMENT ON COLUMN "DECLARE_BOARD"."DECLARECHE" IS '신고처리';

-- 제약조건
ALTER TABLE DECLARE_BOARD ADD CONSTRAINT FK_DECLARE_TYPE FOREIGN KEY (DECLARE_TYPE) REFERENCES IQTYPE(IQ_TYPE);
--데이터
INSERT INTO declare_board
VALUES(1, NULL,'신고합니다.', DEFAULT, '중고거래 신고', '누가가짜물품으로거래를합니다.','','','중고거래URL', NULL, DEFAULT );
INSERT INTO declare_board
VALUES(2, NULL,'사기꾼아이디신고.', DEFAULT, '중고거래 신고', '전에본사기꾼아이디에요.','','','중고거래URL', NULL, DEFAULT );
INSERT INTO declare_board
VALUES(3, NULL,'비방욕합니다.', DEFAULT, '커뮤니티 신고', '욕해요.','','','중고거래URL', NULL, DEFAULT );



COMMIT;