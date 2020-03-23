--1. DEPT 테이블의 구성을 나타내시오.
DESC dept;
--2. dept 모든 데이터를 조회하시오.
select * from dept;
--3. 사원테이블(emp)에서 급여가 3000이상인 사원을 출력
select ename, sal from emp where sal>3000;
--4. 사원 이름, 연봉, 연봉에 1000을 더하여 출력
select ename, sal, sal+1000 as salth from emp;
--5. 부서번호가 20인 사원에 관한 정보만 출력
select * from emp where deptno=20;
--6. 82/1/11 이후에 입사한 사원을 출력
select * from emp where hiredate >= '82/1/1';
--==========논리 연산자==================
--7. 부서번호 10번이고 job이 매니저인 사람 출력
select * from emp where deptno=10 and job='MANAGER';
--8. 부서번호가 10번이 아닌사람
--there are 3 ways to solve problem.
select * from emp where deptno != 10; --내 방법--
select * from emp where deptno <> 10;
select * from emp where not deptno = 10;
--9. 급여가 2000~3000 사이의 사원을 검색
select * from emp where sal between 2000 and 3000;
--10. 급여가 2000 미만이거나 3000 초과인 사원 검색
select * from emp where sal not between 2000 and 3000;
--11. 1987년에 입사한 사원을 출력
select * from emp where hiredate like '87%';
--12. 커미션이 300 또는 500 또는 1400인 사원이 있는지 검색
select * from emp where comm=300 or comm=500 or comm=1400;
select * from emp where comm in (300, 500, 1400);
--13. comm이 (300 또는 500 또는 1400)이 아닌 사원이 있는지 검색
select * from emp where comm not in (300, 500, 1400);
--14. 이름이 f로 시작하는 사람 출력
select * from emp where ename like 'F%';
--15. 위치 상관없이 이름중에 A가 들어있는 사람
select * from emp where ename like '%A%';
--16. 이름이 N으로 끝나는 사람
select * from emp where ename like '%N';
--17. 이름의 두번째 글자가 A인 사원
select * from emp where ename like '_A%';
--18. 이름에 A를 포함하지 않는 사람만 검색
select * from emp where ename not like '%A%';
--19. 커미션 안 받는 사원
select * from emp where comm is null;
--20. 커미션 받는 사원 
select * from emp where comm is not null;
--21. 사원들의 급여를 오름차순으로 정렬
select ename, sal from emp order by sal asc;
--22. 가장 최근에 입사한 사원부터 출력
select * from emp order by hiredate desc;
--23. 사원들이 소속되어 있는 부서의 번호 출력, 중복 없이(distinct)
select distinct deptno from emp;
--24. smith is a clerk / allen is a salesman
select ename || ' is a ' || job from emp; --string 추가하는 방법





select * from emp;
select ENAME, hiredate, COMM from emp where comm is not null;
