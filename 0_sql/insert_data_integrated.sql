--------------------------------------------------------
--  File created - Monday-March-23-2020   
--------------------------------------------------------
REM INSERTING into CASSIE.BOARD_FILE
SET DEFINE OFF;
REM INSERTING into CASSIE.BOARD_TYPE
SET DEFINE OFF;
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (1,'보드이야기','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (2,'개봉기 및 리뷰','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (3,'보드게임 모임','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (4,'보드 뉴스','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (5,'질문과 답변','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (6,'창작 보드게임','커뮤니티',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (7,'자주하는 질문','헬프데스크',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (8,'일대일 문의','헬프데스크',null);
Insert into CASSIE.BOARD_TYPE (BT_NO,BT_NAME,BT_INFO,BT_EXTRA) values (9,'보부상','중고거래',null);
REM INSERTING into CASSIE.BOARD_WRITE
SET DEFINE OFF;
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (1,1,1,1,'게시글1','글 내용입니다리1',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (2,2,2,4,'게시글2','글 내용입니다리2',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (3,3,3,7,'게시글3','글 내용입니다리3',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (4,4,4,9,'게시글4','글 내용입니다리4',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (5,5,5,14,'게시글5','글 내용입니다리5',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (6,6,6,17,'게시글6','글 내용입니다리6',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (7,7,8,27,'게시글7','글 내용입니다리7',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (8,8,1,2,'게시글8','글 내용입니다리8',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (9,9,2,5,'게시글9','글 내용입니다리9',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (10,10,3,8,'게시글10','글 내용입니다리10',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (11,11,4,10,'게시글11','글 내용입니다리11',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (12,12,5,15,'게시글12','글 내용입니다리12',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'1','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (13,13,6,18,'게시글13','글 내용입니다리13',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (14,14,8,28,'게시글14','글 내용입니다리14',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (15,1,1,3,'게시글15','글 내용입니다리15',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (16,2,2,6,'게시글16','글 내용입니다리16',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (17,3,3,7,'게시글17','글 내용입니다리17',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (18,4,4,11,'게시글18','글 내용입니다리18',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (19,5,5,16,'게시글19','글 내용입니다리19',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (20,6,6,19,'게시글20','글 내용입니다리20',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (21,7,8,29,'게시글21','글 내용입니다리21',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (22,8,1,1,'게시글22','글 내용입니다리22',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (23,9,2,4,'게시글23','글 내용입니다리23',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (24,10,3,8,'게시글24','글 내용입니다리24',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (25,11,4,12,'게시글25','글 내용입니다리25',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (26,12,5,14,'게시글26','글 내용입니다리26',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (27,13,6,20,'게시글27','글 내용입니다리27',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (28,14,8,30,'게시글28','글 내용입니다리28',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (29,1,1,2,'게시글29','글 내용입니다리29',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (30,2,2,5,'게시글30','글 내용입니다리30',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (31,3,3,7,'게시글31','글 내용입니다리31',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (32,4,4,13,'게시글32','글 내용입니다리32',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (33,5,5,15,'게시글33','글 내용입니다리33',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (34,6,6,21,'게시글34','글 내용입니다리34',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (35,7,8,31,'게시글35','글 내용입니다리35',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (36,8,1,3,'게시글36','글 내용입니다리36',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (37,9,2,6,'게시글37','글 내용입니다리37',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (38,10,3,8,'게시글38','글 내용입니다리38',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (39,11,4,9,'게시글39','글 내용입니다리39',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (40,12,5,16,'게시글40','글 내용입니다리40',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
Insert into CASSIE.BOARD_WRITE (BW_NO,M_NO,BT_NO,S_NO,BW_TITLE,BW_CONTENT,BW_WRITTEN_DATE,BW_UPDATED_DATE,BW_HIT,BW_RECOMMEND_NUM,BW_REPORT_NUM,BW_ISLAND,BW_SECRET) values (41,13,6,17,'게시글41','글 내용입니다리41',to_date('23-MAR-20','DD-MON-RR'),to_date('23-MAR-20','DD-MON-RR'),0,0,0,'0','N');
REM INSERTING into CASSIE.CAFE
SET DEFINE OFF;
REM INSERTING into CASSIE.CAFE_REVIEW
SET DEFINE OFF;
REM INSERTING into CASSIE.CM_COMMENT
SET DEFINE OFF;
REM INSERTING into CASSIE.F_FILE
SET DEFINE OFF;
Insert into CASSIE.F_FILE (F_NO,F_NAME,F_TYPE,F_PATH,F_USE) values (1,'TEST','TEST','TEST','TEST');
REM INSERTING into CASSIE.FAQ
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME_CLASS
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME_METHOD
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME_PERSON
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME_SORT
SET DEFINE OFF;
REM INSERTING into CASSIE.GAME_THEME
SET DEFINE OFF;
REM INSERTING into CASSIE.MEMBER
SET DEFINE OFF;
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (2,'tester2','2222','member2',to_date('02-JAN-90','DD-MON-RR'),'member_nick2','f',30000,'01011111112','tester2@gmail.com',0,'test','test2',2,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (3,'tester3','3333','member3',to_date('02-JAN-90','DD-MON-RR'),'member_nick3','f',10000,'01011111113','tester3@gmail.com',0,'test','test3',2,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (1,'tester1','1111','member1',to_date('01-JAN-90','DD-MON-RR'),'member_nick1','f',0,'01011111110','tester1@gmail.com',0,'test','test2',3,'n','n','n','n','selftest',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (4,'tester4','4444','member4',to_date('02-JAN-90','DD-MON-RR'),'member_nick4','f',50000,'01011111114','tester4@gmail.com',0,'test','test4',1,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (5,'tester5','5555','member5',to_date('02-JAN-90','DD-MON-RR'),'member_nick5','f',0,'01011111115','tester5@gmail.com',0,'test','test5',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (6,'tester6','6666','member6',to_date('02-JAN-90','DD-MON-RR'),'member_nick6','m',0,'01011111116','tester6@gmail.com',0,'test','test6',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (7,'tester7','7777','member7',to_date('02-JAN-90','DD-MON-RR'),'member_nick7','m',0,'01011111117','tester7@gmail.com',0,'test','test7',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (8,'tester8','8888','member8',to_date('02-JAN-90','DD-MON-RR'),'member_nick8','m',0,'01011111118','tester8@gmail.com',0,'test','test8',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (9,'tester9','9999','member9',to_date('02-JAN-90','DD-MON-RR'),'member_nick9','m',0,'01011111119','tester9@gmail.com',0,'test','test9',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (10,'tester10','11111','member10',to_date('02-JAN-90','DD-MON-RR'),'member_nick10','f',0,'01011111120','tester10@gmail.com',0,'test','test10',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (11,'tester11','22222','member11',to_date('02-JAN-90','DD-MON-RR'),'member_nick11','f',0,'01011111121','tester11@gmail.com',0,'test','test11',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (12,'tester12','33333','member12',to_date('02-JAN-90','DD-MON-RR'),'member_nick12','f',0,'01011111122','tester12@gmail.com',0,'test','test12',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (13,'tester13','44444','member13',to_date('02-JAN-90','DD-MON-RR'),'member_nick13','f',0,'01011111123','tester13@gmail.com',0,'test','test13',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (14,'tester14','55555','member14',to_date('02-JAN-90','DD-MON-RR'),'member_nick14','f',0,'01011111124','tester14@gmail.com',0,'test','test14',3,'n','n','n','n','자기소개',to_date('19-MAR-20','DD-MON-RR'),null,'n',0,null,1);
Insert into CASSIE.MEMBER (M_NO,M_ID,M_PW,M_NAME,M_BIRTH,M_NICK,M_GENDER,M_POINT,M_PHONE,M_EMAIL,M_POST,M_ADDR1,M_ADDR2,R_NO,M_RE_SMS,M_RE_NOTICE,M_RE_MESSAGE,M_INFO,M_SELF,M_INDATE,M_OUTDATE,M_OUT,M_REPORT_NUM,M_EXTRA,F_NO) values (0,'admin','4321','admin',to_date('02-FEB-90','DD-MON-RR'),'admin_nick','f',0,'01012341234','admin@gmail.com',0,'add',null,0,'n','n','n','n',null,to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),'n',0,null,null);
REM INSERTING into CASSIE.NOTE
SET DEFINE OFF;
REM INSERTING into CASSIE.PAYMENT
SET DEFINE OFF;
REM INSERTING into CASSIE.RANK
SET DEFINE OFF;
Insert into CASSIE.RANK (R_NO,R_NAME) values (0,'관리자');
Insert into CASSIE.RANK (R_NO,R_NAME) values (1,'보드대마왕');
Insert into CASSIE.RANK (R_NO,R_NAME) values (2,'보드마스터');
Insert into CASSIE.RANK (R_NO,R_NAME) values (3,'보드게이머');
Insert into CASSIE.RANK (R_NO,R_NAME) values (4,'표류자');
REM INSERTING into CASSIE.REPORT
SET DEFINE OFF;
REM INSERTING into CASSIE.SCRAP
SET DEFINE OFF;
REM INSERTING into CASSIE.SPONSOR
SET DEFINE OFF;
REM INSERTING into CASSIE.STATISTICS
SET DEFINE OFF;
REM INSERTING into CASSIE.SUBJECT
SET DEFINE OFF;
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (1,1,'잡담');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (2,1,'노하우');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (3,1,'토론');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (4,2,'개봉기');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (5,2,'일 리뷰');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (6,2,'다 리뷰');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (7,3,'모집');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (8,3,'모임 후기');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (9,4,'이벤트');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (10,4,'대회');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (11,4,'신작 소식');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (12,4,'세일');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (13,4,'기타');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (14,5,'룰');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (15,5,'추천');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (16,5,'기타');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (17,6,'계획');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (18,6,'디자인');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (19,6,'완성');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (20,6,'공유');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (21,6,'테스트플레이');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (22,7,'회원');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (23,7,'결제');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (24,7,'정보 수정');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (25,7,'무인도 게시판');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (26,7,'기타');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (27,8,'회원 관련 문의');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (28,8,'결제 관련 문의');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (29,8,'정보수정 요청');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (30,8,'무인도 관련 문의');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (31,8,'기타 문의');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (32,9,'판매중');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (33,9,'구매중');
Insert into CASSIE.SUBJECT (S_NO,BT_NO,S_CONTENT) values (34,9,'거래완료');
REM INSERTING into CASSIE.TRADE
SET DEFINE OFF;
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (1,1,32,'팔아연1','이것저것 팔아염1',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',1000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (2,1,32,'팔아연2','이것저것 팔아염2',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',2000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (3,1,32,'팔아연3','이것저것 팔아염3',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',3000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (4,1,32,'팔아연4','이것저것 팔아염4',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',4000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (5,1,32,'팔아연5','이것저것 팔아염5',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',5000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (6,1,32,'팔아연6','이것저것 팔아염6',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',6000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (7,1,32,'팔아연7','이것저것 팔아염7',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',7000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (8,1,32,'팔아연8','이것저것 팔아염8',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',8000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (9,1,32,'팔아연9','이것저것 팔아염9',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',9000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (10,1,32,'팔아연10','이것저것 팔아염10',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',10000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (11,1,32,'팔아연11','이것저것 팔아염11',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',11000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (12,1,32,'팔아연12','이것저것 팔아염12',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'1',12000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (13,1,32,'팔아연13','이것저것 팔아염13',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',13000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (14,1,32,'팔아연14','이것저것 팔아염14',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',14000);
Insert into CASSIE.TRADE (T_NO,M_NO,S_NO,T_TITLE,T_CONTENT,T_WRITTEN_DATE,T_UPDATED_DATE,T_HIT,T_RECOMMEND_NUM,T_REPORT_NUM,T_ISLAND,T_PRICE) values (15,1,32,'팔아연15','이것저것 팔아염15',to_date('19-MAR-20','DD-MON-RR'),to_date('19-MAR-20','DD-MON-RR'),0,0,0,'0',15000);
REM INSERTING into CASSIE.WD_RECORD
SET DEFINE OFF;
REM INSERTING into CASSIE.WITHDRAWAL
SET DEFINE OFF;
