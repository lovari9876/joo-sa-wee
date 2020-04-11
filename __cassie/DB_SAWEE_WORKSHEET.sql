SELECT TRADE.* FROM TRADE ORDER BY T_NO DESC;

SELECT TRADE.* FROM TRADE WHERE T_ISLAND != 0 ORDER BY T_WRITTEN_DATE DESC;

SELECT BOARD_WRITE.* FROM BOARD_WRITE 
		WHERE bw_island != 0 
		ORDER BY BW_WRITTEN_DATE DESC;
        
        
CREATE TABLE "BOARD_GAME" (
	"BT_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"G_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"BG_WNO"	NUMBER(15)	DEFAULT ''	NOT NULL
);

COMMENT ON COLUMN "BOARD_GAME"."BG_WNO" IS '중복가능...  다치 때문..';

ALTER TABLE "BOARD_GAME" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_GAME_1" FOREIGN KEY (
	"BT_NO"
)
REFERENCES "BOARD_TYPE" (
	"BT_NO"
);

ALTER TABLE "BOARD_GAME" ADD CONSTRAINT "FK_GAME_TO_BOARD_GAME_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GAME" (
	"G_NO"
);

     COMMIT;   

-- select member_bno, 
-- user_id, 
-- reg_date, 
-- viewcnt, 
-- title, 
-- rcnt, 
-- content, 
-- recommend,
-- row_number() over (order by recommend desc, viewcnt desc) as rk
-- from 
--    (
--    select recommend, member_bno, user_id, reg_date, viewcnt, title, rcnt, content
--    from member_board


--select * from (
--SELECT TRADE.* FROM TRADE WHERE T_ISLAND != 0 ORDER BY T_NO DESC;
--
--SELECT BOARD_WRITE.* FROM BOARD_WRITE 
--		WHERE bw_island != 0 
--		ORDER BY BW_NO DESC);
    
CREATE SEQUENCE trade_seq
INCREMENT BY 1
MINVALUE 1
START WITH 15;
commit;
    
insert into trade (
T_NO,
M_NO,
bt_no,
S_NO,
T_TITLE,
T_CONTENT,
T_WRITTEN_DATE,
T_UPDATED_DATE,
T_HIT,
T_RECOMMEND_NUM,
T_REPORT_NUM,
T_ISLAND,
T_PRICE) values (trade_seq.nextval, 3, 9, 32, '팔아연18',	'이것저것 팔아염18',	sysdate, sysdate, 0, 0, 0, 0, 0);

commit;

SELECT T.*, M.M_NICK FROM TRADE T, MEMBER M 
WHERE T_ISLAND != 0 AND T.M_NO = M.M_NO
ORDER BY T_WRITTEN_DATE DESC;

SELECT T.*, M.M_NICK FROM TRADE T LEFT JOIN MEMBER M 
ON T.M_NO = M.M_NO
WHERE T_ISLAND != 0 
ORDER BY T_WRITTEN_DATE DESC;

commit;

-- 신고자와 신고 대상자 동시에 뽑는 쿼리        
SELECT r.r_no, r.m_no, m1.m_id as reporter, r.r_content, r.r_report_date, r.r_type, r.r_type_no, m2.m_id as repoted, m1.m_report_num

FROM report r

LEFT JOIN member m1

ON r.m_no=m1.m_no

LEFT JOIN member m2

ON r.r_type_no= m2.m_no;


		SELECT bw.* , m.m_nick
        FROM BOARD_WRITE bw
        left join member m
        on bw.m_no = m.m_no
		WHERE BW_ISLAND != 0 
		ORDER BY BW_WRITTEN_DATE DESC;
        
        SELECT cr.*
        FROM CAFE_REVIEW cr
        left join member m
        on cr.m_no = m.m_no
		WHERE CR_ISLAND != 0 
		ORDER BY CR_WRITTEN_DATE DESC;
        

        
-- 무인도 출력 쿼리 완성...         
		SELECT
				ROW_NUMBER() OVER(ORDER BY i_WRITTEN_DATE, I_NO) AS rnum, 
		        i_no, bt_no, s_no, m_no, m_nick, i_title, i_content,
		        i_written_date, i_updated_date, 
		        i_hit, i_recommend_num, i_report_num,i_island
		FROM
			(
			        (SELECT 
			        		t.t_no as i_no, t.bt_no, t.s_no, t.m_no, M.M_NICK, t.t_title as i_title, t.t_content as i_content, 
			                t.t_written_date as i_WRITTEN_DATE, t.t_updated_date as i_updated_date, 
			                t.t_hit as i_hit, t.t_recommend_num as i_recommend_num, t.t_report_num as i_report_num, t.t_island as i_island 
			        FROM 	
			        		TRADE T 
			        LEFT JOIN 
			        		MEMBER M 
			        ON 		
			        		T.M_NO = M.M_NO
			        WHERE 	
			        		T_ISLAND != 0 ) 
			
			union
			
					(SELECT 
							bw.bw_no as i_no, bw.bt_no, bw.s_no, bw.m_no, M.M_NICK, bw.bw_title  as i_title, bw.bw_content as i_content, 
							bw.bw_written_date as i_WRITTEN_DATE, bw.bw_updated_date as i_updated_date, 
			                bw.bw_hit as i_hit, bw.bw_recommend_num as i_recommend_num, bw.bw_report_num as i_report_num, bw.bw_island as i_island 
			        FROM 
			        		BOARD_WRITE bw
			        left join 
			        		member m
			        on 
			        		bw.m_no = m.m_no
					WHERE 
							BW_ISLAND != 0 ) 
			
			UNION
			
			        (SELECT 
			        		cr.cr_no as i_no, cr.bt_no, null, cr.m_no, M.M_NICK, cr.cr_title as i_title, cr.cr_content as i_content, 
		                    cr.cr_written_date as i_WRITTEN_DATE, cr.cr_updated_date as i_updated_date, 
		                    cr.cr_hit as i_hit, cr.cr_recommend_num as i_recommend_num, cr.cr_report_num as i_report_num, cr.cr_island as i_island
			        FROM 
			        		CAFE_REVIEW cr
			        left join 
			        		member m
			        on 
			        		cr.m_no = m.m_no
					WHERE 
							CR_ISLAND != 0 ) 
			)
		ORDER BY RNUM DESC;


-- board_write_seq 만들기
CREATE SEQUENCE board_write_seq
INCREMENT BY 1
MINVALUE 1
START WITH 43;
commit;


-- board_write에 더미 데이터 쌓기
-- 예시
insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;
commit;

insert into board_write (BW_NO, bt_no, M_NO, S_NO, BW_TITLE, BW_CONTENT)
select BOARD_WRITE_SEQ.nextval,bt_no, m_no, s_no, bW_title, bw_content from board_write;

commit;

select *  from board_write;


		SELECT 
			T.*
		FROM (
				SELECT 
					T.*, M.M_NICK, ROW_NUMBER() OVER(ORDER BY T_NO DESC) AS RNUM 
				FROM
					TRADE T
				LEFT JOIN
					MEMBER M
				ON T.M_NO = M.M_NO
				WHERE 
					T_TITLE LIKE '%' || '1' || '%'
			) T
		ORDER BY
			T_WRITTEN_DATE DESC;
          
          
-- trade 에 더미 쌓기            
insert into trade (t_NO, M_NO, S_NO, t_TITLE, t_CONTENT, t_island)
select TRADE_SEQ.nextval, m_no, s_no, t_title, t_content, t_island from trade;

select * from trade;

commit;        
            
            
-- 무인도 글 개수 세기            
		SELECT
				COUNT(*)
		FROM
			(
				
			        (SELECT 
			        		T.T_NO AS I_NO, T.BT_NO, T.S_NO, T.M_NO, M.M_NICK, T.T_TITLE AS I_TITLE, T.T_CONTENT AS I_CONTENT, 
			                T.T_WRITTEN_DATE AS I_WRITTEN_DATE, T.T_UPDATED_DATE AS I_UPDATED_DATE, 
			                T.T_HIT AS I_HIT, T.T_RECOMMEND_NUM AS I_RECOMMEND_NUM, T.T_REPORT_NUM AS I_REPORT_NUM, T.T_ISLAND AS I_ISLAND 
			        FROM 	
			        		TRADE T 
			        LEFT JOIN 
			        		MEMBER M 
			        ON 		
			        		T.M_NO = M.M_NO
			        WHERE 	
			        		T_ISLAND != 0 ) 
			
			UNION
			
					(SELECT 
							BW.BW_NO AS I_NO, BW.BT_NO, BW.S_NO, BW.M_NO, M.M_NICK, BW.BW_TITLE  AS I_TITLE, BW.BW_CONTENT AS I_CONTENT, 
							BW.BW_WRITTEN_DATE AS I_WRITTEN_DATE, BW.BW_UPDATED_DATE AS I_UPDATED_DATE, 
			                BW.BW_HIT AS I_HIT, BW.BW_RECOMMEND_NUM AS I_RECOMMEND_NUM, BW.BW_REPORT_NUM AS I_REPORT_NUM, BW.BW_ISLAND AS I_ISLAND 
			        FROM 
			        		BOARD_WRITE BW
			        LEFT JOIN 
			        		MEMBER M
			        ON 
			        		BW.M_NO = M.M_NO
					WHERE 
							BW_ISLAND != 0 ) 
			
			UNION
			
			        (SELECT 
			        		CR.CR_NO AS I_NO, CR.BT_NO, NULL, CR.M_NO, M.M_NICK, CR.CR_TITLE AS I_TITLE, CR.CR_CONTENT AS I_CONTENT, 
		                    CR.CR_WRITTEN_DATE AS I_WRITTEN_DATE, CR.CR_UPDATED_DATE AS I_UPDATED_DATE, 
		                    CR.CR_HIT AS I_HIT, CR.CR_RECOMMEND_NUM AS I_RECOMMEND_NUM, CR.CR_REPORT_NUM AS I_REPORT_NUM, CR.CR_ISLAND AS I_ISLAND
			        FROM 
			        		CAFE_REVIEW CR
			        LEFT JOIN 
			        		MEMBER M
			        ON 
			        		CR.M_NO = M.M_NO
					WHERE 
							CR_ISLAND != 0 ) 
							
			);
            
            
            
-- 무인도 글 순서 미쳤다            
SELECT
				*
		FROM
			(
			SELECT
				ROW_NUMBER() OVER(ORDER BY I_WRITTEN_DATE ASC, I_NO ASC) AS RNUM,
				ROW_NUMBER() OVER(ORDER BY I_WRITTEN_DATE DESC, I_NO DESC) AS RNUM_COUNT,
				I.*
			FROM
				(
				        (
					        SELECT 
					        		T.T_NO AS I_NO, T.BT_NO, T.S_NO, T.M_NO, M.M_NICK, T.T_TITLE AS I_TITLE, T.T_CONTENT AS I_CONTENT, 
					                T.T_WRITTEN_DATE AS I_WRITTEN_DATE, T.T_UPDATED_DATE AS I_UPDATED_DATE, 
					                T.T_HIT AS I_HIT, T.T_RECOMMEND_NUM AS I_RECOMMEND_NUM, T.T_REPORT_NUM AS I_REPORT_NUM, T.T_ISLAND AS I_ISLAND 
					        FROM 	
					        		TRADE T 
					        LEFT JOIN 
					        		MEMBER M 
					        ON 		
					        		T.M_NO = M.M_NO
					        WHERE 	
					        		T_ISLAND != 0 ) 
					
					UNION
					
							(SELECT 
									BW.BW_NO AS I_NO, BW.BT_NO, BW.S_NO, BW.M_NO, M.M_NICK, BW.BW_TITLE  AS I_TITLE, BW.BW_CONTENT AS I_CONTENT, 
									BW.BW_WRITTEN_DATE AS I_WRITTEN_DATE, BW.BW_UPDATED_DATE AS I_UPDATED_DATE, 
					                BW.BW_HIT AS I_HIT, BW.BW_RECOMMEND_NUM AS I_RECOMMEND_NUM, BW.BW_REPORT_NUM AS I_REPORT_NUM, BW.BW_ISLAND AS I_ISLAND 
					        FROM 
					        		BOARD_WRITE BW
					        LEFT JOIN 
					        		MEMBER M
					        ON 
					        		BW.M_NO = M.M_NO
							WHERE 
									BW_ISLAND != 0 ) 
					
					UNION
					
					        (SELECT 
					        		CR.CR_NO AS I_NO, CR.BT_NO, NULL, CR.M_NO, M.M_NICK, CR.CR_TITLE AS I_TITLE, CR.CR_CONTENT AS I_CONTENT, 
				                    CR.CR_WRITTEN_DATE AS I_WRITTEN_DATE, CR.CR_UPDATED_DATE AS I_UPDATED_DATE, 
				                    CR.CR_HIT AS I_HIT, CR.CR_RECOMMEND_NUM AS I_RECOMMEND_NUM, CR.CR_REPORT_NUM AS I_REPORT_NUM, CR.CR_ISLAND AS I_ISLAND
					        FROM 
					        		CAFE_REVIEW CR
					        LEFT JOIN 
					        		MEMBER M
					        ON 
					        		CR.M_NO = M.M_NO
							WHERE 
									CR_ISLAND != 0 ) 
					) I
			ORDER BY 
				RNUM DESC
				) 
		WHERE 
			RNUM_COUNT BETWEEN 1 AND 15
		ORDER BY 
			RNUM DESC;
            

-- 보부상에 글 쓸 때, 결제를 위해 게임 이름을 써줘야 하므로... 테이블 생성

CREATE TABLE "TRADE_GAME" (
	"TG_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"T_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"G_NO"	NUMBER(15)	DEFAULT ''	NULL,
	"TG_NAME"	VARCHAR2(40)	DEFAULT ''	NULL
);

COMMENT ON COLUMN "TRADE_GAME"."TG_NO" IS '중고거래에서 해당 게임을 호출하기 위한 번호..';

COMMENT ON COLUMN "TRADE_GAME"."G_NO" IS '등록된 게임의 경우 번호를 이용하여 게임정보와 연결한다.';

COMMENT ON COLUMN "TRADE_GAME"."TG_NAME" IS '등록되지 않은 게임의 경우 이름을 직접 쓴다';

ALTER TABLE "TRADE_GAME" ADD CONSTRAINT "PK_TRADE_GAME" PRIMARY KEY (
	"TG_NO"
);

ALTER TABLE "TRADE_GAME" ADD CONSTRAINT "FK_TRADE_TO_TRADE_GAME_1" FOREIGN KEY (
	"T_NO"
)
REFERENCES "TRADE" (
	"T_NO"
);

ALTER TABLE "TRADE_GAME" ADD CONSTRAINT "FK_GAME_TO_TRADE_GAME_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GAME" (
	"G_NO"
);

COMMIT;

-- 보부상 글 쓰기
		insert into
			trade 
			(t_no, m_no, s_no, t_title, t_content) 
		values 
			(trade_seq.nextval, 3, 33, '사고싶다리', '저...보드겜 사고싶어요리');
            
select * from trade;

-- trade_game 시퀀스 생성
CREATE SEQUENCE  "DB_SAWEE"."TRADE_GAME_SEQ"  MINVALUE 1 INCREMENT BY 1 START WITH 1 CACHE 20 ;


-- trade_game insert
		insert into
			trade_game 
			(TG_NO, t_no, G_no, TG_NAME ) 
		values 
			(TRADE_GAME_SEQ.NEXTVAL, 200, null, '제가 만든 게임2' ) ;
            
            
-- 포인트 업뎃            
    UPDATE 
			MEMBER 
		SET 
			M_POINT = M_POINT + 10 
		WHERE 
			M_NO = 7;
