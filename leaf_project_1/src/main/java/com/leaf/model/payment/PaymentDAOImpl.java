package com.leaf.model.payment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertPaymentData(PaymentDTO dto) {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		dao.insertPaymentData(dto);
	}

	@Override
	public int selectMaxRow() {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		return dao.selectMaxRow();
	}

	@Override
	public void deletePayData(int itemnumber) {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		dao.deletePayData(itemnumber);
	}

	@Override
	public String selectEmailAddress(int payment_id) {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		return dao.selectEmailAddress(payment_id);
	}

	@Override
	public void updatePayChk(int paychkInt) {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		dao.updatePayChk(paychkInt);
	}

	@Override
	public String selectMemberTel(int itemnumber) {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		return dao.selectMemberTel(itemnumber);
	}

	@Override
	public List<PaymentDTO> allPayment() {
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		return dao.allPayment();
	}
	
	
	
}
