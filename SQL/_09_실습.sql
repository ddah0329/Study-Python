-- TBL_STUDENT 테이블 생성

CREATE TABLE TBL_STUDENT(
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(500),
	STUDENT_MATH NUMBER,
	STDUENT_ENG NUMBER,
	STUDENT_KOR NUMBER
);

INSERT INTO TBL_STUDENT
VALUES (5,'신짱구',22,13,9);

ALTER TABLE TBL_STUDENT 
	ADD (STUDENT_GRADE VARCHAR2(100));

ALTER TABLE TBL_STUDENT
	RENAME COLUMN STDUENT_ENG TO STUDENT_ENG;

-- 학생들의 이름과 평균점수를 조회
SELECT 
	STUDENT_NAME 이름,
	ROUND((STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3, 2) 평균점수
FROM
	TBL_STUDENT;

UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'A'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 >= 90;

UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'B'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 >= 80 
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 < 90;

UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'C'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 >= 50 
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 < 80;

UPDATE TBL_STUDENT
SET STUDENT_GRADE = 'F'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR)/3 < 50;


SELECT * FROM TBL_STUDENT;

