-- JOIN 
-- 여러 테이블에 흩어져 있는 정보 중에서 사용자가 필요한 정보만 가져와서 가상의 테이블을 만들어 결과를 도출하는 것!

-- 1. 데카르트 좌표계(Cartesian coordinate system)에 의해 데이터 산출.
SELECT * FROM emp; -- row: 12
SELECT * FROM dept; -- row: 4
SELECT * FROM emp, dept; -- 중복된다!!!!! 12개 rows

-- 2. EQUI JOIN
-- : 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 조인 기법.

-- 사원 정보를 출력할 때 각 사원이 소속된 부서의 상세 정보를 같이 출력
select * from emp, dept where emp.deptno=dept.deptno;

-- 특정 칼럼의 정보만 얻는 쿼리문
select emp.empno, emp.deptno from emp, dept where emp.deptno=dept.deptno;

-- 이름이 SMITH인 사람의 부서명 (where 절에 join 조건과 이름 검색 조건 들어감)
select emp.ename, dept.dname from emp, dept where emp.deptno=dept.deptno and ename='SMITH';

-- 3. NON-EQUI JOIN(비등가 조인)
-- : 동일 컬럼이 없이 다른 조건을 사용하여 조인할 때 쓰인다.

-- 각 사원의 급여가 몇 등급인지 살펴보는 쿼리
-- select emp.ename, emp.sal, salgrade.grade from emp, salgrade where emp.sal>= salgrade.losal and emp.sal <= salgrade.hisal;
select emp.ename, emp.sal, salgrade.grade from emp, salgrade where sal between losal and hisal;

-- 한 명의 사원 이름과 소속부서명, 급여 등급을 출력하는 쿼리문
select emp.ename, dept.dname, emp.sal, salgrade.grade from emp, salgrade, dept where emp.deptno = dept.deptno and sal between losal and hisal;
SELECT E.ENAME, D.DNAME, S.GRADE FROM EMP E, DEPT D, SALGRADE S WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL;
-- (from에서 테이블 이름을 새로 정의 가능!)

-- 4. SELF JOIN: 자기 자신과 조인
-- 이름이 스미스인 사람의 매니저 이름
select e2.ename, e2.job from emp e1, emp e2 where e1.mgr=e2.empno and e1.ename='SMITH';

-- 5. OUTER JOIN: 
-- 조인 조건에 만족하지 않는 행도 나타내는 조인 기법이다.
-- 2개 이상의 테이블이 조인될 때, 어느 한쪽의 테이블에는 해당하는 데이터가 존재하는데 
-- 다른 쪽 테이블에는 데이터가 존재하지 않는 경우, 그 데이터가 출력되지 않는 문제를 해결하기 위해서 사용되는 조인기법이다.

-- 모든 사원의 매니저 이름
SELECT e1.ename, e2.ename from emp e1, emp e2 where e.mgr = e2.empno; 
-- king은 사장이라서 mgr이 null임... 그래서 이걸 나타내고 싶으면 outer join 이용!!

-- 사원 테이블과 부서 테이블을 조인하여 사원명과 부서 번호와 부서명을 출력하는 쿼리
select ename, dept.deptno, dname from emp, dept where dept.deptno=emp.deptno;
select ename, emp.deptno, dept.deptno, dname from emp, dept where dept.deptno=emp.deptno(+);
-- (이렇게하면 한쪽 테이블에 없는 정보도! 표시 가능이다! (+)는 없는 값을 표에 표시하겠다는 것)




select * from emp;
select * from dept;
select * from salgrade;



