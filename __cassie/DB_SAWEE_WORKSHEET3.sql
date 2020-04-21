COMMIT;

-- PAYMENT SEQUENCE
CREATE SEQUENCE  "DB_SAWEE"."PAYMENT_SEQ"  MINVALUE 1 INCREMENT BY 1  CACHE 20 ; 
COMMIT;

-- SPONSOR SEQUENCE
CREATE SEQUENCE  "DB_SAWEE"."SPONSOR_SEQ"  MINVALUE 1 INCREMENT BY 1  CACHE 20 ; 


-- 결제 테이블에 TRADE_GAME의 TG_NO 다치로 들어가는 것.. 
CREATE TABLE "PAYMENT_TRADE_GAME" (
	"PTG_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"P_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"TG_NO"	NUMBER(15)	DEFAULT ''	NOT NULL
);

COMMENT ON COLUMN "PAYMENT_TRADE_GAME"."TG_NO" IS '중고거래에서 해당 게임을 호출하기 위한 번호..';

ALTER TABLE "PAYMENT_TRADE_GAME" ADD CONSTRAINT "PK_PAYMENT_TRADE_GAME" PRIMARY KEY (
	"PTG_NO"
);

ALTER TABLE "PAYMENT_TRADE_GAME" ADD CONSTRAINT "FK_PAYMENT_TO_PTG" FOREIGN KEY (
	"P_NO"
)
REFERENCES "PAYMENT" (
	"P_NO"
);

ALTER TABLE "PAYMENT_TRADE_GAME" ADD CONSTRAINT "FK_TRADE_GAME_TO_PTG" FOREIGN KEY (
	"TG_NO"
)
REFERENCES "TRADE_GAME" (
	"TG_NO"
);

COMMIT;

-- PAYMENT_TRADE_GAME SEQUENCE
CREATE SEQUENCE  "DB_SAWEE"."PAYMENT_TRADE_GAME_SEQ"  MINVALUE 1 INCREMENT BY 1  CACHE 20 ; 


select SUM(tg_price) FROM trade_game where t_no = 389;


-- 또 declare... 이번엔 payment와 ptg 동시 insert 및 payment에 금액 합계 계산 위해..
            DECLARE
			      
                TYPE tg_no_table IS TABLE OF trade_game.tg_no%TYPE 
                INDEX BY BINARY_INTEGER;             
                TYPE tg_name_table IS TABLE OF trade_game.tg_name%TYPE 
                INDEX BY BINARY_INTEGER;       
                TYPE tg_price_table IS TABLE OF trade_game.tg_price%TYPE 
                INDEX BY BINARY_INTEGER;     
                
                
                tg_no_tab       tg_no_table;           	--  tg_no 담기 -->
                tg_name_tab    tg_name_table;		--  mybatis  foreach 로 게임 담기 -->
                tg_price_tab    tg_price_table;         --  mybatis  foreach 로 가격 담기 -->
                
                nocnt binary_integer :=0;
                gcnt binary_integer :=0;
                j binary_integer :=0;
                
                -- 변수 선언 -->
                v_sum     payment.p_price%type := 0;
                v_t_no     trade_game.t_no%type := 389;
                v_p_no    payment.p_no%type := payment_seq.nextval;
			     
			
            BEGIN
            
--                <!-- mybatis  foreach 로 번호, 게임, 가격 담기-->
--                <foreach collection="tg_noList" item="tg_no">	
--                
--                    nocnt := nocnt +1;
--                    tg_no_tab(nocnt) := #{tg_no};
--                                
--                    SELECT tg_name, tg_price
--                    INTO tg_name_tab(nocnt), tg_price_tab(nocnt)
--                    FROM trade_game
--                    WHERE tg_no =  tg_no_tab(nocnt);
--
--                </foreach>    

                for tgno in 19..21  loop 
                    nocnt := nocnt +1;
                    tg_no_tab(nocnt) := tgno;
                                
                    SELECT tg_name, tg_price
                    INTO tg_name_tab(nocnt), tg_price_tab(nocnt)
                    FROM trade_game
                    WHERE tg_no =  tg_no_tab(nocnt);
                end loop;


                
                -- 결제할 가격 합계 구하기
                for cnt in 1..tg_price_tab.count  loop 
                    v_sum := v_sum + tg_price_tab(cnt);
                end loop;
            
            
                -- payment  insert
                INSERT 
                INTO
                    PAYMENT 
                    (P_NO, T_NO, M_SNO, M_BNO, P_PRICE) 
                VALUES 
                    (v_p_no, v_t_no, 44, 9, v_sum );
                COMMIT;
                    
                -- payment_trade_game  insert
                for cnt in 1..tg_no_tab.count  loop 
                    INSERT 
                    INTO
                        PAYMENT_TRADE_GAME
                        (PTG_NO, P_NO, TG_NO) 
                    VALUES 
                        (payment_trade_game_seq.nextval, v_p_no, tg_no_tab(cnt) );
                    COMMIT;
                end loop;                
 
			
            END;
/
		
        -- 거래 하나의 ptgList
        SELECT
			PTG.PTG_NO, PTG.P_NO, TG.*
		FROM
			PAYMENT_TRADE_GAME PTG
		LEFT JOIN
			TRADE_GAME TG
		ON
			PTG.TG_NO = TG.TG_NO
		WHERE
			PTG.P_NO = #{p_no};
            
            
-- 삭제 우선순위에 따라 trade 글 삭제도 게임 트레이드 삭제부터 선행해야함...
-- 그래서 declare3....
            DECLARE
			     
			
            BEGIN
            
                DELETE 
                FROM 
                    TRADE_GAME
                WHERE 
                    T_NO = #{t_no};
                COMMIT;
            
                DELETE 
                FROM 
                    TRADE 
                WHERE 
                    T_NO = #{t_no};
                COMMIT;
            
			
            END;
/


COMMIT;



-- 후원한 회원 포인트 업뎃
update 
member m
set
m.m_point = m.m_point + (select sp.sp_money from sponsor sp where sp.sp_no = 4)
where m.m_no = (select sp.m_no from sponsor sp where sp.sp_no = 4) ;


-- tLIST

		SELECT 
			*
		FROM 
		
			(	
			SELECT 
				NEWT.*, 
				ROW_NUMBER() OVER(
					ORDER BY T_NO DESC
				) AS RNUM 
			FROM 			
				(
				SELECT 
					T.*, M.M_NICK, M.M_ID, S.S_CONTENT, F.F_NAME,
					(SELECT COUNT(*) FROM CM_COMMENT WHERE CM_NO2 = T.T_NO) CM					
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
				LEFT OUTER JOIN
				    BOARD_FILE BF
				ON
				    BF.BF_WNO = T.T_NO
				LEFT JOIN
				    F_FILE F
				ON
				    F.F_NO = BF.F_NO						
				WHERE 
					1=1 AND T.T_ISLAND = 0
                    
                    
					AND F.F_NO IN 
								(SELECT 
									MAX(BF.F_NO)
								FROM 
									BOARD_FILE BF 
								WHERE 
									BF.BT_NO = 9 
								GROUP BY 
									BF.BF_WNO 
								) 
                AND F.F_NAME IS NULL
                                --<!-- 파일 번호를 T_NO으로 그룹바이해서 출력 -->
				) NEWT				
			)	
			
		WHERE 1=1
			
			ORDER BY T_NO DESC
            ;

		SELECT 
			*
		FROM 
		
			(	
			SELECT 
				NEWT.*, 
				ROW_NUMBER() OVER(
					<choose> <!-- 조회순, 신고순 -->
						<when test = "sort == 'hit'">ORDER BY T_HIT DESC</when>
						<when test = "sort == 'report'">ORDER BY T_REPORT_NUM DESC </when>
						<otherwise>ORDER BY T_NO DESC</otherwise>
					</choose>
				) AS RNUM 
			FROM 			
				(
				SELECT 
					T.*, M.M_NICK, M.M_ID, S.S_CONTENT, F.F_NAME,
					(SELECT COUNT(*) FROM CM_COMMENT WHERE CM_NO2 = T.T_NO) CM					
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
				    BOARD_FILE BF
				ON
				    BF.BF_WNO = T.T_NO
				LEFT JOIN
				    F_FILE F
				ON
				    F.F_NO = BF.F_NO						
				WHERE 
					1=1 AND T.T_ISLAND = 0
					<include refid="subjectSearch"></include> <!-- 말머리 검색 -->
					<include refid="tradeSearch"></include>	<!-- 검색어 검색 -->
					<if test="F.F_NAME != null"> 
						AND F.F_NO IN 
							(SELECT 
								MAX(BF.F_NO)
							FROM 
								BOARD_FILE BF 
							WHERE 
								BF.BT_NO = 9 
							GROUP BY 
								BF.BF_WNO 
							) <!-- 파일 번호를 T_NO으로 그룹바이해서 출력 -->
					</if>						

				) NEWT				
			)	
			
		WHERE 
			RNUM BETWEEN #{scri.rowStart} AND #{scri.rowEnd}
			<choose>
				<when test = "sort == 'hit'">ORDER BY T_HIT DESC</when>
				<when test = "sort == 'report'">ORDER BY T_REPORT_NUM DESC </when>
				<otherwise>ORDER BY T_NO DESC</otherwise>
			</choose>
;
/
































