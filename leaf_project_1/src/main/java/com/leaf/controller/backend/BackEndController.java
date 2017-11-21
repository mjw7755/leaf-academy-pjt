package com.leaf.controller.backend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.backend.BackEndDAO;
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

@Controller
public class BackEndController {

	@Resource
	private BackEndDAO backendDAO;
	
	@RequestMapping("/delete_backend.do")
	public ModelAndView deletebackend(@RequestParam("appli_id") int appli_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		backendDAO.deleteBackEnd();
		mav.setViewName("redirect:backend_list.do");
		return mav;
	}
	
	@RequestMapping("/list_backend_curri.do")
	public ModelAndView backend_curri(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<CurriDTO> clist=backendDAO.back_curri();
		System.out.println("dddddd"+clist);

		model.addAttribute("clist", clist);
		mav.setViewName("backend.list_backend_curri");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_curri.do")
	public String back_searchCurri(Model model, HttpServletRequest request) throws Exception{

		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      
		      List<CurriDTO> list = backendDAO.back_searchCurri(map);
		      
		      
		      model.addAttribute("clist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_curri";
		   }
	
	@RequestMapping("/list_backend_lect.do")
	public ModelAndView backend_lect(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<LectDTO> llist=backendDAO.back_lect();

		model.addAttribute("llist", llist);
		mav.setViewName("backend.list_backend_lect");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_lect.do")
	public String searchlect(Model model, HttpServletRequest request) throws Exception{

		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      
		      List<LectDTO> list = backendDAO.back_searchLect(map);
		      
		      
		      model.addAttribute("llist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_lect";
		   }
	
	@RequestMapping("/list_backend_member.do")
	public ModelAndView backend_member(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> mlist=backendDAO.back_member();

		model.addAttribute("mlist", mlist);
		mav.setViewName("backend.list_backend_member");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_member.do")
	public String searchmember(Model model, HttpServletRequest request) throws Exception{

		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      
		      List<MemberDTO> list = backendDAO.back_searchMember(map);
		      
		      
		      model.addAttribute("mlist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_member";
		   }
	
	@RequestMapping("/list_backend_book.do")
	public ModelAndView backend_book(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<BookDTO> blist=backendDAO.back_book();

		model.addAttribute("blist", blist);
		mav.setViewName("backend.list_backend_book");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_book.do")
	public String searchbook(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<BookDTO> list = backendDAO.back_searchBook(map);
		      
		      model.addAttribute("blist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_book";
		   }
	
	@RequestMapping("/list_backend_faq.do")
	public ModelAndView backend_faq(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<FaqDTO> flist=backendDAO.back_faq();

		model.addAttribute("flist", flist);
		mav.setViewName("backend.list_backend_faq");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_faq.do")
	public String searchfaq(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<FaqDTO> list = backendDAO.back_searchFaq(map);
		      
		      model.addAttribute("flist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_faq";
		   }
	
	@RequestMapping("/list_backend_note.do")
	public ModelAndView backend_note(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<NoteDTO> nlist=backendDAO.back_note();

		model.addAttribute("nlist", nlist);
		mav.setViewName("backend.list_backend_note");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_note.do")
	public String searchnote(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<NoteDTO> list = backendDAO.back_searchNote(map);
		      
		      model.addAttribute("nlist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_note";
		   }
	
	@RequestMapping("/list_backend_notice.do")
	public ModelAndView backend_notice(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<NoticeDTO> noticelist=backendDAO.back_notice();

		model.addAttribute("noticelist", noticelist);
		mav.setViewName("backend.list_backend_notice");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_notice.do")
	public String searchnotice(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<NoticeDTO> list = backendDAO.back_searchNotice(map);
		      
		      model.addAttribute("noticelist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_notice";
		   }
	
	@RequestMapping("/list_backend_pay.do")
	public ModelAndView backend_pay(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<PaymentDTO> plist=backendDAO.back_pay();

		model.addAttribute("plist", plist);
		mav.setViewName("backend.list_backend_pay");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_pay.do")
	public String searchpay(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<PaymentDTO> list = backendDAO.back_searchPay(map);
		      
		      model.addAttribute("plist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_pay";
		   }
	
	@RequestMapping("/list_backend_qna.do")
	public ModelAndView backend_qna(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<QnaDTO> qlist=backendDAO.back_qna();

		model.addAttribute("qlist", qlist);
		mav.setViewName("backend.list_backend_qna");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_qna.do")
	public String searchqna(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<QnaDTO> list = backendDAO.back_searchQna(map);
		      
		      model.addAttribute("qlist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_qna";
		   }
	
	@RequestMapping("/list_backend_rev.do")
	public ModelAndView backend_rev(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<ReviewDTO> rlist=backendDAO.back_rev();

		model.addAttribute("rlist", rlist);
		mav.setViewName("backend.list_backend_rev");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_rev.do")
	public String searchrev(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<ReviewDTO> list = backendDAO.back_searchRev(map);
		      
		      model.addAttribute("rlist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_rev";
		   }
	
	@RequestMapping("/list_backend_t_i.do")
	public ModelAndView backend_t_i(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<T_introDTO> t_ilist=backendDAO.back_t_i();

		model.addAttribute("t_ilist", t_ilist);
		mav.setViewName("backend.list_backend_t_i");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_t_i.do")
	public String searcht_i(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<T_introDTO> list = backendDAO.back_searchT_i(map);
		      
		      model.addAttribute("t_ilist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_t_i";
		   }
	
	@RequestMapping("/list_backend_stu.do")
	public ModelAndView backend_stu(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<StudentDTO> stulist=backendDAO.back_stu();

		model.addAttribute("stulist", stulist);
		mav.setViewName("backend.list_backend_stu");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_stu.do")
	public String searchstu(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<StudentDTO> list = backendDAO.back_searchStu(map);
		      
		      model.addAttribute("stulist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_stu";
		   }
	
	@RequestMapping("/list_backend_ja.do")
	public ModelAndView backend_ja(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<JageokDTO> jalist=backendDAO.back_ja();

		model.addAttribute("jalist", jalist);
		mav.setViewName("backend.list_backend_ja");
		return mav;
	
	}
	
	@RequestMapping("/search_backend_ja.do")
	public String searchja(Model model, HttpServletRequest request) throws Exception{
		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      List<JageokDTO> list = backendDAO.back_searchJa(map);
		      
		      model.addAttribute("jalist", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_ja";
		   }
}
