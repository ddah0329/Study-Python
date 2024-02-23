
SELECT * FROM EMPLOYEES;
-----------------------------------------------------------------
-- 연결연산자
-- DUAL 테이블: 연산식의 결과 값을 확인하고 싶을 때 사용하는 테이블 (오라클 제공)
-- 연결연산자로 데이터를 뽑아낸 결과는 항상 문자열 타입이다.
-----------------------------------------------------------------

-- 문자열 숫자 연결
SELECT 10||20 FROM DUAL;

SELECT '안녕'||'하세요' FROM DUAL;

--EMPLOYEES 테이블에 성과 이름을 연결해서 조회
SELECT 
	LAST_NAME || ' ' || FIRST_NAME 성함
FROM
	EMPLOYEES;

-- 날짜 타입에 연결
-- 값의 형식이 달라짐 BECAUSE 자료형 DATE형 -> VARCHAR2
SELECT 
	'입사'||' : ' || HIRE_DATE,
	HIRE_DATE 
FROM
	EMPLOYEES;


-- [실습]
-- 사원 봉급에 '원'을 붙여서 조회한다 *별칭:봉급(시간)
SELECT 
	SALARY || '원' "봉급(시간)"
FROM 
	EMPLOYEES;

-- 사원 이메일 뒤에 '@KoreaIT.com'을 붙여서 나오도록 조회한다. *별칭:이메일
SELECT 
	EMAIL || '@KoreaIT.com' "이메일"
FROM 
	EMPLOYEES;