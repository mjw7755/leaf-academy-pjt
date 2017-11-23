package com.leaf.controller.listening;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
			
			if(Integer.parseInt(dto.getMember_level()) == 1) {
				
				int chk = 1;
				model.addAttribute("myclass", chk);
				
				List<PaymentDTO> history = paymentdao.allPayment();
				model.addAttribute("history", history);
				
				return "king.listen";
				
			} else {
				
				int chk = 2;
				model.addAttribute("myclass", chk);
				
				List<PaymentDTO> history = paymentdao.allPayment();
				model.addAttribute("history", history);
				
				return "king.listen";
			}
		}
	}
}

