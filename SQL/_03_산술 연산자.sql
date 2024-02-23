
-----------------------------------------------------------------
-- 산술 연산자
-----------------------------------------------------------------
SELECT
	SALARY,
	SALARY + 10000,
	SALARY - 1000,
	SALARY * 10,
	SALARY / 10
FROM
	EMPLOYEES;

-- [실습]
-- 직원 이름, 봉급, 인상봉급, 감축봉급 조회
-- 인상봉급은 기존 봉급의 10% 증가 , 감축봉급은 기존 봉급의 10% 감소

SELECT
	FIRST_NAME 이름,
	SALARY 봉급,
	SALARY * 1.1 인상봉급,
	SALARY * 0.9 감축봉급
FROM
	EMPLOYEES;

-- 날짜값과 숫자값의 연산
-- [+][-]만 가능

??


-- 날짜 값과 날짜 값의 연산
-- 결과 : 숫자 타입이다. 
-- sys(tem)date : 현재 날짜와 시간을 반환한다 (오라클 제공) 
SELECT 
	HIRE_DATE,
	SYSDATE,
	SYSDATE - HIRE_DATE
FROM EMPLOYEES;

-- [실습]
-- 직원의 이름, 시급, 일급, 월급, 연봉을 조회한다. 
-- 이름은 성 + 이름이 연결되어있으며 별칭은 이름으로 설정
-- 현재 나오는 봉급은 시급기준
-- working days: 365days, working hours per day: 8hours
-- 월급은 30일 기준으로 계산

SELECT 
	LAST_NAME ||' '|| FIRST_NAME 이름,
	SALARY 시급,
	SALARY * 8 일급,
	SALARY * 8 * 30 월급,
	SALARY * 8 * 365 연봉
FROM 
	EMPLOYEES;
	
















