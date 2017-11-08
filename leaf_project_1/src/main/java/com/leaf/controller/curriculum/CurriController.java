package com.leaf.controller.curriculum;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.leaf.model.curriculum.CurriDAO;
import com.leaf.model.curriculum.CurriDTO;

@Controller
public class CurriController {

	@Autowired
	private CurriDAO curriDAO;

	@RequestMapping("/list_curri.do")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String flag = "list";

	    String strPage = request.getParameter("page");
	       int page;
	       if (strPage == null) {page = 1;} 
	       else {page = Integer.parseInt(request.getParameter("page"));}
	       //List<MemberDTO> list = memberdao.getMemberList(page);
	       List<CurriDTO> list = curriDAO.listCurri(page);
	       int count = curriDAO.getCount();
	       int countPage = (int) Math.ceil((float) count / 5);
	       int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
	       model.addAttribute("count", count);
	       model.addAttribute("countPage", countPage);
	       model.addAttribute("startPage", startPage);
	    model.addAttribute("list", list);
	    model.addAttribute("flag",flag);
		return "curriculum.list";
	}

	@RequestMapping("/writeform_curri.do")
	public String writeForm() {
		
		return "curriculum.writeForm";
	}

	@RequestMapping(value = "/write_curri.do", method = RequestMethod.POST)
	public ModelAndView write(CurriDTO dto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		dto.setMember_id((String)request.getSession().getAttribute("sessionid"));
		System.out.println("session" + dto.getMember_id());
		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		System.out.println(dto);
		String curri_write_time = sdf_t.format(date);
		dto.setCurri_write_time(curri_write_time);
		System.out.println("asd:"+dto.getCurri_content());
		
		curriDAO.insertCurri(dto);
		System.out.println("2"+ dto.getCurri_content());
		mav.setViewName("redirect:list_curri.do");
		System.out.println("3"+ dto.getCurri_content());
		
		return mav;
	}

	@RequestMapping("/delete_curri.do")
	public ModelAndView delete(@RequestParam("curri_id") int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		curriDAO.deleteCurri(curri_id);
		mav.setViewName("redirect:list_curri.do");
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
		mav.setViewName("redirect:list_curri.do");
		return mav;
	}

	@RequestMapping("/updateForm_curri.do")
	public ModelAndView updateForm(int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		CurriDTO dto = curriDAO.updateFormCurri(curri_id);
		mav.addObject("dto", dto);
		mav.setViewName("curriculum.updateForm");
		return mav;
	}

	@RequestMapping("/detail_curri.do")

	public ModelAndView detailCurri(@RequestParam int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("curriculum.detail");
		mav.addObject("dto", curriDAO.updateFormCurri(curri_id));
		return mav;

	}
	
	/*//?¨?Ό??Ό?λ‘λ
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoDTO dto){
	    String callback = dto.getCallback();
	    String callback_func = dto.getCallback_func();
	    String file_result = "";
	    try {
	        if(dto.getFiledata() != null && dto.getFiledata().getOriginalFilename() != null && !dto.getFiledata().getOriginalFilename().equals("")){
	            //??Ό?΄ μ‘΄μ¬?λ©?
	            String original_name = dto.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //??Ό κΈ°λ³Έκ²½λ‘
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //??Ό κΈ°λ³Έκ²½λ‘ _ ??Έκ²½λ‘
	            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //?? ? λ¦? μ‘΄μ¬?μ§? ??κ²½μ° ?? ? λ¦? ??±
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //?λ²μ ?λ‘λ ?  ??Όλͺ?(?κΈ?λ¬Έμ λ‘? ?Έ?΄ ?λ³Έν?Ό?? ?¬λ¦¬μ? ??κ²μ΄ μ’μ)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// ?λ²μ ??Ό?°κΈ? /////////////////
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
	    System.out.println("???° μ»¨νμΈ κ°:"+request.getParameter("editor"));
	}

	//?€μ€ν?Ό?λ‘λ
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //??Ό? λ³?
	         String sFileInfo = "";
	         //??Όλͺμ λ°λ?€ - ?Όλ°? ?λ³Έν?Όλͺ?
	         String filename = request.getHeader("file-name");
	         //??Ό ??₯?
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //??₯?λ₯Όμλ¬Έμλ‘? λ³?κ²?
	         filename_ext = filename_ext.toLowerCase();
	         //??Ό κΈ°λ³Έκ²½λ‘
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //??Ό κΈ°λ³Έκ²½λ‘ _ ??Έκ²½λ‘
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
	         ///////////////// ?λ²μ ??Ό?°κΈ? /////////////////
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
	         ///////////////// ?λ²μ ??Ό?°κΈ? /////////////////
	         // ? λ³? μΆλ ₯
	         sFileInfo += "&bNewLine=true";
	         // img ?κ·Έμ title ??±? ?λ³Έν?ΌλͺμΌλ‘? ? ?©?μΌμ£ΌκΈ? ??¨
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resource/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}*/

	@RequestMapping("/search_curri.do")
	public String search(Model model, HttpServletRequest request) throws Exception{


		   String flag = "search";
		      //μ»¬λΌλͺ?
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         
		         Map<String, Object> map = new HashMap<String, Object>(); //colcurriion
		         map.put("column",column ); //column : name or email or home
		         map.put("keyvalue", keyvalue); //keyvalue 
		        
		         String strPage = request.getParameter("page");
		         int page;
		         if (strPage == null) {page = 1;} 
		         else {page = Integer.parseInt(request.getParameter("page"));}
		         //List<MemberDTO> list = memberdao.getMemberList(page);
		         map.put("page", page);
		         int count = curriDAO.getSearchCount(map);
		         //count = page;
		         int countPage = (int) Math.ceil((float) count / 5);
		         int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		        System.out.println(count);
		         model.addAttribute("count", count);
		         model.addAttribute("countPage", countPage);
		         model.addAttribute("startPage", startPage);
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column ); //column : name or email or home
		         map.put("keyvalue", keyvalue); //keyvalue 
		         map.put("page", String.valueOf(page));
		      
		         List<CurriDTO> list = curriDAO.searchCurri(map);
		      
		      
		      model.addAttribute("list", list);
		      model.addAttribute("flag",flag);
		      return "curriculum.list";
		   }

}

