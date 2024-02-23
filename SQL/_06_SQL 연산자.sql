-----------------------------------------------------------------
-- SQL 연산자
-----------------------------------------------------------------

-- BETWEEN A AND B
-- EMPLOYEES 테이블에서 SALARY가 10000이상 12000이하인 이름,성,봉급 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES
WHERE
	SALARY BETWEEN 10000 AND 12000;

-- IN(A,B,C)
-- 봉급이 10000 또는 11000 또는 12000인 직원만 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES
WHERE
	SALARY IN(10000,11000,12000);

-- LIKE : 문자열 패턴을 검색할때 사용하는 연산자
-- D% : D로 시작하는 아무거나 다 가져와
-- %e : e로 끝나는 아무거나 다
-- %e% : e가 들어간 아무거나 다 가져와 (자리 상관없이, 대소문자 구분)
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE
	FIRST_NAME LIKE '%e%';
	
-- _:자리수
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE
	FIRST_NAME LIKE '____e';
	

SELECT COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL; 


-- NULL값과 다른 값들을 연산하면 결과는 무조건 NULL
SELECT 
	NULL + 10
FROM


SELECT SALARY
FROM EMPLOYEES
WHERE SALARY = ANY(10000,11000,12000)


SELECT SALARY
FROM EMPLOYEES
WHERE SALARY = ALL(10000,11000,12000)


-- [실습]
-- 1. SALARY가 8000이상에 이름이 D로 시작하는 이름,성, 봉급 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY
FROM EMPLOYEES
WHERE 
	FIRST_NAME LIKE 'D%' AND SALARY >= 8000
	

-- 2. 보너스를 받지 않고 이름이 총 5자리수로 e로 끝나는 직원의 이름,성, 보너스 조회
SELECT
	FIRST_NAME,
	LAST_NAME,
	COMMISSION_PCT 
FROM
	EMPLOYEES
WHERE
	COMMISSION_PCT IS NULL AND FIRST_NAME LIKE '____e';














