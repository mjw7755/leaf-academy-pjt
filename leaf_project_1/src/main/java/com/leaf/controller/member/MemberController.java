package com.leaf.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.member.ValidGroupOrder;
import com.leaf.model.payment.PaymentDAO;
import com.leaf.model.payment.PaymentDTO;
import com.leaf.model.tnotice.TnoticeDAO;
import com.leaf.model.tnotice.TnoticeDTO;

@Controller
public class MemberController {

	@Resource
	private MemberDAO memberdao;
	@Resource
	private TnoticeDAO tnoticedao;
	@Resource
	private PaymentDAO paymentdao;
	
	private Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	 
	    @RequestMapping(value = "/checkMail.do", produces = "application/text; charset=utf8")
	    @ResponseBody
	    private String checkMail(@RequestParam String member_email) {
	        int count = memberdao.findOneByEmail(member_email);
	        
	        return gson.toJson("{\"count\":\""+count+"\"}");
	    }
	 
	    @RequestMapping(value = "/sendMail.do", method = RequestMethod.POST, produces = "application/json")
	    @ResponseBody
	    private boolean sendMail(HttpSession session, @RequestParam String member_email, @RequestParam String randomCode, HttpServletRequest request, Model model) throws IOException {
	        String joinCode = String.valueOf(randomCode);
	        session.setAttribute("joinCode", joinCode);
	        model.addAttribute("joinCode", joinCode);
	        //String joinCode2 = request.getParameter("joinCode");
	        String subject = "회원가입 승인 번호 입니다.";
	        StringBuilder sb = new StringBuilder();
	        sb.append("회원가입 승인번호는 ").append(joinCode).append(" 입니다.");
	        return memberdao.send(subject, sb.toString(), "seirin8534@gmail.com", member_email);
	        }

	@RequestMapping("/member_list.do")
	public String list(Model model, HttpServletRequest request) {
		String strPage = request.getParameter("page");
		String flag = "list";
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<MemberDTO> list = memberdao.getMemberList(page);
		int count = memberdao.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "ayrin.member_list";
	}

	@RequestMapping("/member_writeform.do")
	public String writeform() {
		return "ayrin.member_writeform";
	}

	@RequestMapping("/member_write.do")
	public ModelAndView write(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.insertMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_updateform.do")
	public ModelAndView updateform(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_id = request.getParameter("member_id");
		MemberDTO dto = memberdao.getMemberById(member_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.member_updateform");
		return mav;
	}

	@RequestMapping("/member_update.do")
	public ModelAndView update(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.updateMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_delete.do")
	public ModelAndView delete(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.deleteMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			deleteTarget.add(item);
		}
		memberdao.multideleteMember(deleteTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_up.do")
	public ModelAndView up(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.upMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_multiup.do")
	public ModelAndView multiup(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		memberdao.multiupMember(upTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_levelup.do")
	public ModelAndView levelup(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.levelupMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_multilevelup.do")
	public ModelAndView multilevelup(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		memberdao.multilevelupMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_leveldown.do")
	public ModelAndView leveldown(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberdao.leveldownMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_multileveldown.do")
	public ModelAndView multileveldown(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		memberdao.multileveldownMember(upTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/search_member.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keyvalue = request.getParameter("keyvalue");
		String strPage = request.getParameter("page");
		String flag = "search";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyvalue", keyvalue);

		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		map.put("page", page);
		int count = memberdao.search_getCount(map);

		List<MemberDTO> searchList = memberdao.searchMemberList(map);

		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("keyvalue", keyvalue);

		model.addAttribute("list", searchList);
		model.addAttribute("flag", flag);
		return "ayrin.member_list";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "ayrin.member_loginform";
	}

	@RequestMapping("/loginDupl.do")
	public void loginDupl(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("sessionid");
		try {
			response.getWriter().write("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sessionid = dto.getMember_id();
		String recv_pwd = dto.getMember_pwd();
		String chkpwd = memberdao.getSessionCheck(dto);
		int result = 0;
		if (chkpwd.equals(recv_pwd)) {
			result = 1;
			mav.addObject("log_result", result);
			mav.setViewName("main.mainPage");
			session.setAttribute("sessionid", sessionid);
			return mav;
		} else {
			mav.addObject("log_result", result);
			mav.setViewName("ayrin.member_loginform");
			return mav;
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("sessionid");
		return "main.mainPage";
	}

	@RequestMapping("/myclass.do")
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
			
			if(dto.getMember_level() == 1) {
				String strPage = request.getParameter("page");
				int page;
				if (strPage == null) {
					page = 1;
				} else {
					page = Integer.parseInt(request.getParameter("page"));
				}
				List<TnoticeDTO> list = tnoticedao.getTnoticeList(page);
				int count = tnoticedao.getCount();
				int countPage = (int) Math.ceil((float) count / 5);
				int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
				model.addAttribute("count", count);
				model.addAttribute("countPage", countPage);
				model.addAttribute("startPage", startPage);
				for(int i=0; i<list.size(); i++) {
					list.get(i).setTnotice_content(list.get(i).getTnotice_content().replaceAll("\"", "'").replaceAll("\r\n", "<br>"));
				}
				int chk = 1;
				model.addAttribute("myclass", chk);
				model.addAttribute("list", list);
				
				List<PaymentDTO> history = paymentdao.allPayment();
				model.addAttribute("history", history);
				
				return "ayrin.myclassST";
				
			} else {
				String strPage = request.getParameter("page");
				int page;
				if (strPage == null) {
					page = 1;
				} else {
					page = Integer.parseInt(request.getParameter("page"));
				}
				List<TnoticeDTO> list = tnoticedao.getTnoticeList(page);
				int count = tnoticedao.getCount();
				int countPage = (int) Math.ceil((float) count / 5);
				int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
				model.addAttribute("count", count);
				model.addAttribute("countPage", countPage);
				model.addAttribute("startPage", startPage);
				for(int i=0; i<list.size(); i++) {
					list.get(i).setTnotice_content(list.get(i).getTnotice_content().replaceAll("\"", "'").replaceAll("\r\n", "<br>"));
				}
				int chk = 2;
				model.addAttribute("myclass", chk);
				model.addAttribute("list", list);
				
				List<PaymentDTO> history = paymentdao.allPayment();
				model.addAttribute("history", history);
				
				return "ayrin.myclassTC";
			}
		}
	}

	@RequestMapping("/mypage.do")
	public ModelAndView mypage(MemberDTO dto, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String) request.getSession().getAttribute("sessionid");
		String payment_member_id = (String) request.getSession().getAttribute("sessionid");
		//dto2 = paymentdao.paySelectId(payment_member_id);
		
		if(member_id==null) {
			mav.setViewName("ayrin.member_loginform");
		} else {
			List<PaymentDTO> list = paymentdao.paySelectId(payment_member_id);
			//System.out.println("payment_member_id" + payment_member_id);
			//System.out.println("getPayment_member_id" + ((PaymentDTO) list).getPayment_member_id());
			
			
			
			dto = memberdao.getMemberById(member_id);
			
			String chk = "OK";
			model.addAttribute("mypage", chk);
			mav.addObject("list", list);
			mav.addObject("dto", dto);
			mav.setViewName("ayrin.mypage");
		}
		
		return mav;
	}

	@RequestMapping(value = "/signupForm.do", method = RequestMethod.GET)
	public String signupForm(Model model) {
		MemberDTO dto = new MemberDTO();
		model.addAttribute("dto", dto);
		return "moon.signupForm";
	}

	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(@Validated(ValidGroupOrder.class) @ModelAttribute("dto") @Valid MemberDTO memberdto,
			BindingResult bindingResult) {
		// 유효성 검사
		if (bindingResult.hasErrors()) { // 검증에 실패한 빈은 BindingResult에 담겨 뷰에 전달된다.
			return "moon.signupForm";
		} else {
			memberdao.insertMember(memberdto);
			return "main.mainPage";
		}
		// return "main.mainPage";
	}

	@RequestMapping(value = "/member_modifyform.do", method = RequestMethod.GET)
	public ModelAndView membermodifyForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_id = (String) request.getSession().getAttribute("sessionid");
		MemberDTO dto = memberdao.getMemberById(member_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.member_updateform");
		return mav;
	}

	@RequestMapping(value = "/member_modify.do", method = RequestMethod.POST)
	public String membermodify(@Validated(ValidGroupOrder.class) @ModelAttribute("dto") @Valid MemberDTO memberdto,
			BindingResult bindingResult, Model model) throws Exception {
		if (bindingResult.hasErrors()) { // 검증에 실패한 빈은 BindingResult에 담겨 뷰에 전달된다.
			String chk = "OK";
			model.addAttribute("mypage", chk);
			return "ayrin.mypage";
		} else {
			String chk = "OK";
			model.addAttribute("mypage", chk);
			memberdao.updateMember(memberdto);
			return "ayrin.mypage";
		}
	}

	@RequestMapping(value = "/member_bye.do", method = RequestMethod.POST)
	public ModelAndView memberbye(@ModelAttribute("dto") @Valid MemberDTO memberdto, BindingResult bindingResult,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String sessionid = memberdto.getMember_id();
		String recv_pwd = memberdto.getMember_pwd();
		String chkpwd = memberdao.getSessionCheck(memberdto);
		int result = 0;
		if (chkpwd.equals(recv_pwd)) {
			result = 1;
			mav.addObject("log_result", result);
			mav.setViewName("main.mainPage");
			session.setAttribute("sessionid", sessionid);
			memberdao.memberbye(memberdto);
			return mav;
		} else {
			mav.addObject("log_result", result);
			mav.setViewName("ayrin.member_byeform");
			return mav;
		}
	}

	@RequestMapping("/chkDupId.do")
	public void checkId(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		PrintWriter out = res.getWriter();
		try {
			// 넘어온 ID를 받는다.
			String paramid = (req.getParameter("prmid") == null) ? "" : String.valueOf(req.getParameter("prmid"));
			MemberDTO dto = new MemberDTO();
			dto.setMember_id(paramid.trim());
			int chkPoint = memberdao.chkDupId(dto);
			out.print(chkPoint);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}
	
	@RequestMapping("/member_byeform.do")
	public ModelAndView memberbyeForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_id = (String) request.getSession().getAttribute("sessionid");
		MemberDTO dto = memberdao.getMemberById(member_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.member_byeform");
		return mav;
	}

	@RequestMapping("/member_del.do")
	public void member_del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String sessionid = (String) session.getAttribute("sessionid");
		String passwd = request.getParameter("passwd");
		String chkpwd = memberdao.member_check(sessionid);

		MemberDTO dto = new MemberDTO();
		dto.setMember_id(sessionid);
		dto.setMember_pwd(passwd);
		if (chkpwd.equals(passwd)) {
			memberdao.memberbye(dto);
			session.removeAttribute("sessionid");
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}
}
