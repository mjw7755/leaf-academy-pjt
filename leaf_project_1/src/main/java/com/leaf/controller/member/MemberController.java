package com.leaf.controller.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;

@Controller
public class MemberController {

	@Resource
	private MemberDAO memberdao;

	@RequestMapping("/member_list.lcs")
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
		return "member_list";
	}

	@RequestMapping("/member_writeform.lcs")
	public String writeform() {
		return "writeform";
	}

	@RequestMapping("/member_write.lcs")
	public ModelAndView write(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("write 한당~ : " + dto.toString());
		memberdao.insertMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_updateform.lcs")
	public ModelAndView updateform(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_id = request.getParameter("member_id");
		MemberDTO dto = memberdao.getMemberById(member_id);
		mav.addObject("dto", dto);
		mav.setViewName("member_updateform");
		return mav;
	}

	@RequestMapping("/member_update.lcs")
	public ModelAndView update(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("update 한당~ : " + dto.toString());
		memberdao.updateMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_delete.lcs")
	public ModelAndView delete(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("권한뻇기 한당 ! : " + dto.getMember_id());
		memberdao.deleteMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_multidelete.lcs")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			deleteTarget.add(item);
		}
		System.out.println("멀티 권한뻇기 한당~ : " + deleteTarget.toString());
		memberdao.multideleteMember(deleteTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_up.lcs")
	public ModelAndView up(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("권한주기 한당 ! : " + dto.getMember_id());
		memberdao.upMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_multiup.lcs")
	public ModelAndView multiup(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		System.out.println("멀티 권한주기 한당~ : " + upTarget.toString());
		memberdao.multiupMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_levelup.lcs")
	public ModelAndView levelup(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("levelup 한당 ! : " + dto.getMember_id());
		memberdao.levelupMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_multilevelup.lcs")
	public ModelAndView multilevelup(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		System.out.println("multilevelup 한당~ : " + upTarget.toString());
		memberdao.multilevelupMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}
	
	@RequestMapping("/member_leveldown.lcs")
	public ModelAndView leveldown(MemberDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("leveldown 한당 ! : " + dto.getMember_id());
		memberdao.leveldownMember(dto);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}

	@RequestMapping("/member_multileveldown.lcs")
	public ModelAndView multileveldown(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> upTarget = new ArrayList<String>();
		for (String item : request.getParameter("member_id").split(",")) {
			upTarget.add(item);
		}
		System.out.println("member_multileveldown 한당~ : " + upTarget.toString());
		memberdao.multileveldownMember(upTarget);
		// String deleteID = memberdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:member_list.lcs");
		return mav;
	}
	@RequestMapping("/search_member.lcs")
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
		//System.out.println("검색된 결과 : " + searchList.toString());

		int countPage = (int) Math.ceil((float) count / 5);
        int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        model.addAttribute("count", count);
        model.addAttribute("countPage", countPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("keyvalue", keyvalue);
        
        model.addAttribute("list", searchList);
		model.addAttribute("flag",flag);
		return "member_list";
	}
	
	@RequestMapping("/login.do")
	public String login(MemberDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionid = "";
		
		
		sessionid = memberdao.getSessionCheck(dto);
		
		if(sessionid != null) {
			
			session.setAttribute("sessionid", sessionid);	
			return "main/mainPage";
		}
		
		return "ayrin/member_loginform";
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("sessionid");
		return "main/mainPage";
	}
}
