package com.soninlawisdice.iamport;

import java.sql.Date;

public class IamportPaymentVO {
	private String imp_uid; //아임포트 결제 고유 UID
	private String merchant_uid; //가맹점에서 전달한 거래 고유 UID
	private String pay_method; //결제방식 samsung : 삼성페이 / card : 신용카드 / trans : 계좌이체 / vbank : 가상계좌 ,
	private String pg_provider;//PG사 명칭. inicis(이니시스) / nice(나이스정보통신) ,
	private String pg_tid; //PG사 승인정보 ,
	private String pg_id;//거래가 처리된 PG사 상점아이디 
	private String name; //주문명칭
	private int amount; //주문(결제)금액
	private int cancel_amount;//결제취소금액
	private String buyer_name;//주문자명
	private String status;//결제상태  ready:미결제, paid:결제완료, cancelled:결제취소, failed:결제실패 = ['ready', 'paid', 'cancelled', 'failed'],
	private String fail_reason; //결제실패 사유
	private String cancel_reason; //결제취소 사유
	private String card_code;// 카드사 코드번호(금융결제원 표준코드번호) = ['361(BC카드)', '364(광주카드)', '365(삼성카드)', '366(신한카드)', '367(현대카드)', '368(롯데카드)', '369(수협카드)', '370(씨티카드)', '371(NH카드)', '372(전북카드)', '373(제주카드)', '374(하나SK카드)', '381(KB국민카드)', '041(우리카드)', '071(우체국)'],
	private String card_name ;// 카드사 명칭 - (신용카드 결제 건의 경우) ,
	private int	card_quota;// 할부개월 수(0이면 일시불) ,
	private String card_number ;// 결제에 사용된 마스킹된 카드번호. 7~12번째 자리를 마스킹하는 것이 일반적이지만, PG사의 정책/설정에 따라 다소 차이가 있을 수 있음 ,
	private int	card_type ;// 카드유형. (주의)해당 정보를 제공하지 않는 일부 PG사의 경우 null 로 응답됨(ex. JTNet, 이니시스-빌링) = ['null', '0(신용카드)', '1(체크카드)'],
	private String vbank_code;// 가상계좌 은행 표준코드 - (금융결제원기준) ,
	private String vbank_name ;//입금받을 가상계좌 은행명 ,
	private String vbank_num;//입금받을 가상계좌 계좌번호 ,
	private String vbank_holder;// 입금받을 가상계좌 예금주 ,
	private Date vbank_date;//입금받을 가상계좌 마감기한 UNIX timestamp ,
	private Date vbank_issued_at;// 가상계좌 생성 시각 UNIX timestamp ,
	

	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPg_provider() {
		return pg_provider;
	}
	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}
	public String getPg_tid() {
		return pg_tid;
	}
	public void setPg_tid(String pg_tid) {
		this.pg_tid = pg_tid;
	}
	public String getPg_id() {
		return pg_id;
	}
	public void setPg_id(String pg_id) {
		this.pg_id = pg_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCancel_amount() {
		return cancel_amount;
	}
	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFail_reason() {
		return fail_reason;
	}
	public void setFail_reason(String fail_reason) {
		this.fail_reason = fail_reason;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public String getCard_code() {
		return card_code;
	}
	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public int getCard_quota() {
		return card_quota;
	}
	public void setCard_quota(int card_quota) {
		this.card_quota = card_quota;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public int getCard_type() {
		return card_type;
	}
	public void setCard_type(int card_type) {
		this.card_type = card_type;
	}
	public String getVbank_code() {
		return vbank_code;
	}
	public void setVbank_code(String vbank_code) {
		this.vbank_code = vbank_code;
	}
	public String getVbank_name() {
		return vbank_name;
	}
	public void setVbank_name(String vbank_name) {
		this.vbank_name = vbank_name;
	}
	public String getVbank_num() {
		return vbank_num;
	}
	public void setVbank_num(String vbank_num) {
		this.vbank_num = vbank_num;
	}
	public String getVbank_holder() {
		return vbank_holder;
	}
	public void setVbank_holder(String vbank_holder) {
		this.vbank_holder = vbank_holder;
	}
	public Date getVbank_date() {
		return vbank_date;
	}
	public void setVbank_date(Date vbank_date) {
		this.vbank_date = vbank_date;
	}
	public Date getVbank_issued_at() {
		return vbank_issued_at;
	}
	public void setVbank_issued_at(Date vbank_issued_at) {
		this.vbank_issued_at = vbank_issued_at;
	}
	@Override
	public String toString() {
		return "IamportPaymentVO [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", pay_method=" + pay_method
				+ ", pg_provider=" + pg_provider + ", pg_tid=" + pg_tid + ", pg_id=" + pg_id + ", name=" + name
				+ ", amount=" + amount + ", cancel_amount=" + cancel_amount + ", buyer_name=" + buyer_name + ", status="
				+ status + ", fail_reason=" + fail_reason + ", cancel_reason=" + cancel_reason + ", card_code="
				+ card_code + ", card_name=" + card_name + ", card_quota=" + card_quota + ", card_number=" + card_number
				+ ", card_type=" + card_type + ", vbank_code=" + vbank_code + ", vbank_name=" + vbank_name
				+ ", vbank_num=" + vbank_num + ", vbank_holder=" + vbank_holder + ", vbank_date=" + vbank_date
				+ ", vbank_issued_at=" + vbank_issued_at + "]";
	}
	
	
	
	
}
