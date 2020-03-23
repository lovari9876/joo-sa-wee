CREATE TABLE "MEMBER" (
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_ID"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"M_PW"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"M_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"M_BIRTH"	DATE	DEFAULT ''	NOT NULL,
	"M_NICK"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"M_GENDER"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL,
	"M_POINT"	NUMBER(10)	DEFAULT 0	NULL,
	"M_PHONE"	VARCHAR2(22)	DEFAULT ''	NOT NULL,
	"M_EMAIL"	VARCHAR2(100)		NOT NULL,
	"M_POST"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"M_ADDR1"	VARCHAR2(200)		NOT NULL,
	"M_ADDR2"	VARCHAR2(200)		NULL,
	"R_NO"	NUMBER(15)	DEFAULT ''	NULL,
	"M_RE_SMS"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL,
	"M_RE_NOTICE"	VARCHAR2(2)	DEFAULT 'n'	NULL,
	"M_RE_MESSAGE"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL,
	"M_INFO"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL,
	"M_SELF"	VARCHAR2(400)	DEFAULT ''	NULL,
	"M_INDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"M_OUTDATE"	DATE	DEFAULT SYSDATE	NULL,
	"M_OUT"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL,
	"M_REPORT_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"M_EXTRA"	VARCHAR2(100)	DEFAULT ''	NULL,
	"F_NO"	NUMBER(15)	DEFAULT ''	NULL
);

CREATE TABLE "GAME_CLASS" (
	"G_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"GC_TYPE"	VARCHAR2(100)	DEFAULT ''	NOT NULL,
	"GC_NUM"	NUMBER(10)	DEFAULT 0	NOT NULL
);

CREATE TABLE "GAME" (
	"G_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"G_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"G_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"G_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"G_HIT"	NUMBER(10)	DEFAULT 0	NULL,
	"G_RECOMMEND_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"G_DESIGNER"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"G_MIN"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"G_MAX"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"G_PLAYTIME"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"G_AGE"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"G_DIFFICULTY"	NUMBER(10)	DEFAULT 0	NULL,
	"G_RELEASE"	DATE	DEFAULT SYSDATE	NULL,
	"G_LEVEL"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"G_RULETIME"	NUMBER(10)	DEFAULT 0	NULL,
	"G_LANG"	NUMBER(10)	DEFAULT 0	NULL,
	"G_INTER"	NUMBER(10)	DEFAULT 0	NULL,
	"G_THEME"	NUMBER(10)	DEFAULT 0	NULL,
	"G_REPLAY"	NUMBER(10)	DEFAULT 0	NULL,
	"G_ARTWORK"	NUMBER(10)	DEFAULT 0	NULL,
	"G_CONTENTS"	NUMBER(10)	DEFAULT 0	NULL,
	"G_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"F_NO"	NUMBER(15)	DEFAULT ''	NOT NULL
);

CREATE TABLE "GAME_PERSON" (
	"G_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"GP_PERSON"	NUMBER(10)		NOT NULL,
	"GP_NUM"	NUMBER(10)	DEFAULT 0	NOT NULL
);

CREATE TABLE "GAME_SORT" (
	"GS_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"GS_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL
);

CREATE TABLE "GAME_THEME" (
	"GT_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"GT_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL
);

CREATE TABLE "GAME_METHOD" (
	"GM_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"GM_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL
);

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"S_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"FAQ_TITLE"	VARCHAR2(100)		NOT NULL,
	"FAQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"FAQ_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FAQ_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FAQ_HIT"	NUMBER(10)	DEFAULT 0	NULL
);

CREATE TABLE "REPORT" (
	"R_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"R_TYPE"	VARCHAR2(100)	DEFAULT ''	NOT NULL,
	"R_TYPE_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"R_CONTENT"	VARCHAR2(400)	DEFAULT ''	NOT NULL,
	"R_REPORT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "SUBJECT" (
	"S_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"BT_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"S_CONTENT"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "CM_COMMENT" (
	"CM_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"CM_CONTENT"	VARCHAR2(400)	DEFAULT ''	NULL,
	"CM_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CM_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CM_TYPE"	VARCHAR2(100)	DEFAULT ''	NOT NULL,
	"CM_NO2"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"CM_RECOMMEND_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"CM_REPORT_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"CM_RATING"	NUMBER(1)	DEFAULT 5	NULL,
	"CM_GROUP"	NUMBER(10)	DEFAULT 0	NULL,
	"CM_STEP"	NUMBER(10)	DEFAULT 0	NULL,
	"CM_INDENT"	NUMBER(10)	DEFAULT 0	NULL
);

CREATE TABLE "WD_RECORD" (
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"W_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"WR_REASON"	VARCHAR2(400)	DEFAULT ''	NULL
);

CREATE TABLE "TRADE" (
	"T_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"S_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"T_TITLE"	VARCHAR2(100)		NOT NULL,
	"T_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"T_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"T_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"T_HIT"	NUMBER(10)	DEFAULT 0	NULL,
	"T_RECOMMEND_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"T_REPORT_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"T_ISLAND"	NUMBER(1)	DEFAULT 0	NOT NULL,
	"T_PRICE"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"T_IS_CLOSED"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL
);

CREATE TABLE "CAFE" (
	"C_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"C_TITLE"	VARCHAR2(100)		NOT NULL,
	"C_ADD"	VARCHAR2(200)		NOT NULL,
	"C_PHONE"	VARCHAR2(22)	DEFAULT ''	NOT NULL,
	"C_PEOPLE"	NUMBER(10)	DEFAULT 0	NULL,
	"C_TABLE"	NUMBER(3)	DEFAULT 0	NULL,
	"C_CHAIR"	NUMBER(3)	DEFAULT 0	NULL,
	"C_OPEN"	VARCHAR2(20)	DEFAULT ''	NULL,
	"C_CLOSE"	VARCHAR2(20)	DEFAULT ''	NULL,
	"C_REST"	VARCHAR2(100)	DEFAULT ''	NULL,
	"C_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"C_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"C_HIT"	NUMBER(10)	DEFAULT 0	NULL
);

CREATE TABLE "WITHDRAWAL" (
	"W_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"W_REASON"	VARCHAR2(400)	DEFAULT ''	NULL
);

CREATE TABLE "RANK" (
	"R_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"R_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL
);

CREATE TABLE "CAFE_REVIEW" (
	"CR_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"C_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"CR_TITLE"	VARCHAR2(100)		NOT NULL,
	"CR_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CR_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CR_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CR_HIT"	NUMBER(10)	DEFAULT 0	NULL,
	"CR_RECOMMEND_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"CR_REPORT_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"CR_ISLAND"	NUMBER(1)	DEFAULT 0	NOT NULL
);

CREATE TABLE "SCRAP" (
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"SC_BOARDTYPE"	VARCHAR2(100)	DEFAULT ''	NOT NULL,
	"SC_NO"	NUMBER(15)	DEFAULT ''	NOT NULL
);

CREATE TABLE "BOARD_TYPE" (
	"BT_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"BT_NAME"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"BT_INFO"	VARCHAR2(100)	DEFAULT ''	NULL,
	"BT_EXTRA"	VARCHAR2(100)	DEFAULT ''	NULL
);

CREATE TABLE "BOARD_WRITE" (
	"BW_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"BT_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"S_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"BW_TITLE"	VARCHAR2(100)		NOT NULL,
	"BW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BW_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BW_UPDATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BW_HIT"	NUMBER(10)	DEFAULT 0	NULL,
	"BW_RECOMMEND_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"BW_REPORT_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"BW_ISLAND"	NUMBER(1)	DEFAULT 0	NOT NULL,
	"BW_SECRET"	VARCHAR2(2)	DEFAULT 'n'	NOT NULL
);

CREATE TABLE "NOTE" (
	"N_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO2"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"N_TITLE"	VARCHAR2(100)		NOT NULL,
	"N_CONTENT"	VARCHAR2(400)	DEFAULT ''	NOT NULL,
	"N_WRITTEN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "STATISTICS" (
	"ST_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"ST_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"ST_VISITOR_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"ST_POST_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"ST_TRADE_NUM"	NUMBER(10)	DEFAULT 0	NULL,
	"ST_COMMENT_NUM"	NUMBER(10)	DEFAULT 0	NULL
);

CREATE TABLE "PAYMENT" (
	"P_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"T_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_SNO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_BNO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"P_PRICE"	NUMBER(10)	DEFAULT 0	NOT NULL,
	"P_STATUS"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"P_ORDER_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"P_PAYMENT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PAYMENT"."P_STATUS" IS '거래 상태: 1.입금대기 2.결제완료 3.배송준비중 4.배송완료 (관리자 승인 후) 5.거래완료(판매자에게 입금완료)';

CREATE TABLE "F_FILE" (
	"F_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"F_NAME"	VARCHAR2(200)	DEFAULT ''	NOT NULL,
	"F_TYPE"	VARCHAR2(100)	DEFAULT ''	NOT NULL,
	"F_PATH"	VARCHAR2(400)	DEFAULT ''	NOT NULL,
	"F_USE"	VARCHAR2(400)	DEFAULT ''	NULL
);

CREATE TABLE "SPONSOR" (
	"SP_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"M_NO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"SP_MONEY"	NUMBER(10)	DEFAULT 0	NULL,
	"SP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "BOARD_FILE" (
	"BF_TYPE"	VARCHAR2(40)	DEFAULT ''	NOT NULL,
	"BF_WNO"	NUMBER(15)	DEFAULT ''	NOT NULL,
	"F_NO"	NUMBER(15)	DEFAULT ''	NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"M_NO"
);

ALTER TABLE "GAME" ADD CONSTRAINT "PK_GAME" PRIMARY KEY (
	"G_NO"
);

ALTER TABLE "GAME_SORT" ADD CONSTRAINT "PK_GAME_SORT" PRIMARY KEY (
	"GS_NO"
);

ALTER TABLE "GAME_THEME" ADD CONSTRAINT "PK_GAME_THEME" PRIMARY KEY (
	"GT_NO"
);

ALTER TABLE "GAME_METHOD" ADD CONSTRAINT "PK_GAME_METHOD" PRIMARY KEY (
	"GM_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"R_NO"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "PK_SUBJECT" PRIMARY KEY (
	"S_NO"
);

ALTER TABLE "CM_COMMENT" ADD CONSTRAINT "PK_CM_COMMENT" PRIMARY KEY (
	"CM_NO"
);

ALTER TABLE "WD_RECORD" ADD CONSTRAINT "PK_WD_RECORD" PRIMARY KEY (
	"M_NO"
);

ALTER TABLE "TRADE" ADD CONSTRAINT "PK_TRADE" PRIMARY KEY (
	"T_NO"
);

ALTER TABLE "CAFE" ADD CONSTRAINT "PK_CAFE" PRIMARY KEY (
	"C_NO"
);

ALTER TABLE "WITHDRAWAL" ADD CONSTRAINT "PK_WITHDRAWAL" PRIMARY KEY (
	"W_NO"
);

ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY (
	"R_NO"
);

ALTER TABLE "CAFE_REVIEW" ADD CONSTRAINT "PK_CAFE_REVIEW" PRIMARY KEY (
	"CR_NO"
);

ALTER TABLE "SCRAP" ADD CONSTRAINT "PK_SCRAP" PRIMARY KEY (
	"M_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BT_NO"
);

ALTER TABLE "BOARD_WRITE" ADD CONSTRAINT "PK_BOARD_WRITE" PRIMARY KEY (
	"BW_NO"
);

ALTER TABLE "NOTE" ADD CONSTRAINT "PK_NOTE" PRIMARY KEY (
	"N_NO"
);

ALTER TABLE "STATISTICS" ADD CONSTRAINT "PK_STATISTICS" PRIMARY KEY (
	"ST_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"P_NO"
);

ALTER TABLE "F_FILE" ADD CONSTRAINT "PK_F_FILE" PRIMARY KEY (
	"F_NO"
);

ALTER TABLE "SPONSOR" ADD CONSTRAINT "PK_SPONSOR" PRIMARY KEY (
	"SP_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_RANK_TO_MEMBER_1" FOREIGN KEY (
	"R_NO"
)
REFERENCES "RANK" (
	"R_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_F_FILE_TO_MEMBER_1" FOREIGN KEY (
	"F_NO"
)
REFERENCES "F_FILE" (
	"F_NO"
);

ALTER TABLE "GAME_CLASS" ADD CONSTRAINT "FK_GAME_TO_GAME_CLASS_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GAME" (
	"G_NO"
);

ALTER TABLE "GAME" ADD CONSTRAINT "FK_F_FILE_TO_GAME_1" FOREIGN KEY (
	"F_NO"
)
REFERENCES "F_FILE" (
	"F_NO"
);

ALTER TABLE "GAME_PERSON" ADD CONSTRAINT "FK_GAME_TO_GAME_PERSON_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GAME" (
	"G_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "FK_SUBJECT_TO_FAQ_1" FOREIGN KEY (
	"S_NO"
)
REFERENCES "SUBJECT" (
	"S_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_BOARD_TYPE_TO_SUBJECT_1" FOREIGN KEY (
	"BT_NO"
)
REFERENCES "BOARD_TYPE" (
	"BT_NO"
);

ALTER TABLE "CM_COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_CM_COMMENT_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "WD_RECORD" ADD CONSTRAINT "FK_MEMBER_TO_WD_RECORD_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "WD_RECORD" ADD CONSTRAINT "FK_WITHDRAWAL_TO_WD_RECORD_1" FOREIGN KEY (
	"W_NO"
)
REFERENCES "WITHDRAWAL" (
	"W_NO"
);

ALTER TABLE "TRADE" ADD CONSTRAINT "FK_MEMBER_TO_TRADE_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "TRADE" ADD CONSTRAINT "FK_SUBJECT_TO_TRADE_1" FOREIGN KEY (
	"S_NO"
)
REFERENCES "SUBJECT" (
	"S_NO"
);

ALTER TABLE "CAFE_REVIEW" ADD CONSTRAINT "FK_CAFE_TO_CAFE_REVIEW_1" FOREIGN KEY (
	"C_NO"
)
REFERENCES "CAFE" (
	"C_NO"
);

ALTER TABLE "CAFE_REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_CAFE_REVIEW_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "SCRAP" ADD CONSTRAINT "FK_MEMBER_TO_SCRAP_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "BOARD_WRITE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_WRITE_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "BOARD_WRITE" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_WRITE_1" FOREIGN KEY (
	"BT_NO"
)
REFERENCES "BOARD_TYPE" (
	"BT_NO"
);

ALTER TABLE "BOARD_WRITE" ADD CONSTRAINT "FK_SUBJECT_TO_BOARD_WRITE_1" FOREIGN KEY (
	"S_NO"
)
REFERENCES "SUBJECT" (
	"S_NO"
);

ALTER TABLE "NOTE" ADD CONSTRAINT "FK_MEMBER_TO_NOTE_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "NOTE" ADD CONSTRAINT "FK_MEMBER_TO_NOTE_2" FOREIGN KEY (
	"M_NO2"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_TRADE_TO_PAYMENT_1" FOREIGN KEY (
	"T_NO"
)
REFERENCES "TRADE" (
	"T_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_MEMBER_TO_PAYMENT_1" FOREIGN KEY (
	"M_SNO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_MEMBER_TO_PAYMENT_2" FOREIGN KEY (
	"M_BNO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "SPONSOR" ADD CONSTRAINT "FK_MEMBER_TO_SPONSOR_1" FOREIGN KEY (
	"M_NO"
)
REFERENCES "MEMBER" (
	"M_NO"
);

ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "FK_F_FILE_TO_BOARD_FILE_1" FOREIGN KEY (
	"F_NO"
)
REFERENCES "F_FILE" (
	"F_NO"
);

