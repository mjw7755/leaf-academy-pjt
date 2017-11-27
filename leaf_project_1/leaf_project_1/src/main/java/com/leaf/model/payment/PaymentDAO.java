package com.leaf.model.payment;

import java.util.List;

public interface PaymentDAO {
	
	public void insertPaymentData(PaymentDTO dto);
	public int selectMaxRow();
	public void deletePayData(int itemnumber);
	public String selectEmailAddress(int payment_id);
	public void updatePayChk(int paychkInt);
	public String selectMemberTel(int itemnumber);
	public List<PaymentDTO> allPayment();
	public  List<PaymentDTO> paySelectId(String payment_member_id);
	//public List<PaymentDTO> getPayment(String );
}	
