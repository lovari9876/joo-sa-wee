-- rank: 등급 테이블 데이터 작성 
INSERT INTO RANK ( R_NO
        , R_NAME)
		VALUES( 0
		, '관리자' );       
        
INSERT INTO RANK ( R_NO
        , R_NAME)
		VALUES( 1
		, '보드대마왕' );        
        
INSERT INTO RANK ( R_NO
        , R_NAME)
		VALUES( 2
		, '보드마스터' );
        
INSERT INTO RANK ( R_NO
        , R_NAME)
		VALUES( 3
		, '보드게이머' );     
        
INSERT INTO RANK ( R_NO
        , R_NAME)
		VALUES( 4
		, '표류자' ); 

commit;

-- f_file: 파일 더미 데이터

INSERT INTO F_FILE ( F_NO
		, F_NAME
		, F_TYPE
		, F_PATH
        , F_USE)
		VALUES( 1
		, 'TEST'
		, 'TEST'
        , 'TEST'
		, 'TEST' );
        
commit;

-- 멤버 테이블 시퀀스 생성

CREATE SEQUENCE member_seq;

commit;

-- member: 더미 데이터 생성

INSERT INTO member (m_no, m_id, m_pw, m_name, m_birth, m_nick,
			m_gender, m_point, m_phone, m_email, m_post, m_addr1, m_addr2,
			r_no, m_re_sms, m_re_notice, m_re_message, m_info, m_self,
			m_indate, m_outdate, m_out, m_report_num, m_extra, f_no)
		VALUES (member_seq.nextval, 'tester', '1111', 'member', 
		 '2000/01/01', 'member_nick', 'f', 0, '01011111111', 'tester@gmail.com', 
        0, 'test', 'test2', 3,'n', 'n',
		 'n','n', 'selftest', sysdate, '', 'n', 0, 'n', 1);

commit;



