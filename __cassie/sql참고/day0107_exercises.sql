-- < 문제 풀이 >

select * from emp;

-- 1. 10번 부서의 월급 평균, 최대값, 최솟값을 구하라
select trunc(avg(sal)), max(sal), min(sal) from emp where deptno = 10;

-- 2. 부서별 월급의 평균,  최대값, 최솟값을 구하라
select  trunc(avg(sal)), max(sal), min(sal) from emp group by deptno;

-- 3. 10번 부서에 속한 사람들의 직책별 월급 평균
select trunc(avg(sal)), job from emp where deptno = 10 group by job;

-- 4. 부서별 월급 평균, 최댓값, 최솟값을 구하되 월급 평균이 3000이상인 부서에 대하여 구하라
-- ***** group by에 대한 조건으 having!!! *****
select deptno, trunc(avg(sal)), max(sal), min(sal) from emp group by deptno having avg(sal)>=3000;

-- 5. 직책별 월급 평균, 최댓값, 최솟값을 구하되 월급의 최댓값이 4000보다 큰 직책에 대하여 구하라
select job, trunc(avg(sal)), max(sal), min(sal) from emp group by job having max(sal)>4000;

-- 6. 10번 부서에 속한 사람들의 직책별 월급평균을 구하되 월급평균이 3500이하인 직책에 대하여 구하라
select trunc(avg(sal)), job from emp where deptno = 10 group by job having avg(sal)<= 3500 ;

-- 7. 직책이 clerk인 사람들의 부서별 월급 평균, 최댓값을 구하되 월급의 최댓값이 3600보다 작은 부서에 대하여 구하라.
select trunc(avg(sal)), max(sal), deptno from emp where job='CLERK'  
group by deptno having max(sal)< 3600;
-- !!! group by 할 때, 그룹으로 묶이는 값이 아닌 값, 즉 중복인 값을 내는 컬럼을 뽑으려 하면 오류 발생!!

-- 8. 이름에 er이 들어있는 사람들의 직책별 월급 평균, 최댓값, 최솟값 구하라
select job, trunc(avg(sal)), max(sal), min(sal) from emp where ename like '%ER%' group by job;

-- 9. A로 시작하는 사원 이름과 급여 출력
select ename, sal from emp where ename like 'A%';

--******* 함수 사용하려면 항상!! 서브쿼리로 새로 뽑아내야해! 어디서 얻고자하는지 오라클은 모른다

-- 10. 급여가 사원 전체의 평균보다 높은 사원의 이름, sal, 부서명을 출력하라
select emp.ename, emp.sal, dept.dname from emp, dept where emp.deptno = dept.deptno and emp.sal > (select avg(sal) from emp);

-- 11. emp table에서 급여가 가장 높은 사람의 사번, 성명, 부서명, 급여를 출력하라
select empno, ename, dname, sal from emp, dept where emp.deptno = dept.deptno and sal = (select max(sal) from emp); 