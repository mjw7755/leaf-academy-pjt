package com.leaf.controller.book;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.book.BookDAO;
import com.leaf.model.book.BookDTO;

@Controller
public class BookController {
	
	@Resource
	private BookDAO bookdao;
	
	@RequestMapping("/book_list.lcs")
	public String list(Model model, HttpServletRequest request) {
		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {page = 1;} 
		else {page = Integer.parseInt(request.getParameter("page"));}
		List<BookDTO> list = bookdao.getBookList(page);
		int count = bookdao.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		return "book_list";
	}

	@RequestMapping("/book_writeform.lcs")
	public String writeform() {
		return "book_writeform";
	}
	
	@RequestMapping("/book_write.lcs")
	public ModelAndView write(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.insertBook(dto);
		mav.setViewName("redirect:book_list.lcs");
		return mav;
	}
	
	@RequestMapping("/book_updateform.lcs")
	public ModelAndView updateform(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDTO dto = bookdao.getBookById(book_id);
		mav.addObject("dto", dto);
		mav.setViewName("book_updateform");
		return mav;
	}

	@RequestMapping("/book_update.lcs")
	public ModelAndView update(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.updateBook(dto);
		mav.setViewName("redirect:book_list.lcs");
		return mav;
	}

	@RequestMapping("/book_delete.lcs")
	public ModelAndView delete(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.deleteBook(dto);
		mav.setViewName("redirect:book_list.lcs");
		return mav;
	}

	@RequestMapping("/book_multidelete.lcs")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("book_id").split(",")) {
			deleteTarget.add(item);
		}
		bookdao.multideleteBook(deleteTarget);
		// String deleteID = bookdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:book_list.lcs");
		return mav;
	}
	
	@RequestMapping("/book_deletecancle.lcs")
	public ModelAndView deletecancle(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.deletecancleBook(dto);
		mav.setViewName("redirect:book_list.lcs");
		return mav;
	}
	
	@RequestMapping("/book_search.lcs")
	public ModelAndView search(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String keyvalue = request.getParameter("keyvalue");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("book_id", "book_id");
		map.put("member_id", "member_id");
		map.put("book_title", "book_title");
		map.put("book_writer", "book_writer");
		map.put("book_cost", "book_cost");
		map.put("enable", "enable");
		map.put("keyvalue", keyvalue);

		List<BookDTO> searchList = bookdao.searchBook(map);

		mav.addObject("list", searchList);
		mav.setViewName("book_list");
		return mav;
	}
	
	@RequestMapping("/book_detail.lcs")
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDTO dto = bookdao.getBookById(book_id);
		mav.addObject("dto", dto);
		mav.setViewName("book_detail");
		return mav;
	}
}
