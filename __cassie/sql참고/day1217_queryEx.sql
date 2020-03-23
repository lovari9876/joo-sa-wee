SELECT * from emp;
--1. empno가 7499인 사원의 이름, 고용일, 부서번호 출력
SELECT EName, hiredate, deptno from emp where empno='7499';
--2. 이름이 ALLEN인 사원의 모든 정보를 출력
select * from EMP where ename='ALLEN';
--3. 업무가 MANAGER인 사원의 이름, 입사일 출력
select ename, hiredate from emp where job='MANAGER';
--4. 사원명이 WARD인 사원의 급여, 커미션을 출력
select sal, comm from emp where ename='WARD';
--5. 30번 부서에 속하는 사원의 이름, 부서번호를 출력
select ename, deptno from emp where deptno=30; --30은 int니까 ' ' 사용안해
--6. 급여가 1250을 초과, 3000이하인 사원의 이름, 급여를 출력
select ename, sal from emp where sal >1250 and sal <3000;
--7. 급여가 1250 이상 3000 이하(범위가 포함될 때에는 between 사용)
select ename, sal from emp where sal between 1250 and 3000;
--8. 커미션이 0인 사원의 이름, 커미션을 출력
select ename, comm from emp where comm=0;
--9. 커미션 계약 안한 사원 이름 출력(comm이 null)
select ename from emp where comm is null;
--10. 입사일이 81/06/09보다 늦은 사원의 이름, 입사일 출력하되, 
--입사일을 기준으로 오름차순으로 출력하시오.
select ename, hiredate from emp where hiredate > '81/06/09' order by hiredate asc;
--11. 모든 사원의 급여마다 1000을 더한 급여를 출력
select ename, sal+1000 from emp;  
--12. 가장 높은 커미션을 구하세요.
select max(comm) from emp;
--13. 가장 높은 커미션 받은 사원 이름 출력 // subQuery 사용
select ename, comm from emp where comm=(select max(comm) from emp);