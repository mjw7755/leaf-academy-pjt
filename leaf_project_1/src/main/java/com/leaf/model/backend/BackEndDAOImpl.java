package com.leaf.model.backend;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.book.BookDTO;
import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.jageok.JageokDTO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.note.NoteDTO;
import com.leaf.model.payment.PaymentDTO;
import com.leaf.model.service.FaqDTO;
import com.leaf.model.service.NoticeDTO;
import com.leaf.model.service.QnaDTO;
import com.leaf.model.stumgmt.StudentDTO;
import com.leaf.model.teacher_intro.ReviewDTO;
import com.leaf.model.teacher_intro.T_introDTO;
@Component
public class BackEndDAOImpl implements BackEndDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public int deleteBackEnd() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.deleteBackEnd();
	}


	@Override
	public List<CurriDTO> back_curri() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_curri();
	}
	@Override
	public List<CurriDTO> back_searchCurri(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchCurri(map);
	}
	/*@Override
	public List<CurriDTO> searchcurri(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.searchcurri(map);
	}*/
	
	@Override
	public List<MemberDTO> back_member() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_member();
	}
	@Override
	public List<MemberDTO> back_searchMember(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchMember(map);
	}

	@Override
	public List<LectDTO> back_lect() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_lect();
	}
	@Override
	public List<LectDTO> back_searchLect(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchLect(map);
	}

	@Override
	public List<BookDTO> back_book() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_book();
	}

	@Override
	public List<BookDTO> back_searchBook(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchBook(map);
	}


	@Override
	public List<FaqDTO> back_faq() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_faq();
	}

	@Override
	public List<FaqDTO> back_searchFaq(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchFaq(map);
	}


	@Override
	public List<NoteDTO> back_note() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_note();
	}


	@Override
	public List<NoteDTO> back_searchNote(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchNote(map);
	}


	@Override
	public List<NoticeDTO> back_notice() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_notice();
	}


	@Override
	public List<NoticeDTO> back_searchNotice(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchNotice(map);
	}


	@Override
	public List<PaymentDTO> back_pay() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_pay();
	}


	@Override
	public List<PaymentDTO> back_searchPay(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchPay(map);
	}


	@Override
	public List<QnaDTO> back_qna() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_qna();
	}


	@Override
	public List<QnaDTO> back_searchQna(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchQna(map);
	}


	@Override
	public List<ReviewDTO> back_rev() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_rev();
	}


	@Override
	public List<ReviewDTO> back_searchRev(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchRev(map);
	}


	@Override
	public List<T_introDTO> back_t_i() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_t_i();
	}


	@Override
	public List<T_introDTO> back_searchT_i(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchT_i(map);
	}


	@Override
	public List<StudentDTO> back_stu() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_stu();
	}


	@Override
	public List<StudentDTO> back_searchStu(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchStu(map);
	}


	@Override
	public List<JageokDTO> back_ja() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_ja();
	}


	@Override
	public List<JageokDTO> back_searchJa(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_searchJa(map);
	}


	@Override
	public void back_updateCurri(CurriDTO dto) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		dao.back_updateCurri(dto);
	}


	@Override
	public CurriDTO back_updateFormCurri(int curri_id) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.back_updateFormCurri(curri_id);
	}

}
