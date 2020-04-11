COMMIT;

-- 다중 insert
		INSERT all
        INTO
			TRADE 
			(T_NO, M_NO, S_NO, T_TITLE, T_CONTENT) 
		VALUES 
			(trade_seq.nextval, 6, 33,  'title','content' )
            
         INTO
			TRADE_GAME 
			(TG_NO, T_NO, G_NO, TG_NAME ) 
		VALUES 
			(TRADE_GAME_SEQ.NEXTVAL,trade_seq.nextval, 
			null
			,'lkafjlaf' )
            
       SELECT  *
FROM    DUAL;     -- 다중 insert 일 때 셀렉트 붙여줘야함.


-- 시퀀스 현재값 보기
SELECT  TRADE_GAME_SEQ.currval    
FROM    DUAL; 


-- 시퀀스 가져오는 함수 생성
CREATE FUNCTION get_trade_seq RETURN NUMBER IS
BEGIN
  RETURN TRADE_GAME_SEQ.nextval;
END;
/
            
 COMMIT;
            
            
            
		SELECT 
			T.*, M.M_NICK, M.M_ID, S.S_CONTENT, TG.TG_NAME AS GAMES, TG.TG_PRICE AS PRICES
		FROM
			TRADE T
		LEFT JOIN
			MEMBER M
		ON 
			T.M_NO = M.M_NO
		LEFT JOIN
			SUBJECT S
		ON 
			T.S_NO = S.S_NO
		LEFT JOIN
			TRADE_GAME TG
		ON 
			T.T_NO = TG.T_NO			
		WHERE
			T_NO = 396;          
            
            
       SELECT 
			*
		FROM
			TRADE_GAME TG
		WHERE
			T_NO =396
		ORDER BY TG_NO ASC;
        
        
        
        UPDATE 
			TRADE
		SET 
			S_NO = 32,
			T_TITLE = '사고싶어요',
			T_CONTENT = '사고싶어요진심',
			T_UPDATED_DATE = SYSDATE,
			T_ISLAND = 0
		WHERE T_NO = 396;


-- 성공
BEGIN
    FOR I IN 33..35
    LOOP
		UPDATE 
			TRADE_GAME
			SET 
				TG_NAME = '겜겜겜',
				TG_PRICE = 3000
			WHERE 
				TG_NO = i ;
                END LOOP;
                		UPDATE 
			TRADE_GAME
			SET 
				TG_NAME = '겜겜',
				TG_PRICE = 3000
			WHERE 
				TG_NO = i ;
                END LOOP;
                		UPDATE 
			TRADE_GAME
			SET 
				TG_NAME = '겜',
				TG_PRICE = 3000
			WHERE 
				TG_NO = i ;

END;
/
commit;


-- for loop 이용한 update
BEGIN
    FOR i IN (SELECT id,
                     name,
                     desc
              FROM   table1) LOOP
        UPDATE table2
        SET    name = i.name,
               desc = i.desc
        WHERE  id = i.id;
    END LOOP;
END;
/

-- 출처: https://lahuman.jabsiri.co.kr/100 [lahuman & jabsiri 노트]

-- 변수 출력 예제
SET serveroutput ON;
declare
  type nt_type is table of number;
  nt nt_type := nt_type (1, 3, 5);
begin
  for i in 1..nt.count loop
    dbms_output.put_line(nt(i));
  end loop;
end;
/


-- 변수 선언 예제
	DECLARE NAME VARCHAR2(20) := '이효리';

	BEGIN

		DBMS_OUTPUT.put_Line('이효리'|| NAME); -- 출력

	END;
/
-- 출처: https://goddaehee.tistory.com/99?category=275012 [갓대희의 작은공간]


-- 프로시저 생성(큰 덩어리의 함수 느낌) 예제
CREATE OR REPLACE PROCEDURE Table_Test
     (v_deptno IN emp.deptno%TYPE)

    IS

     -- 각 컬럼에서 사용할 테이블의 선언 
     TYPE empno_table IS TABLE OF emp.empno%TYPE
     INDEX BY BINARY_INTEGER;

     TYPE ename_table IS TABLE OF emp.ename%TYPE
     INDEX BY BINARY_INTEGER;

     TYPE sal_table IS TABLE OF emp.sal%TYPE
     INDEX BY BINARY_INTEGER;

     -- 테이블타입으로 변수를 선언해서 사용 
     empno_tab  empno_table ;
     ename_tab  ename_table ;
     sal_tab    sal_table;

     i BINARY_INTEGER := 0;

   BEGIN

     DBMS_OUTPUT.ENABLE;

     FOR emp_list IN(SELECT empno, ename, sal 
                     FROM emp WHERE deptno = v_deptno) LOOP

      /* emp_list는 자동선언되는 BINARY_INTEGER형 변수로 1씩 증가한다. 
         emp_list대신 다른 문자열 사용가능 */

            i := i + 1;

           -- 테이블 변수에 검색된 결과를 넣는다
            empno_tab(i) := emp_list.empno ;     
            ename_tab(i) := emp_list.ename ;
            sal_tab(i)   := emp_list.sal ;

      END LOOP;

      -- 1부터 i까지 FOR 문을 실행 
      FOR cnt IN 1..i LOOP

         -- TABLE변수에 넣은 값을 뿌려줌 
         DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) );
         DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) );
         DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));

      END LOOP;

  END; 
  /

-- (DBMS_OUTPUT.PUT_LINE을 출력하기 위해 사용)
SET SERVEROUTPUT ON ;
 
--실행
EXECUTE Table_Test(10);
/


-- 예제 2
declare
  type nt_type is table of number;
  nt nt_type := nt_type (1, 3, 5); 
begin
  for i in 1..nt.count loop
    dbms_output.put_line(nt(i));
  end loop;
end;
/

-- 예제 3 : 바로 대입!!!
DECLARE
   TYPE CourseList IS TABLE OF VARCHAR2(16);
   my_courses CourseList;
BEGIN
   my_courses :=
      CourseList('Econ 2010', 'Acct 3401', 'Mgmt 3100');
END;
/

-- 예제2, 3은 anonymous block 에서 못써.
--Your anonymous block is using a record type. Record types do not have constructors. 
--You have to assign each column individually, and have a record-type variable


-- ***********************
-- update block 만들기
declare

     -- 각 컬럼에서 사용할 테이블의 선언 (이 테이블은 sql의 테이블이 아니라 1차원 배열임)
    TYPE tg_no_arr IS TABLE OF NUMBER(15,0)
    INDEX BY BINARY_INTEGER;
    
    TYPE game_arr IS TABLE OF VARCHAR2(40 BYTE)
    INDEX BY BINARY_INTEGER;
    
    TYPE price_arr IS TABLE OF NUMBER(10,0)
    INDEX BY BINARY_INTEGER;

     -- 테이블타입으로 변수를 선언해서 사용: 형식 [변수이름 테이블타입]
    tg_no tg_no_arr;
    game game_arr;
    price price_arr;
    
     -- for 문 위한 변수 선언
    i BINARY_INTEGER := 0;

   BEGIN

    game := '겜임 1';
    game := '겜임 2';
    game := '겜임 3';
    
    price := 1000;
    price := 2000;
    price := 3000;

    -- 해당 글의 tg_no만 arr에 넣기
     FOR tg_nolist IN (select tg_no from trade_game where t_no = 396 )  loop
            
            i := i + 1;

           -- 테이블 변수에 검색된 결과를 넣는다
            tg_no(i) := tg_nolist.tg_no ; 

      END LOOP;
      
      -- 아나... 수정시 입력한 게임이름 개수가 기존것보다 많으면(초과) tg_no추가해서 새로 insert.
      -- 같으면 그대로 update,
      -- 적으면 게임 개수만큼만 update 후에 남는거 delete

      -- 1부터 i까지 FOR 문을 실행 
      FOR cnt IN 1..i LOOP

    -- 수정한 개수만큼만 update
    update trade_game tg set tg.tg_name = game(i), tg.tg_price = price(i) where tg.tg_no = tg_no(i);

      END LOOP;

  END; 
  /


commit;


-- 함수 이름 바꾸기
CREATE SYNONYM get_trade_game_seq FOR get_trade_seq; 
/
--Then you could use both the new and the old name. However, this would not actually rename the function; just give it an additional synonym.

DROP FUNCTION get_trade_seq;
/
drop SYNONYM get_trade_game_seq;
/

CREATE FUNCTION get_trade_game_seq 
RETURN NUMBER IS
BEGIN
  RETURN TRADE_GAME_SEQ.nextval;
END;
/
CREATE SYNONYM get_trade_seq FOR get_trade_game_seq;
/
commit;


-- 200209 오후 7:53 프로시저 공부 얼추 끝내고 update 프로시저 짜기 시작

-- 예제
CREATE OR REPLACE PROCEDURE Record_Test
      ( p_empno IN emp.empno%TYPE )

   IS

     -- 하나의 레코드의 세가지의 변수타입 선언 

     TYPE emp_record IS RECORD
     (v_empno    NUMBER,
      v_ename    VARCHAR2(30),
      v_hiredate  DATE );

     emp_rec   emp_record ;

   BEGIN

     DBMS_OUTPUT.ENABLE;

     -- 레코드의 사용 
     SELECT empno, ename, hiredate
     INTO emp_rec.v_empno, emp_rec.v_ename, emp_rec.v_hiredate
     FROM emp
     WHERE empno = p_empno;

     DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || emp_rec.v_empno );
     DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || emp_rec.v_ename );
     DBMS_OUTPUT.PUT_LINE( '입 사 일 : ' || emp_rec.v_hiredate);

   END;
 / 

SET SERVEROUTPUT ON ; 

-- 연습 1
CREATE OR REPLACE PROCEDURE Update_Test1
      ( p_games IN VARCHAR2 ,
        p_prices IN NUMBER,
        p_tg_no IN trade_game.tg_no%TYPE )

   IS

     -- 하나의 레코드의 세가지의 변수타입 선언 

     TYPE up_record IS RECORD
     (v_games    NUMBER,
      v_prices    VARCHAR2,
      v_tg_no    trade_game.tg_no%TYPE );

     up_rec       up_record ;

   BEGIN

     DBMS_OUTPUT.ENABLE;

     -- 레코드의 사용 
    update trade_game SET 
    
    
    
     DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || emp_rec.v_empno );
     DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || emp_rec.v_ename );
     DBMS_OUTPUT.PUT_LINE( '입 사 일 : ' || emp_rec.v_hiredate);

   END;
   /

  --DECLARE p_num INT; p_name VARCHAR2(20); p_rc SYS_REFCURSOR; BEGIN p_num := #{num}; p_name := #{name}; OPEN p_rc FOR SELECT NUM, NAME, TITLE, CONTENT, READ_COUNT, WRITE_DATE FROM TB_BOARD WHERE NUM >= p_num AND NAME = p_name ORDER BY NUM DESC; #{resultList, mode=OUT, jdbcType=CURSOR, javaType=ResultSet, resultMap=procVO} := p_rc; #{name, mode=OUT, jdbcType=VARCHAR, javaType=String} := 'call anonymous block....'; END

-- if 예제(조건 제어)
CREATE OR REPLACE PROCEDURE Dept_Search
        (p_empno IN emp.empno%TYPE )

    IS

        v_deptno emp.deptno%type ;

    BEGIN

        DBMS_OUTPUT.ENABLE;

        SELECT deptno
        INTO v_deptno
        FROM emp
        WHERE empno = p_empno;

        IF v_deptno = 10 THEN

            DBMS_OUTPUT.PUT_LINE( ' ACCOUNTING 부서 사원입니다. ' );

        ELSIF v_deptno = 20 THEN

            DBMS_OUTPUT.PUT_LINE( ' RESEARCH 부서 사원입니다. ' );

        ELSIF v_deptno = 20 THEN

            DBMS_OUTPUT.PUT_LINE( ' SALES 부서 사원입니다. ' );

        ELSIF v_deptno = 20 THEN

            DBMS_OUTPUT.PUT_LINE( ' OPERATIONS 부서 사원입니다. ' );

        ELSE

            DBMS_OUTPUT.PUT_LINE( ' 부서가 이상해요... ' );

        END IF;

    EXCEPTION    
      WHEN   NO_DATA_FOUND  THEN  
        DBMS_OUTPUT.PUT_LINE(' 부서가 없네요... ');

    END ;
    /




-- trade_game update 성공!!
-- declareTest 1 성공 ... 와....
DECLARE
     
     -- 하나의 레코드의 세가지의 변수타입 선언 

--     TYPE up_record IS RECORD
--     (
----     (v_games    NUMBER,
----      v_prices    VARCHAR2(80),
--      v_tg_no    trade_game.tg_no%TYPE);
      
      TYPE tg_no_table IS TABLE OF trade_game.tg_no%TYPE 
            INDEX BY BINARY_INTEGER;             
      TYPE tg_name_table IS TABLE OF trade_game.tg_name%TYPE 
            INDEX BY BINARY_INTEGER;       
      TYPE tg_price_table IS TABLE OF trade_game.tg_price%TYPE 
            INDEX BY BINARY_INTEGER;       

--     up_rec       up_record ;

    tg_no_tab       tg_no_table;        -- 해당 글에 이미 있는 tg_no 담기
    tg_name_tab    tg_name_table;   -- mybatis  foreach 로 게임 담기
    tg_price_tab    tg_price_table;     -- mybatis  foreach 로 가격 담기
     
     nocnt binary_integer :=0;
     gcnt binary_integer :=0;
     j binary_integer :=0;
     
     -- 글번호 넣기
     v_t_no     trade_game.t_no%type := 401;
     

   BEGIN
    
     --DBMS_OUTPUT.ENABLE;
     

     
     -- 해당 글의 tg_no 가져오기..
     for tg_nolist in (select tg_no from trade_game where t_no = v_t_no) loop
     
        nocnt := nocnt +1;
        
        tg_no_tab(nocnt) := tg_nolist.tg_no;
        
     end loop; 
          
    -- mybatis  foreach 로 게임 담기
--    <foreach collection="gamePrice" index="game" item="price">	
--         gcnt := gcnt +1;
--        tg_name_tab(gcnt) := #{game};
--        tg_price_tab(gcnt)  := #{price};
--    </foreach>
    
    
    -- mybatis 대신 테스트 위해, 더미 넣기
     for k in 1..4 loop
     
        gcnt := gcnt +1;
        
        tg_name_tab(gcnt) := '겜이다'||gcnt;
        tg_price_tab(gcnt)  := gcnt*100;
        
     end loop; 
    
        
    -- 조건 3가지에 따른 update
        IF tg_name_tab.count = tg_no_tab.count THEN

           for cnt in 1..tg_no_tab.count  loop     
                -- j := j +1;             
                update trade_game SET tg_name = tg_name_tab(cnt), tg_price = tg_price_tab(cnt) where tg_no = tg_no_tab(cnt);
                commit;        
            end loop;

        ELSIF tg_name_tab.count > tg_no_tab.count THEN

           for cnt in 1..tg_no_tab.count  loop     
                -- j := j +1;             
                update trade_game SET tg_name = tg_name_tab(cnt), tg_price = tg_price_tab(cnt) where tg_no = tg_no_tab(cnt);
                commit;        
            end loop;
            
            for cnt in tg_no_tab.count+1..tg_name_tab.count  loop     
                -- j := j +1;             
                insert into trade_game  (tg_no, t_no, g_no, tg_name, tg_price) values (get_trade_game_seq, v_t_no, null,  tg_name_tab(cnt), tg_price_tab(cnt));
                commit;        
            end loop;

        ELSE

           for cnt in 1..tg_name_tab.count  loop     
                -- j := j +1;             
                update trade_game SET tg_name = tg_name_tab(cnt), tg_price = tg_price_tab(cnt) where tg_no = tg_no_tab(cnt);
                commit;        
            end loop;
            
            for cnt in tg_name_tab.count+1..tg_no_tab.count  loop     
                -- j := j +1;                    
                DELETE 	FROM trade_game WHERE tg_no = tg_no_tab(cnt);
                commit;        
            end loop;

        END IF;

   END;
   /

commit;


-- 현재 시퀀스 값
select TRADE_GAME_SEQ.currval from sys.dual;
commit;
