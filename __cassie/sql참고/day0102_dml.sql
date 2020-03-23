-- << DML >> : 데이터 조작 언어

-- 1. INSERT 
-- 컬럼 지정하여 값 넣기
insert into dept02 (deptno, dname, loc) values (10, 'ACCOUNTING', 'NEW YORK');
-- 컬럼 미지정시 차례로 값 들어간다~~!
insert into dept02 values (20, 'RESEARCH', 'DALLAS');
-- 다른 테이블 전체의 값을 복사해서 붙여넣기! 
insert into dept02 select * from dept;

-- 2. UPDATE : 데이터 수정 => where 안해주면 전체 수정돼!!!!!
-- 모든 사원의 부서 번호를 30번으로 수정
update emp01 SET deptno=30; 
-- SMITH 의 deptno만 20으로 바꾸기
update emp01 SET deptno=20 where ename='SMITH';
-- 사원의 급여를 10%씩 인상시키기 
update emp01 set sal = sal*1.1;
-- 모든 입사일을 오늘로 수정
update emp01 set hiredate= sysdate;
-- 부서 번호가 10번인 사원의 부서 번호를 40번으로 수정
update emp01 set deptno=40 where deptno=10; 
-- job 컬럼이 manager인 경우 급여 10% 인상
update emp01 set deptno=40 where deptno=10;
-- 1982년에 입사한 사원 입사일 오늘로 수정
update emp01 set hiredate=sysdate where hiredate like '82%';
update emp01 set hiredate=sysdate where substr(hiredate, 1, 2) = '82';
-- smith의 부서번호를 20번으로, job컬럼을 manager로 한꺼번에 수정
update emp01 set deptno=20, job='MANAGER' where ename='SMITH';

-- 3. DELETE : 데이터 삭제
-- 테이블의 모든 데이터 삭제
delete from dept01;
-- 부서번호가 30번인 부서 삭제하는 쿼리
delete from dept01 where deptno=30;
-- 서브 쿼리분으로 부서명이 SALES인 부서 번호부터 알아내고, SALES 부서 소속의 사원을 삭제하는 쿼리
delete from emp01 where deptno = (select deptno from dept where dname='SALES');



select * from EMP01;
drop table emp01;
create table emp01 as select * from emp; 