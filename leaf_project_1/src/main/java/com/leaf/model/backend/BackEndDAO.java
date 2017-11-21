package com.leaf.model.backend;

import java.util.List;
import java.util.Map;

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

public interface BackEndDAO {
	
	public int deleteBackEnd();
	public List<CurriDTO> back_curri();
	public List<MemberDTO> back_member();
	public List<LectDTO> back_lect();
	public List<BookDTO> back_book();
	public List<FaqDTO> back_faq();
	public List<NoteDTO> back_note();
	public List<NoticeDTO> back_notice();
	public List<PaymentDTO> back_pay();
	public List<QnaDTO> back_qna();
	public List<ReviewDTO> back_rev();
	public List<T_introDTO> back_t_i();
	public List<StudentDTO> back_stu();
	public List<JageokDTO> back_ja();
	
	public List<CurriDTO> back_searchCurri(Map<String, Object> map);
	public List<LectDTO> back_searchLect(Map<String, Object> map);
	public List<MemberDTO> back_searchMember(Map<String, Object> map);
	public List<BookDTO> back_searchBook(Map<String, Object> map);
	public List<FaqDTO> back_searchFaq(Map<String, Object> map);
	public List<NoteDTO> back_searchNote(Map<String, Object> map);
	public List<NoticeDTO> back_searchNotice(Map<String, Object> map);
	public List<PaymentDTO> back_searchPay(Map<String, Object> map);
	public List<QnaDTO> back_searchQna(Map<String, Object> map);
	public List<ReviewDTO> back_searchRev(Map<String, Object> map);
	public List<T_introDTO> back_searchT_i(Map<String, Object> map);
	public List<StudentDTO> back_searchStu(Map<String, Object> map);
	public List<JageokDTO> back_searchJa(Map<String, Object> map);
	
}
