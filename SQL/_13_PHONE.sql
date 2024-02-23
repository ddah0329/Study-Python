--[과제]
-- 1. TBL_TEAM 테이블 생성
-- TEAM_NUMBER (PK)
-- TEAM_NAME (UK)
-- TEAM_ADDRESS <= 아무값도 넣지 않을 시 '미정'으로 설정
CREATE TABLE TBL_TEAM(
   TEAM_NUMBER NUMBER CONSTRAINT PK_TEAM PRIMARY KEY,
   TEAM_NAME VARCHAR2(500) UNIQUE,
   TEAM_ADDRESS VARCHAR2(500) DEFAULT '미정'
);
SELECT * FROM TBL_TEAM;

CREATE TABLE TBL_PLAYER(
   PLAYER_NUMBER NUMBER CONSTRAINT PK_PLAYER PRIMARY KEY,
   PLAYER_NAME VARCHAR2(500),
   PLAYER_AGE NUMBER,
   PLAYER_PHONE_NUMBER VARCHAR2(500) UNIQUE,
   PLAYER_GENDER VARCHAR2(500) CHECK(PLAYER_GENDER = 'M' OR PLAYER_GENDER ='W'),
   TEAM_NUMBER NUMBER,
   CONSTRAINT FK_TEAM FOREIGN KEY(TEAM_NUMBER) REFERENCES TBL_TEAM(TEAM_NUMBER)
);

SELECT * FROM TBL_PLAYER;
-- 2. TBL_PLAYER 테이블 생성
-- PLAYER_NUMBER (PK)
-- PLAYER_NAME
-- PLAYER_AGE
-- PLAYER_PHONE_NUMBER (UK)
-- PLAYER_GENDER <= W,M 둘 중 하나의 값만 들어갈 수 있도록 설정
-- TEAM_NUMBER(FK)

-- 3. 완성된 TBL_TEAM 테이블에 아래 값 삽입
-- (1,'FC서울')
-- (2,'수원 삼성','수원')
-- (3, '전북 현대', '전북')


-- 4. 완성된 TBL_PLAYER 테이블에
-- 아래 값 삽입
-- (1,'홍길동',20,'010-1111-1111','M',1)
-- (2,'김철수',21,'010-2222-2222','M',1)
-- (3, '김유리',22, '010-3333-3333','W',2)
-- (4,'이훈이',23,'010-5555-5555', 'M',3)
-- (5,'김맹구',24, '010-6666-6666', 'M',2)

/* TBL_MEMBER
===================================
MEMBER_NUMBER : NUMBER : PRIMARY KEY
MEMBER_NAME : VARCHAR2(500)
MEMBER_AGE : NUMBER
MEMBER_PHONE_NUMBER : VARCHAR2(500) : UNIQUE
MEMBER_ADDRESS : VARCHAR2(500)

TBL_BOOK
====================================
BOOK_NUMBER : NUMBER : PRIMARY KEY
BOOK_NAME : VARCHAR2(500)
BOOK_CATEGORY : VARCHAR2(500) : CHECK('인문학','추리','IT','로맨스')
MEMBER_NUMBER : NUMBER : FOREIGN KEY */
DROP TABLE TBL_MEMBER;

CREATE TABLE TBL_MEMBER(
   MEMBER_NUMBER NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
   MEMBER_NAME VARCHAR2(500),
   MEMBER_AGE NUMBER,
   MEMBER_PHONE_NUMBER VARCHAR2(500) UNIQUE,
   MEMBER_ADDRESS VARCHAR2(500)
);

CREATE TABLE TBL_BOOK(
   BOOK_NUMBER NUMBER CONSTRAINT PK_BOOK PRIMARY KEY,
   BOOK_NAME VARCHAR2(500),
   BOOK_CATEGORY VARCHAR2(500) CHECK(
      BOOK_CATEGORY IN('인문학','추리','IT','로맨스') 
   ),
   MEMBER_NUMBER NUMBER,
   CONSTRAINT FK_MEMBER FOREIGN KEY(MEMBER_NUMBER) REFERENCES TBL_MEMBER(MEMBER_NUMBER)
);

SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_BOOK;

-- PHONE 테이블
CREATE TABLE TBL_PHONE(
   PHONE_NUMBER NUMBER,
   PHONE_COLOR VARCHAR2(500),
   PHONE_SIZE NUMBER,
   PHONE_SALE NUMBER,
   PHONE_DATE DATE,
   CONSTRAINT PK_PHONE PRIMARY KEY(PHONE_NUMBER)
);
-- CASE 테이블
CREATE TABLE TBL_CASE(
   CASE_NUMBER NUMBER CONSTRAINT PK_CASE PRIMARY KEY,
   CASE_COLOR VARCHAR2(500),
   CASE_PRICE NUMBER,
   PHONE_NUMBER NUMBER,
   CONSTRAINT FK_PHONE FOREIGN KEY(PHONE_NUMBER) REFERENCES TBL_PHONE(PHONE_NUMBER)
);

SELECT * FROM TBL_CASE;
SELECT * FROM TBL_PHONE;

-- 관계를 맺은 테이블간의 DML
-- INSERT : 부모 테이블에 값을 먼저 넣어야한다.

-- DATE타입의 컬럼에 문자타입 값으로 날짜형식을 지켜서(YYYY-MM-DD) 데이터를 삽입하면
-- 자동으로 DATE 타입으로 변환되어 들어간다. (자동 형변환)
INSERT INTO TBL_PHONE
VALUES(1,'WHITE',50,0.5,'2021-01-12');

-- SYSDATE - 10 : 오늘날짜 - 10일
INSERT INTO TBL_PHONE
VALUES(2,'BLACK',30,1,SYSDATE - 10);

-- TO_DATE() : 문자열값을 소괄호 안에 넘겨주면 날짜타입으로 변환시켜준다.
INSERT INTO TBL_PHONE
VALUES(3,'BLACK',70,2,TO_DATE('2000-01-01'));

SELECT * FROM TBL_PHONE;

-- 자식 테이블에 값 추가
-- INSERT : 부모 테이블에 있는 값을 넣어야한다!
INSERT INTO TBL_CASE
VALUES(1,'WHITE',500,1);

INSERT INTO TBL_CASE
VALUES(2,'BLACK',300,2);

SELECT * FROM TBL_CASE;

-- 부모테이블의 PK값을 수정
-- 자식 테이블에서 참조하고 있는 값을 수정하려하면 오류난다!
UPDATE TBL_PHONE
SET PHONE_NUMBER = 4
WHERE PHONE_NUMBER = 1;

-- 해결방법
-- 참조중인 값을 NULL로 바꾸거나 다른 부모 PK값으로 바꾼다.
UPDATE TBL_CASE
SET PHONE_NUMBER = NULL -- NULL로 바꾸는 방법은 정말 급한게 아니면 비추천
WHERE PHONE_NUMBER = 1;

-- 다른 부모 PK값으로 바꾼다.
SELECT * FROM TBL_PHONE;

UPDATE TBL_PHONE
SET PHONE_NUMBER = 5
WHERE PHONE_NUMBER = 2;

UPDATE TBL_CASE
SET PHONE_NUMBER = 4
WHERE PHONE_NUMBER = 2;

UPDATE TBL_CASE
SET PHONE_NUMBER = 5
WHERE PHONE_NUMBER = 4;

SELECT * FROM TBL_CASE;





-- 부모테이블의 데이터 삭제
DELETE FROM TBL_PHONE
WHERE PHONE_NUMBER = 5;

-- 부모테이블의 데이터를 삭제 하려면 자식테이블의 참조중인 값들을 먼저 삭제하거나 수정한다.
-- 1. 자식 테이블의 참조값 삭제
DELETE FROM TBL_CASE
WHERE PHONE_NUMBER = 5;

-- BOOK, MEMBER테이블에 값 삽입
INSERT INTO TBL_MEMBER
VALUES(1,'홍길동',22,'010-1111-1111','서울시');

INSERT INTO TBL_MEMBER
VALUES(2,'신짱구',23,'010-2222-2222', '서울시');

INSERT INTO TBL_MEMBER
VALUES(3,'김철수',27,'010-3333-3333','경기도');

INSERT INTO TBL_BOOK
VALUES(1,'셜록','추리',NULL); -- 아직 회원이 책을 대여하지 않았으므로 NULL

INSERT INTO TBL_BOOK
VALUES(2,'DBMS 완전 정복','IT',NULL);

INSERT INTO TBL_BOOK 
VALUES(3,'오이대왕','인문학',NULL);


-- [실습]
-- 1. 김철수 회원이 셜록 대여
UPDATE TBL_BOOK
SET MEMBER_ID = 3
WHERE BOOK_NAME = '셜록';

-- 2. 김철수 회원이 DBMS 완전 정복 대여
UPDATE TBL_BOOK
SET MEMBER_ID = 3
WHERE BOOK_NAME = 'DBMS 완전 정복';


-- 3. 신짱구 회원이 오이대왕 대여
UPDATE TBL_BOOK 
SET MEMBER_ID = 2
WHERE BOOK_NAME = '오이대왕';

-- 4. 김철수 회원의 회원번호를 4로 수정
UPDATE TBL_MEMBER
SET MEMBER_ID = 4
WHERE MEMBER_ID = 3;
-- 오류: FK한게 있어서

UPDATE TBL_BOOK 
SET MEMBER_ID = 1
WHERE MEMBER_ID = 3;
SELECT * FROM TBL_BOOK;

UPDATE TBL_BOOK
SET MEMBER_ID = 4
WHERE MEMBER_ID = 1;

-- 5. 신짱구 회원의 회원정보 삭제
DELETE FROM TBL_MEMBER
WHERE MEMBER_NAME = '신짱구';


UPDATE TBL_BOOK
SET MEMBER_ID = NULL
WHERE MEMBER_ID = 2;

SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_BOOK;








-- 관계를 맺은 테이블 간의 DML
-- INSERT : 부모테이블에 값을 먼저 넣어야 한다.
