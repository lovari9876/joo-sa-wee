-- SQL 명령문의 종류

-- DQL : Data Query Language(질의어) 
--> select
-- DML : Data Manipulation Language(데이터 조작어)
--> insert, delete, update, select
-- DDL : Data Definition Language(데이터 정의어): 데이터 구조에 영향미치는것
--> create, alter, drop, rename, truncate
-- DCL : Data Control Language(데이터 제어어)
--> grant (권한), revoke
-- TCL : Transaction Control Language(트랜젝션 처리어)
--> commit, rollback, savepoint

-- << DDL >>
-- 1. create : 테이블 생성
--> table 명, column 명, 컬럼의 데이터타입, pk(private key), fk(foreign key)
--** datatype 은 dbms마다 통일이 안되어있고 다 이름 다름.. 그래도 틀을 잡자면,
-- 문자, 숫자, 날짜 데이터 타입이 있다.
-- (1) 문자: 
-- char(size: 글자 수): 고정 => 예) 'smith               ' : 5bites만 저장해도 고정되어 저장! 
-- varchar2(size) : 가변 => 예) 'smith' : 저장하고자 하는 만큼만 가변적으로 저장!
--> 데이터베이스는 검색이 핵심이기 때문에 char은 size만큼 고정하여 저장해서, 검색이 빠름! 딱 size만큼 끊어서 검색하면 되니까.
--> 그러나, varchar2는 저장을 가변적으로 할 수 있음. 메모리 아낄 수 있지만 검색 속도 느림

create table emp01 (
    empno number(4),
    ename varchar2(20),
    sal number(7, 2)
);

commit;
desc emp01;

-- 기존 테이블(emp)과 동일한 내용과 구조를 갖는 테이블을 만드는 쿼리문
create table emp02 as select * from emp;
select * from emp02;

-- 기존 테이블의 컬럼 일부만 복사한 테이블 만들기
create table emp03 as select empno, ename from emp;
select * from emp03;

-- 조건에 해당하는 컬럼만 복사한 테이블 만들기
create table emp04 as select empno, ename from emp where deptno = 10;
select * from emp04;

-- 데이터는 빼고 테이블의 구조(컬럼들)만 복사하기 => where절에 조건으로 false인 값 넣어주기!!
create table emp05 as select * from emp where 1=0;
select * from emp05;

-- 2. alter : 테이블 수정 => column 추가 등!
-- ADD : 칼럼 추가
alter table emp01 add (job varchar2(9));
select * from emp01;

-- MODIFY : 컬럼 데이터타입 수정
alter table emp01 modify (job varchar2(30));
desc emp01;

-- DROP : 테이블의 컬럼 삭제
alter table emp01 drop column job;

-- 3. DROP TABLE : 테이블 삭제
drop table emp01;

-- 4. truncate : 테이블의 모든 rows 제거
delete emp02;
truncate table emp02;
-- => 사실 위 두 개의 결과가 동일함
select * from emp02;

-- 5. RENAME :  테이블 명 변경
rename emp02 to test;
desc test;

-- 6. DELETE : 데이터 삭제
-- 위에서 delete 와 truncate 결과가 같았다. 차이점은?
-- delete: 원하는 데이터만 지울 수 있고, 삭제 후 잘못 삭제한 것을 되돌릴 수 있다. 그러므로 테이블 용량이 지워지지 않음.
-- truncate: 용량이 줄어 들고, 인덱스 등도 모두 삭제된다. 되돌릴 수 없다.
-- drop: 데이터 뿐 아니라 테이블 자체를 삭제. 되돌릴 수 없다.



