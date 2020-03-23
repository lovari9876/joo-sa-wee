-- 데이터 무결성(integrity 온전함, 완전한 상태)을 위한 제약 조건
-- * 무결성: 데이터베이스 내에 있는 데이터의 정확성 유지
-- 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해 테이블을 생성할 때, 각 칼럼에 대해서 정의하는 여러가지 규칙
-- * 제약(constraint) 조건: 바람직하지 않은 데이터가 저장되는 것을 방지하는 것

-- 무결정 제약조건
-- dept테이블은 부서 번호 컬럼의 행을 구분할 수 있도록 '기본키'라는 무결성 제약 조건이 주어져 있다.
-- * 기본키(primary key) : 부서 번호 컬럼을 반드시 입력되게 하고, 유일한 값을 갖게 한다.
INSERT INTO DEPT VALUES (10, 'TEST', 'SEOUL');
-- > 위 결과에서 부서 번호(DEPTNO)컬럼은 중복된 값을 저장할 수 없는 키본키이다.
-- unique constraint (SCOTT.PK_DEPT) violated. 거부되었다.

-- not null 제약 조건
insert into emp01 (empno, ename, job, deptno) values (null, null, 'salesman', 30);
select * from emp01;

create table emp02 (
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(10),
deptno number(2)
);

desc emp02;

-- UNIQUE 제약조건 :  중복을 막는 키
-->> 특정 컬럼에 대해 자료가 중복되지 않게 하는 것이다.(지정된 컬럼에는 유일한 값만 저장되게 하는 것이다.)
-- 사원 번호로 사원들을 구분하는데, 사원번호가 중복되면 큰 문제가 발생하게 된다.
create table emp03 (
empno number(4) unique,
ename varchar2(10) not null,
job varchar2(10),
deptno number(2)
);

desc emp03;
DROP TABLE EMP05;

-- 제약조건 명 부여로 오류 쉽게 확인하기
create table emp04 (
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(10),
deptno number(2)
);

desc emp04;

-- PRIMARY KEY : UNIQUE 제약조건 + NOT NULL 제약 조건
create table emp03 (
empno number(4) constraint emp03_empno_pk primary key,
ename varchar2(10) constraint emp03_ename_nn not null,
job varchar2(10),
deptno number(2)
);

desc emp03;
DROP TABLE EMP03;

-- FOREIGN KEY : 
-- 참조 무결성: 테이블 사이의 관계에서 발생하는 개념이다.
-- 두 테이블 사이의 주종 관계(주체가 되는 테이블(부모 테이블 EX. 부서 테이블)과 종속이 되는 테이블(자식 테이블 EX. 사원 테이블))에 의해서 결정된다.
--> 주체 관계가 애매모호한 경우 - '어느 테이블의 데이터가 먼저 정의되어야 하는가?'가 기준이 된다. 
-->> 먼저 정의되어야 하는 테이블이 부모 테이블, 나중에 정의되어야 하는 테이블이 자식 테이블이 된다.

-- FOREIGN KEY 제약 조건
--→ 사원 테이블의 부서 번호는 반드시 부서 테이블에 존재하는 부서 번호만 입력해야 한다. 
--→ 사원 테이블이 부서 테이블의 부서 번호를 참조 가능하도록 하는 것이다.  
--→ 부모키가 되기 위한 컬럼은 반드시 부모 테이블의 기본키(PRIMARY KEY)나 유일키(UNIQUE)로 설정되어 있어야 한다. **** 중요
create table emp03 (
empno number(4) constraint emp03_empno_pk primary key,
ename varchar2(10) constraint emp03_ename_nn not null,
job varchar2(10),
deptno number(2) constraint emp03_ename_fk REFERENCES dept
); -- dept 참조하는 foreign key 생성

desc emp03;
DROP TABLE EMP03;



