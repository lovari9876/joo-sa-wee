-- < 문제 풀이 >

select * from emp;
DROP TABLE EMP01;
create table emp01 as select * from emp;

-- 1. emp01 table에서 column명 addr을 address로 바꾸시오 (emp01에 addr 없긴 함)
ALTER table emp01 rename column addr to address;

-- 2. SMITH와 부서가 같고 직책이 같은 사원의 sal 출력
select ename, deptno, sal from emp 
where deptno=(select deptno from emp where ename='SMITH') and job=(select job from emp where ename='SMITH'); 

-- 3. 부서별로 그룹하여 부서번호, 인원 수, 급여의 평균, 급여의 합 구하여 출력
-- (평균은 소수 둘째 자리에서 반올림 하시오)
select deptno, count(*) "인원 수", round(avg(sal), 2) "급여평균", sum(sal) "급여 총합" from emp group by deptno;
-- ** column 이름 지정하는 aliese ?? 쓸 때는 ""써야함!!!

-- 4. smith와 clark의 부서와 같은 부서에서 일하는 사람들 중 급여가 가장 많은 사람의 부서명과 이름, sal 출력
select e.ename, d.dname, e.sal from emp e, dept d 
where e.deptno = d.deptno and sal=(select max(sal) from emp where deptno IN (select deptno from emp where ename in ('SMITH', 'CLARK'))); 

-- 5. 부서별 급여 평균 출력
select avg(sal) from emp group by deptno;
 
-- 6. emp 테이블에서 급여에 1200 곱하여 만원단위로 사원 이름과 급여를 출력
select ename "성명", sal*1200/10000 "급여(만원)" from emp;

-- 7. sal가 사원전체의 평균보다 큰 사람의 이름과 sal 출력
select ename, sal from emp where sal > (select avg(sal) from emp);

-- 8. 부서별 급여의 총합을 나타내고자 한다. 10번 부서보다 급여의 평균이 큰 부서만 출력하시오
select deptno, sum(sal) from emp group by deptno having avg(sal)> (select avg(sal) from emp where deptno=10);




