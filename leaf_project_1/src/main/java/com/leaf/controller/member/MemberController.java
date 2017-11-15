package com.leaf.controller.member;

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
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.member.ValidGroupOrder;

@Controller
public class MemberController {

	@Resource
	private MemberDAO memberdao;

	@RequestMapping("/member_list.do")
	public String list(Model model, HttpServletRequest request) {
		String strPage = request.getParameter("page");
		String flag = "list";
		int page;
		if (strPage == null) {page = 1;} 
		else {page = Integer.parseInt(request.getParameter("page"));}
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
		System.out.println("write �Ѵ�~ : " + dto.toString());
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
		System.out.println("update �Ѵ�~ : " + dto.toString());
		memberdao.updateMember(dto);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_delete.do")
	public ModelAndView delete(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("���іP�� �Ѵ� ! : " + dto.getMember_id());
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
		System.out.println("��Ƽ ���іP�� �Ѵ�~ : " + deleteTarget.toString());
		memberdao.multideleteMember(deleteTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_up.do")
	public ModelAndView up(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("�����ֱ� �Ѵ� ! : " + dto.getMember_id());
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
		System.out.println("��Ƽ �����ֱ� �Ѵ�~ : " + upTarget.toString());
		memberdao.multiupMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}

	@RequestMapping("/member_levelup.do")
	public ModelAndView levelup(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("levelup �Ѵ� ! : " + dto.getMember_id());
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
		System.out.println("multilevelup �Ѵ�~ : " + upTarget.toString());
		memberdao.multilevelupMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.do");
		return mav;
	}
	
	@RequestMapping("/member_leveldown.do")
	public ModelAndView leveldown(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("leveldown �Ѵ� ! : " + dto.getMember_id());
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
		System.out.println("member_multileveldown �Ѵ�~ : " + upTarget.toString());
		memberdao.multileveldownMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
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
        if (strPage == null) {page = 1;} 
        else {page = Integer.parseInt(request.getParameter("page"));}
        map.put("page", page);
        int count = memberdao.search_getCount(map);
        
		List<MemberDTO> searchList = memberdao.searchMemberList(map);
		//System.out.println("�˻��� ��� : " + searchList.toString());

		int countPage = (int) Math.ceil((float) count / 5);
        int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        model.addAttribute("count", count);
        model.addAttribute("countPage", countPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("keyvalue", keyvalue);
        
        model.addAttribute("list", searchList);
		model.addAttribute("flag",flag);
		return "ayrin.member_list";
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "ayrin.member_loginform";
	}
	
	@RequestMapping("/loginDupl.do")
	public void loginDupl(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionid = (String) session.getAttribute("sessionid");
		session.removeAttribute("sessionid");
		session.setAttribute("sessionid", sessionid);
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sessionid = dto.getMember_id();
		String recv_pwd = dto.getMember_pwd();
		String chkpwd = memberdao.getSessionCheck(dto);	
		int result = 0;
		if(chkpwd.equals(recv_pwd)) {
			result = 1;
			mav.addObject("log_result", result);
			mav.setViewName("main.mainPage");
			session.setAttribute("sessionid", sessionid);	
			return mav;
		}else {
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
	public String myclass(MemberDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		return "ayrin.myclass";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(MemberDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		return "ayrin.mypage";
	}
	
/*	
	@RequestMapping("/signupForm.do")
	public String signupForm(MemberDTO dto, HttpServletRequest request) {
		
		return "moon.signupForm";
	}*/
	
/*	@RequestMapping(value="/signupForm.do", method = RequestMethod.GET)
	public String signupForm(Model model) {
		MemberDTO dto = new MemberDTO();
		model.addAttribute("dto", dto);
		return "moon.signupForm";
	}
	*/
	
/*	@ModelAttribute("MemberDTO")
	public MemberDTO initMember() {
		return new MemberDTO();
	}*/
	
/*	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public String signup(Model model) {
		MemberDTO dto = new MemberDTO();
		model.addAttribute("dto", dto);
		 return "main.mainPage";
		//return "main.mainPage";
	}	*/
	
/*	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signup(@ModelAttribute("dto") @Valid MemberDTO dto, BindingResult bindingResult, Model model) {
		
		
		//유효성 검사
	    if (bindingResult.hasErrors()) { //검증에 실패한 빈은 BindingResult에 담겨 뷰에 전달된다.
	    	model.addAttribute("dto", dto);
	    	return "moon.signupForm";
	    }
	    
		memberdao.insertMember(dto);
		 return "main.mainPage";
		//return "main.mainPage";
	}
	*/
	@RequestMapping(value="/signupForm.do", method = RequestMethod.GET)
	public String signupForm(Model model) {
		MemberDTO dto = new MemberDTO();
		model.addAttribute("dto", dto);
		return "moon.signupForm";
	}
	
	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signup(@Validated(ValidGroupOrder.class) @ModelAttribute("dto") @Valid MemberDTO memberdto, BindingResult bindingResult) {
		
		//유효성 검사
	    if (bindingResult.hasErrors()) { //검증에 실패한 빈은 BindingResult에 담겨 뷰에 전달된다.
	    	return "moon.signupForm";
	    } else {
	    	memberdao.insertMember(memberdto);
			 return "main.mainPage";
	    }
	    
	    
		//return "main.mainPage";
	}
	
	 @RequestMapping("/chkDupId.do")
	 public void checkId(HttpServletRequest req, HttpServletResponse res,
	   ModelMap model) throws Exception {
	  PrintWriter out = res.getWriter();
	  try {

	   // 넘어온 ID를 받는다.
	   String paramid = (req.getParameter("prmid") == null) ? "" : String
	     .valueOf(req.getParameter("prmid"));
	   System.out.println(paramid);
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
}
