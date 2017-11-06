package com.leaf.controller.curriculum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.curriculum.PhotoDTO;
import com.leaf.model.curriculum.CurriDAO;
import com.leaf.model.curriculum.CurriDTO;

@Controller
public class CurriController {

	@Autowired
	private CurriDAO curriDAO;

	@RequestMapping("/curri_list.do")
	public String list(Model model, HttpServletRequest request) {

		 String strPage = request.getParameter("page");
	      int page;
	      if (strPage == null) {page = 1;} 
	      else {page = Integer.parseInt(request.getParameter("page"));}
		List<CurriDTO> list = curriDAO.getCurriList(page);

		int count = curriDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);

		return "curriculum/list";
	}

	@RequestMapping("/writeform_curri.do")
	public String writeForm() {
		return "curriculum/writeForm";
	}

	@RequestMapping(value = "/write_curri.do", method = RequestMethod.POST)
	public ModelAndView write(CurriDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		System.out.println("1"+ dto.getCurri_content());
		String curri_write_time = sdf_t.format(date);
		System.out.println("4"+ dto.getCurri_content());
		dto.setCurri_write_time(curri_write_time);
		System.out.println("5"+ dto.getCurri_content());
		
		curriDAO.insertCurri(dto);
		System.out.println("2"+ dto.getCurri_content());
		mav.setViewName("redirect:curri_list.do");
		System.out.println("3"+ dto.getCurri_content());
		
		return mav;
	}

	@RequestMapping("/delete_curri.do")
	public ModelAndView delete(@RequestParam("curri_id") int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		curriDAO.deleteCurri(curri_id);
		mav.setViewName("redirect:curri_list.do");
		return mav;
	}

	@RequestMapping("/update_curri.do")
	public ModelAndView update(@ModelAttribute CurriDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		System.out.println(dto.getCurri_level());
		System.out.println(dto.getCurri_id());
		String curri_modify_time = sdf_t.format(date);
		dto.setCurri_modify_time(curri_modify_time);
		curriDAO.updateCurri(dto);
		mav.setViewName("redirect:curri_list.do");
		return mav;
	}

	@RequestMapping("/updateForm_curri.do")
	public ModelAndView updateForm(int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		CurriDTO dto = curriDAO.updateFormCurri(curri_id);
		mav.addObject("dto", dto);
		mav.setViewName("curriculum/updateForm");
		return mav;
	}

	@RequestMapping("/detail_curri.do")

	public ModelAndView curriDetail(@RequestParam int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("curriculum/detail");
		mav.addObject("dto", curriDAO.updateFormCurri(curri_id));
		return mav;

	}
	
	//?��?��?��?��?��로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoDTO dto){
	    String callback = dto.getCallback();
	    String callback_func = dto.getCallback_func();
	    String file_result = "";
	    try {
	        if(dto.getFiledata() != null && dto.getFiledata().getOriginalFilename() != null && !dto.getFiledata().getOriginalFilename().equals("")){
	            //?��?��?�� 존재?���?
	            String original_name = dto.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //?��?�� 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //?��?�� 기본경로 _ ?��?��경로
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //?��?��?���? 존재?���? ?��?��경우 ?��?��?���? ?��?��
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //?��버에 ?��로드 ?�� ?��?���?(?���?문제�? ?��?�� ?��본파?��?? ?��리�? ?��?��것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// ?��버에 ?��?��?���? /////////////////
	            dto.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	@RequestMapping("/submit")
	public void submit(HttpServletRequest request){
	    System.out.println("?��?��?�� 컨텐츠값:"+request.getParameter("editor"));
	}

	//?��중파?��?��로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //?��?��?���?
	         String sFileInfo = "";
	         //?��?��명을 받는?�� - ?���? ?��본파?���?
	         String filename = request.getHeader("file-name");
	         //?��?�� ?��?��?��
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //?��?��?��를소문자�? �?�?
	         filename_ext = filename_ext.toLowerCase();
	         //?��?�� 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //?��?�� 기본경로 _ ?��?��경로
	         String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// ?��버에 ?��?��?���? /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// ?��버에 ?��?��?���? /////////////////
	         // ?���? 출력
	         sFileInfo += "&bNewLine=true";
	         // img ?��그의 title ?��?��?�� ?��본파?��명으�? ?��?��?��켜주�? ?��?��
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resource/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


}

