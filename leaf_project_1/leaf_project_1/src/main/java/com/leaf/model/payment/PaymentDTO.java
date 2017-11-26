package com.leaf.model.payment;

import java.sql.Timestamp;

public class PaymentDTO {
	
	private int payment_id, payment_lect_id, payment_lect_charge, payment_fee, payment_pay_chk;
	private String payment_member_id, payment_addnum, payment_address, payment_address2, payment_caution, payment_lect_subject, payment_currency, payment_payer_email, payment_teacher_name,payment_member_name,payment_member_tel;
	private Timestamp payment_write_date;
	
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getPayment_pay_chk() {
		return payment_pay_chk;
	}


	public void setPayment_pay_chk(int payment_pay_chk) {
		this.payment_pay_chk = payment_pay_chk;
	}



	public Timestamp getPayment_write_date() {
		return payment_write_date;
	}



	public void setPayment_write_date(Timestamp payment_write_date) {
		this.payment_write_date = payment_write_date;
	}



	public String getPayment_member_tel() {
		return payment_member_tel;
	}



	public void setPayment_member_tel(String payment_member_tel) {
		this.payment_member_tel = payment_member_tel;
	}



	public String getPayment_member_name() {
		return payment_member_name;
	}



	public void setPayment_member_name(String payment_member_name) {
		this.payment_member_name = payment_member_name;
	}



	public String getPayment_teacher_name() {
		return payment_teacher_name;
	}



	public void setPayment_teacher_name(String payment_teacher_name) {
		this.payment_teacher_name = payment_teacher_name;
	}


	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getPayment_lect_id() {
		return payment_lect_id;
	}

	public void setPayment_lect_id(int payment_lect_id) {
		this.payment_lect_id = payment_lect_id;
	}

	public int getPayment_lect_charge() {
		return payment_lect_charge;
	}

	public void setPayment_lect_charge(int payment_lect_charge) {
		this.payment_lect_charge = payment_lect_charge;
	}

	public int getPayment_fee() {
		return payment_fee;
	}

	public void setPayment_fee(int payment_fee) {
		this.payment_fee = payment_fee;
	}

	public String getPayment_member_id() {
		return payment_member_id;
	}

	public void setPayment_member_id(String payment_member_id) {
		this.payment_member_id = payment_member_id;
	}

	public String getPayment_addnum() {
		return payment_addnum;
	}

	public void setPayment_addnum(String payment_addnum) {
		this.payment_addnum = payment_addnum;
	}

	public String getPayment_address() {
		return payment_address;
	}

	public void setPayment_address(String payment_address) {
		this.payment_address = payment_address;
	}

	public String getPayment_address2() {
		return payment_address2;
	}

	public void setPayment_address2(String payment_address2) {
		this.payment_address2 = payment_address2;
	}

	public String getPayment_caution() {
		return payment_caution;
	}

	public void setPayment_caution(String payment_caution) {
		this.payment_caution = payment_caution;
	}

	public String getPayment_lect_subject() {
		return payment_lect_subject;
	}

	public void setPayment_lect_subject(String payment_lect_subject) {
		this.payment_lect_subject = payment_lect_subject;
	}

	public String getPayment_currency() {
		return payment_currency;
	}

	public void setPayment_currency(String payment_currency) {
		this.payment_currency = payment_currency;
	}

	public String getPayment_payer_email() {
		return payment_payer_email;
	}

	public void setPayment_payer_email(String payment_payer_email) {
		this.payment_payer_email = payment_payer_email;
	}

}
