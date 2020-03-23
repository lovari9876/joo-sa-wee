-- SUBQUERY  
--> 하나의 SELECT 문장 내에 포함된 또 하나의 SELECT 문장이 있는 쿼리문이다.
--> 쿼리문 전체를 메인 쿼리라 하고 이 안에 있는 또 하나의 SELECT문을 서브 쿼리라 한다.
--> 비교 연산자의 오른쪽에 기술해야 하고, 반드시 괄호 안에 넣어야 한다.
--> 메인 쿼리가 실행되기 이전에 한 번만 실행된다.
--> [SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');]
--> 쿼리문에서 괄호 안에 [SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'] 쿼리문의 결과가 20이 되므로 메인쿼리의 WHERE절은 [WHERE DEPTNO = 20]이 된다.

-- 1. 단일행 서브쿼리: 수행 결과가 오직 하나의 row만을 반환하는 것
-- smith의 부서 이름
select dname from dept where deptno = (select deptno from emp where ename='SMITH');

-- 사원들의 평균 급여보다 더 많은 급여 받는 사원 검색
select ename, sal from emp where sal > (select avg(sal) from emp);

-- 스미스의 급여와 동일하거나 급여를 더 많이 받는 사원과 그 급여 출력
select ename, sal from emp where sal >= (select sal from emp where ename='SMITH');


-- 2. 다중행 서브쿼리: 서브 쿼리에서의 결과 집합이 두 건 이상 출력되는 것이다.
-- 연봉을 3000 이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보 출력
select * from emp where deptno in (select distinct deptno from emp where sal >= 3000 ); --중복방지: distinct
-- in 연산자: 조건에 집합을 쓸 때 집합의 원소 중 하나라도 해당하면 출력한다.
-- in +(조건집합)

-- 부서 번호가 30번인 사원들의 급여 중 가장 낮은 값(950)보다 높은 급여를 받는 사원의 이름, 급여 출력
select ename, sal from emp where sal > (select min(sal) from emp where deptno=30); 
--> 다중행 연산자 : any
select ename, sal from emp where sal > any(select sal from emp where deptno=30); -- > any(값의 집합): 최솟값
select ename, sal from emp where sal < any(select sal from emp where deptno=30); 

-- 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여 받는 사람의 이름과 급여 출력
select ename, sal from emp where sal > (select max(sal) from emp where deptno=30);
select ename, sal from emp where sal > all(select sal from emp where deptno=30); --> 최댓값
select ename, sal from emp where sal < all(select sal from emp where deptno=30); --> 최솟값





