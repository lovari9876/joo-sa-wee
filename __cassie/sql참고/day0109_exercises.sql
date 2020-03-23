-- < 문제 풀이 >

select * from emp;
select * from dept;

-- 1. 사원 수가 다섯 명이 넘는 부서와 사원 수를 조회하는 쿼리
select dname, count(*) "사원 수" from emp e, dept d where e.deptno = d.deptno group by dname having count(*) > 5;
-- count(e.empno) 으로 바꾸어줘도 같은 결과 출력!

-- 2. 1982년 이후에 입사한 사원의 이름 검색
select ename, hiredate from emp where hiredate > '1982-01-01';

-- 3. emp 테이블에서 사원번호가 7369, 7521, 7698 이 아닌 사원의 정보
select * from emp where empno not in (7369, 7521, 7698); 

-- 4. dept table에는 존재하는 부서코드이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력
select * from dept d, emp e where e.deptno(+) = d.deptno and ename is null; -- 내가 한 것
select * from dept where deptno not in (select emp.deptno from emp group by deptno having count(*) > 0); -- 쌤이 한 것

-- <족보 문제2>
-- 전체 월급이 5000을 초과하는 JOB에 대해서 JOB과 월급여 합계를 조회하는 예이다. 단 판매원(SALES)은 제외하고 월 급여 합계로 내림차순 정렬
select job, sum(sal) from emp e, dept d where e.deptno = d.deptno and d.dname != 'SALES' group by job having sum(sal) > 5000 order by sum(sal) desc;




