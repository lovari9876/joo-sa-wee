--SQL에서 제공하는 함수들
--1. DUAL 테이블
--: 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 특수한 테이블
SELECT 24*60 FROM DUAL;
DESC DUAL; -- 칼럼이름, 데이터타입 보여준다.
select * from dual;
--> X라는 값이 들어 있는데 이 X는 아무 의미 없는 값이다.
--> 단 하나의 row를 구성하고 있을 뿐이다.
-- 현재 날짜를 구하는 쿼리문
select sysdate from dual;

--2. 숫자 함수
-- -10에 대한 절댓값을 구하는 쿼리
select -10, abs(-10) as abs from dual;
-- 소숫점 아래를 버리는 함수
select 34.6432, floor(34.6432) from dual;
-- 반올림 함수(예시에서는 소숫점 셋째자리에서 반올림하여 둘째자리까지 나타냄)
select 34.6432, round(34.6432, 2) from dual;
select 34.6432, round(34.6432, -2) from dual;
-- 특정 자리수에서 잘라내는 함수이다.  
select trunc(34.6432, 2), trunc(34.6432, 1), trunc(34.6432, 0), trunc(34.6432, -1), trunc(34.6432, -2) from dual;
-- 나누기 연산을 한 후 나머지
select MOD(27, 2), MOD(27, 5), MOD(27, 7) from dual;

--3. 문자처리 함수
-- 대소문자 바꾸기
select 'welcome to Oracle' "적용전", upper('welcome to Oracle') "upper 적용후" from dual;
select 'welcome to Oracle' "적용전", lower('welcome to Oracle') "lower 적용후" from dual;
-- 길이 구하기
select length('oracle'), length('오라클') from dual;
select lengthb('oracle'), lengthb('오라클') from dual;
-- 특정 문자의 위치 구하는 함수
select INSTR('welcom to Oracle','O') from dual;
-- substr: 대상 문자열이나 칼럼의 자료에서 시작 위치부터 선택 개수만큼의 문자를 추출한다.
select substr('welcome to Oracle', 4, 3) from dual; -- oracle index는 1부터 시작!
-- substr 활용: 
select ename, 19||substr(hiredate, 1, 2) 년도, substr(hiredate, 4, 2) 달 from emp;
-- 9월에 입사한 사원을 출력하는 쿼리문
select ename, 19||substr(hiredate, 1, 2) 년도, substr(hiredate, 4, 2) 달 from emp where substr(hiredate, 4, 2)= '09';
-- 특정 기호로 채우는 함수
-- 왼쪽
select LPAD('ORACLE',20,'#') from dual;
-- 20자리를 마련한 후 왼쪽에 대상 문자열을 출력하고, 오른쪽에 생긴 빈 공간을 '#' 기호로 채움
select RPAD('ORACLE',20,'#') from dual;
--공백 문자를 삭제하는 함수
select ltrim('              oracle') from dual; --trim 해준다
select ltrim('oracle              ') from dual;
select trim('    oracle       ') from dual;
--해당 특정 문자를 잘라낸 후 남은 문자열만 반환한다.
select trim('a' from 'aaaaaaaaaaaaaaaaaOracleaaa') from dual;

desc bonus; -- bonus 테이블 불러와

--4. DATE(날짜)형 (날짜 함수는 date형에 사용하는 함수)
-- 현재 날짜를 반환하는 함수
select sysdate from dual;
-- 날짜 연산
-- 날짜 + 숫자: 그 날짜로부터 그 기간만큼 지난 날짜를 계산한다.
-- 날짜 - 숫자: 그 날짜로부터 그 기간만큼 이전 날짜를 계산한다.
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;
-- months_between: 두 날짜 사이의 개월 수 구하는 함수
-- 각 직원들이 근무한 개월수 계산
select ename, sysdate, hiredate, months_between(sysdate, hiredate) 근무개월수 from emp;
-- 위 쿼리에서 소수점 자르기
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) 근무개월수 from emp; 
-- 입사 날짜에서 4개월을 추가한 결과값을 나타내는 쿼리
select ename, hiredate, add_months(hiredate, 4) from emp;
-- 오늘을 기준으로 가장 가까운 다음 수요일은 언제인지 알아보는 쿼리문
select sysdate, next_day(sysdate, '수요일') from dual;
-- 해당 달의 마지막 날짜를 반환하는 함수
--> 입사한 달의 마지막 날을 구하기
select hiredate, LAST_DAY(hiredate) from emp;

-- 5. 형 변환 함수(숫자형, 문자형, 날짜형)
-- 현재 날짜를 문자형으로 변환하여 출력하는 쿼리 -> 문자열 변환
select sysdate, to_char(sysdate, 'yyyy-mm-dd') from dual;
-- 사원들의 입사일을 출력하되, 요일까지 함꼐 출력하는 쿼리문
select ename, hiredate, to_char(hiredate, 'yyyy/mm/dd day') from emp;
-- 현재 날짜와 시간을 출력하는 쿼리
select TO_CHAR(SYSDATE, 'yyyy/mm/dd hh:mi:ss') Today FROM DUAL;
-- 24시간 형식으로 표현
select TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss') Today FROM DUAL;

-->>각 지역별 통화 기호를 앞에 붙이고 천 단위마다 ,를 붙여서 출력하는 쿼리
select ename, sal, to_char(sal, 'L999,999') from emp; -- l을 붙이면 현재설정지역통화

-- 문자형을 날짜형으로 변환하는 함수
--> 1981년 2월 20일에 입사한 사원을 검색하는 쿼리문
-- select * from emp where hiredate='81/02/20';
select * from emp where hiredate= to_date(19810220, 'yyyymmdd'); 
--> 올해 며칠이 지났는지 현재 날짜에서 2016/01/01를 뺀 결과를 출력
select trunc(sysdate-TO_DATE('20160101', 'yyyymmdd')) from dual;

-- select '20,000'-'10,000' from dual; 하려면?????
select TO_NUMBER('20,000', '99,999')-to_number('10,000' , '99,999') from dual; -- 최댓값 넣어줘야 함

-- 연봉 계산
-->> nvl(): null value를 다른 값으로 지정해주는 함수! 
-- nvl(columnName, value)
select ename, sal*12 + comm, sal*12+nvl(comm, 0) from emp;

-- 6. 조건 함수
-- decode 함수 명령어(SWITCH case)
select ename, deptno from emp order by deptno;
select deptno, decode(deptno, 10, 'A', 20, 'B', 'default') from emp order by deptno; 
--means: decode(column, case1, value, case2, value, else: defalut)
select * from dept;
select ename, deptno, decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS', 'default')
    AS dname from emp order by deptno;

-- 조건에 따라 서로 다른 처리가 가능한 case 함수(decode보다 많은 것 표현 가능)
select ename, deptno, 
    case when deptno=10 then 'ACCOUNTING'
         when deptno=20 then 'RESEARCH'
         when deptno=30 then 'SALES'
         when deptno=40 then 'OPERATIONS'
         end as dname
from emp;

-- 7. 그룹 함수
-- 그룹함수는 자동으로 null은 빼고 처리한다.

-- sum(): 사원의 총 급여 구하는 쿼리
select sum(sal) from emp;
-- comm 총 함 
select sum(comm) from emp;

-- 급여 평균
select AVG(sal) from emp; -- 소숫점 자르기
select trunc(AVG(sal)) from emp;
-- 가장 높은 급여, 낮은 급여
select max(sal), min(sal) from emp;

-- count(): 전체의 수 세기
-- 전체 사원 수
select count(*) from emp;

-- comm 받는 사원 수  
-- null 있어도 그룹함수라서 피해간다!
select count(comm) from emp;
-- 중복 제거를 반영하여 담당업무의 개수를 구하는 쿼리
select count(distinct job) from emp;

-- 8. group by
-- 특정 컬럼을 기준으로 그룹화하여 테이블에 존재하는 행들을 그룹별로 구분하기 위해 사용!
-- 그룹 함수를 쓰되, 어떤 컬럼값을 기준으로 그룹 함수를 적용할 지 기술해야 한다.

-- 사원 테이블을 부서 번호로 그룹짓는 쿼리
select deptno from emp group by deptno;

-- 소속 부서별 평균 급여 구하는 쿼리
select AVG(sal) ,deptno from emp group by deptno;
--> 소숫점 이하 자르기
select trunc(AVG(sal)) ,deptno from emp group by deptno;

-- group by절에 명시하지 않은 컬럼을 select 절에 사용한 잘못된 커리
select ename, AVG(sal) ,deptno from emp group by deptno;

-- 소속 부서별 급여 총액과 평균 급여를 구하는 쿼리
select SUM(sal), avg(sal), deptno from emp group by deptno;

-- 소속 부서별 최대 급여와 최소 급여 구하는 쿼리
select max(sal), min(sal), deptno from emp group by deptno;

-- 부서별 사원 수
select count(*), deptno from emp group by deptno;

-- 부서별 사원의 수와 커미션 받는 사원의 수 
select count(*), count(comm), deptno from emp group by deptno;

-- 10. having 절
-- group by 절에 의해 생성된 결과 값 중 원하는 조건에 부합하는 자료만 보고자 할 때 사용한다.
-- where절은 단순히 column만 결과로 보낸다면, having은 그룹으로 묶인 결과 중 조건으로 추려 출력함

-- <where>
-- 1. 조건 사용하여 결과 제한
-- 2. 테이블에서 특정조건 부합 자료만 검색
-- 3. 단순 컬럼

-- <having>
-- 1. 그룹에 대한 결과 제한
-- 2. 그룹함수 적용하여 나온 결과값 중에서 원하는 조건에 부합하는 자료만 검색

-- 그룹 지어진 부서별 평균 급여가 2000 이상인 부서의 번호와 부서별 평균 급여를 출력하는 쿼리
select deptno, avg(sal) from emp group by deptno having avg(sal)>= 2000; 

-- 부서의 최댓값과 최솟값을 구하되, 최대 급여가 2900 이상인 부서만 출력
select deptno, max(sal), min(sal) from emp group by deptno having max(sal)>= 2900;

