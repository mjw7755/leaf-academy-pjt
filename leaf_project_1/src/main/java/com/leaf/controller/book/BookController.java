package com.leaf.controller.book;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.book.BookDAO;
import com.leaf.model.book.BookDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class BookController {
	
	@Resource
	private BookDAO bookdao;
	
	@RequestMapping("/book_list.do")
	public String list(Model model, HttpServletRequest request) {
		if(request.getSession().getAttribute("sessionid") == null) {
			return "ayrin.member_loginform";
		}
		String strPage = request.getParameter("page");
		String flag = "list";
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
		model.addAttribute("flag", flag);
		return "ayrin.book_list";
	}

	@RequestMapping("/book_writeform.do")
	public String writeform() {
		return "ayrin.book_writeform";
	}
	
	@RequestMapping("/book_write.do")
	public ModelAndView write(BookDTO dto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		dto.setMember_id((String)request.getSession().getAttribute("sessionid"));
		
		MultipartFile uploadfile = dto.getUploadfile();
		if (uploadfile != null) { 
			String book_image = uploadfile.getOriginalFilename(); 
			dto.setBook_image(book_image);
			try { 
				// 1. FileOutputStream 사용 
				// byte[] fileData = file.getBytes(); 
				// FileOutputStream output = new FileOutputStream("C:/images/" + book_image); // output.write(fileData); 
				
				// 2. File 사용
				File file = new File("C:/Users/kimssung/git/leaf-academy-pjt/leaf_project_1/src/main/webapp/resources/" + book_image); 
				uploadfile.transferTo(file); 
				
				} catch (IOException e) { 
					e.printStackTrace(); 
				} // try - catch 
			} // if 
		  // 데이터 베이스 처리를 현재 위치에서 처리 
		
		System.out.println(dto.getBook_image());
		bookdao.insertBook(dto);
		mav.setViewName("redirect:book_list.do");
		return mav;
		
		/*String root = request.getSession().getServletContext().getRealPath("/");
		//String root = "C:\\Users\\kimssung\\git\\leaf-academy-pjt\\leaf_project_1\\src\\main\\webapp\\WEB-INF\\view\\ayrin\\image";
        String pathname = root + "image"; //폴더명 image에 저장.
        File f = new File(pathname);
        if (!f.exists()) { // 폴더가 존재하지 않으면 폴더 생성
            f.mkdirs();
        }
        int maxFilesize = 5 * 1024 * 1024;

        // MultipartRequest(request, 저장경로[, 최대허용크기, 인코딩케릭터셋, 동일한 파일명 보호 여부])
        MultipartRequest multi = new MultipartRequest(request, pathname, maxFilesize, "UTF-8", new DefaultFileRenamePolicy());

        File book_image = multi.getFile("book_image");
        System.out.println(book_image); // 첨부된 파일의 전체경로
        dto.setBook_image(book_image.getName());
        System.out.println(dto.getBook_id());
        System.out.println(dto.getBook_cost());
        System.out.println(dto.getBook_image());
        System.out.println(dto.getBook_title());
        System.out.println(dto.getBook_writer());
        System.out.println(dto.getEnabled());*/
        
	}
	
	@RequestMapping("/book_updateform.do")
	public ModelAndView updateform(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDTO dto = bookdao.getBookById(book_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.book_updateform");
		return mav;
	}

	@RequestMapping("/book_update.do")
	public ModelAndView update(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile uploadfile = dto.getUploadfile();
		if (uploadfile != null) { 
			String book_image = uploadfile.getOriginalFilename(); 
			dto.setBook_image(book_image);
			try { 
				// 1. FileOutputStream 사용 
				// byte[] fileData = file.getBytes(); 
				// FileOutputStream output = new FileOutputStream("C:/images/" + book_image); // output.write(fileData); 
				
				// 2. File 사용
				File file = new File("C:/Users/kimssung/git/leaf-academy-pjt/leaf_project_1/src/main/webapp/resources/" + book_image); 
				uploadfile.transferTo(file); 
				
				} catch (IOException e) { 
					e.printStackTrace(); 
				} // try - catch 
			} // if 
		  // 데이터 베이스 처리를 현재 위치에서 처리 
		System.out.println(dto.getBook_image());
		bookdao.updateBook(dto);
		mav.setViewName("redirect:book_list.do");
		return mav;
	}

	@RequestMapping("/book_delete.do")
	public ModelAndView delete(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.deleteBook(dto);
		mav.setViewName("redirect:book_list.do");
		return mav;
	}

	@RequestMapping("/book_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("book_id").split(",")) {
			deleteTarget.add(item);
		}
		bookdao.multideleteBook(deleteTarget);
		// String deleteID = bookdao.multideleteMember(deleteTarget);
		mav.setViewName("redirect:book_list.do");
		return mav;
	}
	
	@RequestMapping("/book_deletecancle.do")
	public ModelAndView deletecancle(BookDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		bookdao.deletecancleBook(dto);
		mav.setViewName("redirect:book_list.do");
		return mav;
	}
	
	@RequestMapping("/book_search.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keyvalue = request.getParameter("keyvalue");
		String strPage = request.getParameter("page");
		String flag = "search";
		
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("keyvalue", keyvalue); //keyvalue
        
		int page;
        if (strPage == null) {page = 1;} 
        else {page = Integer.parseInt(request.getParameter("page"));}
        map.put("page", page);
        int count = bookdao.search_getCount(map);

		List<BookDTO> searchList = bookdao.searchBook(map);

		int countPage = (int) Math.ceil((float) count / 5);
        int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        model.addAttribute("count", count);
        model.addAttribute("countPage", countPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("keyvalue", keyvalue);
        
		model.addAttribute("list", searchList);
		model.addAttribute("flag",flag);
		return "ayrin.book_list";
	}
	
	@RequestMapping("/book_detail.do")
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDTO dto = bookdao.getBookById(book_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.book_detail");
		return mav;
	}
}
