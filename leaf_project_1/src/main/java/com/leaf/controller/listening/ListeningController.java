package com.leaf.controller.listening;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.listening.ListeningDAO;
import com.leaf.model.listening.ListeningDTO;
import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.payment.PaymentDAO;
import com.leaf.model.payment.PaymentDTO;

@Controller
public class ListeningController {

	@Resource
	private MemberDAO memberdao;
	@Resource
	private PaymentDAO paymentdao;
	@Resource
	private ListeningDAO listeningDAO;
	
/*	@RequestMapping("/listening.do")
	public String myclass() {
		return "king.listening";
	}*/
	
	@RequestMapping("/listen.do")
	public String myclass(Model model,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		String member_id = (String) request.getSession().getAttribute("sessionid");
		if(member_id==null) {
			return "ayrin.member_loginform";
		} else {
			MemberDTO dto = memberdao.getMemberById(member_id);
			mav.addObject("dto", dto);
			
			String studentid = request.getParameter("studentid");
			
			if(dto.getMember_level() == 1 || studentid!=null) {
				
				int chk = 1;
				if( studentid!=null) chk=2;
				model.addAttribute("myclass", chk);
				
				model.addAttribute("memberLevel", dto.getMember_level());
				
				List<ListeningDTO> classList = listeningDAO.getStudentClassList(member_id);
				model.addAttribute("classList", classList);
				
				String lect_id_str = request.getParameter("lect_id");
				int lect_id = -1;
				if(lect_id_str==null && classList!=null && classList!=null) lect_id = classList.get(0).getLect_id();
				else lect_id = Integer.parseInt(lect_id_str);
				
				String teacherid = listeningDAO.getTeacherid(lect_id);
				
				model.addAttribute("lect_id", lect_id);
				model.addAttribute("teacherid", teacherid);
				model.addAttribute("targetid", studentid!=null?studentid:teacherid);
				
				return "king.listen2";
				
			} else {
				
				int chk = 2;
				model.addAttribute("myclass", chk);
				
				List<ListeningDTO> classList = listeningDAO.getTeacherClassList(member_id);
				model.addAttribute("classList", classList);
				model.addAttribute("memberLevel", dto.getMember_level());

				String lect_id_str = request.getParameter("lect_id");
				int lect_id = -1;
				if(lect_id_str==null && classList!=null && classList!=null) lect_id = classList.get(0).getLect_id();
				else lect_id = Integer.parseInt(lect_id_str);
				
				List<String> studentList = listeningDAO.getStudentList(lect_id);
				model.addAttribute("studentList", studentList);
				model.addAttribute("lect_id", lect_id);
				
				return "king.listen2";
			}
		}
	}
}

