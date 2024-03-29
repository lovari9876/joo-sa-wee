package com.soninlawisdice.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

// 회원
@SuppressWarnings("serial")
public class MemberVO implements UserDetails{
	private int m_no; // 회원번호
	private String m_id; // 아이디
	private String m_pw; // 비밀번호
	private String m_name; // 이름
	private int m_birth; // 생년월일
	private String m_nick; // 닉네임
	private String m_gender; // 성별
	private int m_point; // 포인트
	private String m_phone; // 핸드폰
	private String m_email; // 이메일
	private int m_post; // 우편번호
	private String m_addr1; // 주소
	private String m_addr2; // 상세주소
	private int r_no; // 등급
	private String m_re_sms; // SMS수신여부
	private String m_re_notice; // 공지메일수신여부
	private String m_re_message; // 쪽지수신여부
	private String m_info; // 회원정보공개여부
	private String m_self; // 자기소개
	private Timestamp m_indate; // 가입일
	private Timestamp m_outdate; // 탈퇴일
	private String m_out; // 탈퇴여부
	private int m_report_num; // 신고수
	private String m_extra; // 비고
	private int f_no; // 파일번호
	private String m_bank; // 은행
	private String m_account; // 계좌번호

	private Set<GrantedAuthority> autorities;
	
	private RankVO rankVO;
	private F_fileVO f_fileVO;

	public MemberVO() {
	}

	public MemberVO(int m_no, String m_id, String m_pw, String m_name, int m_birth, String m_nick, String m_gender,
			int m_point, String m_phone, String m_email, int m_post, String m_addr1, String m_addr2, int r_no,
			String m_re_sms, String m_re_notice, String m_re_message, String m_info, String m_self, Timestamp m_indate,
			Timestamp m_outdate, String m_out, int m_report_num, String m_extra, int f_no, String m_bank, String m_account) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_nick = m_nick;
		this.m_gender = m_gender;
		this.m_point = m_point;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_post = m_post;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		this.r_no = r_no;
		this.m_re_sms = m_re_sms;
		this.m_re_notice = m_re_notice;
		this.m_re_message = m_re_message;
		this.m_info = m_info;
		this.m_self = m_self;
		this.m_indate = m_indate;
		this.m_outdate = m_outdate;
		this.m_out = m_out;
		this.m_report_num = m_report_num;
		this.m_extra = m_extra;
		this.f_no = f_no;
		this.m_bank = m_bank;
		this.m_account = m_account;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		
		String rank = "ROLE_GUEST";		
		if (r_no == 0) {
			rank ="ROLE_ADMIN";
		}else if(r_no == 1){
			rank ="ROLE_USER";
		}else if(r_no == 2){
			rank ="ROLE_USER";
		}else if(r_no == 3){
			rank ="ROLE_USER";
		}else if(r_no == 4){
			rank ="ROLE_CASTAWAY";
		}		
		
		System.out.println("rank: " + rank);
		auth.add(new SimpleGrantedAuthority(rank));
		System.out.println("auth: " + auth);
		
		return auth;
	}
	
	@Override
	public String getPassword() {
		return m_pw;
	}

	@Override
	public String getUsername() {
		return m_id;
	}
	

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	// 계정 활성 비활성 여부, 탈퇴 여부로 확인
	@Override
	public boolean isEnabled() {
		boolean enabled = false;
		System.out.println("enabled 1 : " + enabled);
		System.out.println("m_out  : " + m_out);
		
		if (m_out.equals("1")) {
			enabled = true;
			System.out.println("enabled 2 : " + enabled);
		}
		
		return enabled;
	}
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_birth() {
		return m_birth;
	}

	public void setM_birth(int m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getM_post() {
		return m_post;
	}

	public void setM_post(int m_post) {
		this.m_post = m_post;
	}

	public String getM_addr1() {
		return m_addr1;
	}

	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	public int getR_no() {
		return r_no;
	}
	
	public String getR_name(int r_no) {
		String rank = "";
		
		if (r_no == 0) {
			rank ="관리자";
		}else if(r_no == 1){
			rank ="보드대마왕";
		}else if(r_no == 2){
			rank ="보드마스터";
		}else if(r_no == 3){
			rank ="보드게이머";
		}else if(r_no == 4){
			rank ="표류자";
		}	
		return rank;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getM_re_sms() {
		return m_re_sms;
	}

	public void setM_re_sms(String m_re_sms) {
		this.m_re_sms = m_re_sms;
	}

	public String getM_re_notice() {
		return m_re_notice;
	}

	public void setM_re_notice(String m_re_notice) {
		this.m_re_notice = m_re_notice;
	}

	public String getM_re_message() {
		return m_re_message;
	}

	public void setM_re_message(String m_re_message) {
		this.m_re_message = m_re_message;
	}

	public String getM_info() {
		return m_info;
	}

	public void setM_info(String m_info) {
		this.m_info = m_info;
	}

	public String getM_self() {
		return m_self;
	}

	public void setM_self(String m_self) {
		this.m_self = m_self;
	}

	public Timestamp getM_indate() {
		return m_indate;
	}

	public void setM_indate(Timestamp m_indate) {
		this.m_indate = m_indate;
	}

	public Timestamp getM_outdate() {
		return m_outdate;
	}

	public void setM_outdate(Timestamp m_outdate) {
		this.m_outdate = m_outdate;
	}

	public String getM_out() {
		return m_out;
	}

	public void setM_out(String m_out) {
		this.m_out = m_out;
	}

	public int getM_report_num() {
		return m_report_num;
	}

	public void setM_report_num(int m_report_num) {
		this.m_report_num = m_report_num;
	}

	public String getM_extra() {
		return m_extra;
	}

	public void setM_extra(String m_extra) {
		this.m_extra = m_extra;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getM_bank() {
		return m_bank;
	}

	public void setM_bank(String m_bank) {
		this.m_bank = m_bank;
	}

	public String getM_account() {
		return m_account;
	}

	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	
	
}
