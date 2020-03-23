-- 트랜잭션: 
-- 데이터베이스에서는 데이터의 일관성과 무결성을 보장하기 위해서는 반드시 트랜잭션 관리가 필요하다.
-- 트랜잭션이란 데이터베이스 내에서 하나의 그룹으로 처리되어야 하는 명령문들을 모아 놓은 작업 단위이다.

-- rollback: 트랜잭션이 행한 모든 행동을 취소 => 복구 
--> 작업 중 문제가 발생했을 때, 트랜젝션의 처리 과정에서 발생한 변경 사항을 취소하고, 트랜젝션 과정을 종료시킨다.
--> 트랜젝션으로 인한 하나의 묶음 처리가 시작되기 이전의 상태로 되돌린다.
--> TRANSACTION(INSERT, UPDATE, DELETE)작업 내용을 취소한다.
--> 이전 COMMIT한 곳까지만 복구한다.
delete from dept02 where deptno = 40;
select * from dept02;
rollback; -- 복구! 짱신기

-- 자동 commit 되는 경우: 
-- DDL과 DCL 명령문이 수행된 경우
--=> DDL문에는 CREATE, ALTER, DROP, RENAME, TRUNCATE등이 있는데 이들 모두는 자동으로 COMMIT을 실행한다.

-- SAVEPOINT: 트랜잭션 덩어리를 쪼개놓은 저장점
drop table dept01;
create table dept01 as select * from dept;

select * from dept01;
delete from dept01 where deptno=40;
delete from dept01 where deptno=30;
savepoint c1;

delete from dept01 where deptno=20;
savepoint c2;

delete from dept01 where deptno=10;
rollback to c2; -- c2지점까지 롤백
rollback to c1; -- c1지점까지 롤백
rollback; -- 처음 생성된 테이블 상태로 롤백(commit 이전=create하면 자동 롤백된다.)
