package com.leaf.model.payment;

import java.util.Map;

public interface PaymentDAO {
	
	public void insertPaymentData(PaymentDTO dto);
	public int selectMaxRow();
	public void deletePayData(int itemnumber);
	public String selectEmailAddress(int payment_id);
	public void updatePayChk(int paychkInt);
	public String selectMemberTel(int itemnumber);
}
