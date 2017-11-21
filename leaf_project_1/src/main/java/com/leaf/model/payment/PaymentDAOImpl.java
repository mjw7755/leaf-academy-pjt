package com.leaf.model.payment;

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
	
	
	
}
