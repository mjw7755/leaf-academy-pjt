package com.leaf.controller.curriculum;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
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

	 @Autowired
	 private SqlSession sqlSession;
	 
	@RequestMapping("/list_curri.do")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flag = "list";

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// List<MemberDTO> list = memberdao.getMemberList(page);
		List<CurriDTO> list = curriDAO.listCurri(page);
		int count = curriDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);

		return "curriculum.list";
	}

	@RequestMapping("/writeform_curri.do")
	public String writeForm() {
		return "curriculum.writeForm";
	}

	@RequestMapping(value = "/write_curri.do", method = RequestMethod.POST)
	public ModelAndView write(CurriDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		System.out.println("1" + dto.getCurri_content());
		String curri_write_time = sdf_t.format(date);
		System.out.println("4" + dto.getCurri_content());
		dto.setCurri_write_time(curri_write_time);
		System.out.println("5" + dto.getCurri_content());

		curriDAO.insertCurri(dto);
		System.out.println("2" + dto.getCurri_content());
		mav.setViewName("redirect:list_curri.do");
		System.out.println("3" + dto.getCurri_content());

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

/*	@RequestMapping("/detail_curri.do")

	public String detailCurri(Model model,@RequestParam int curri_id) throws Exception {
		CurriDAO curriDAO = sqlSession.getMapper(CurriDAO.class);
		
		 curri_id = curriDAO.detailCurri(curri_id);
		 model.addAttribute("curri_id", curri_id);
		return  "curriculum/detail";

	}*/

	@RequestMapping("/detail_curri.do")

	public ModelAndView detailCurri(@RequestParam int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("curriculum.detail");
		mav.addObject("dto", curriDAO.detailCurri(curri_id));
		return mav;

	}
	
	/*
	 * //단일파일업로드
	 * 
	 * @RequestMapping("/photoUpload") public String photoUpload(HttpServletRequest
	 * request, PhotoDTO dto){ String callback = dto.getCallback(); String
	 * callback_func = dto.getCallback_func(); String file_result = ""; try {
	 * if(dto.getFiledata() != null && dto.getFiledata().getOriginalFilename() !=
	 * null && !dto.getFiledata().getOriginalFilename().equals("")){ //파일이 존재하면
	 * String original_name = dto.getFiledata().getOriginalFilename(); String ext =
	 * original_name.substring(original_name.lastIndexOf(".")+1); //파일 기본경로 String
	 * defaultPath = request.getSession().getServletContext().getRealPath("/"); //파일
	 * 기본경로 _ 상세경로 String path = defaultPath + "resource" + File.separator +
	 * "photo_upload" + File.separator; File file = new File(path);
	 * System.out.println("path:"+path); //디렉토리 존재하지 않을경우 디렉토리 생성 if(!file.exists())
	 * { file.mkdirs(); } //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음) String
	 * realname = UUID.randomUUID().toString() + "." + ext; ///////////////// 서버에
	 * 파일쓰기 ///////////////// dto.getFiledata().transferTo(new File(path+realname));
	 * file_result +=
	 * "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"
	 * +realname; } else { file_result += "&errstr=error"; } } catch (Exception e) {
	 * e.printStackTrace(); } return "redirect:" + callback +
	 * "?callback_func="+callback_func+file_result; }
	 * 
	 * @RequestMapping("/submit") public void submit(HttpServletRequest request){
	 * System.out.println("에디터 컨텐츠값:"+request.getParameter("editor")); }
	 * 
	 * //다중파일업로드
	 * 
	 * @RequestMapping("/multiplePhotoUpload") public void
	 * multiplePhotoUpload(HttpServletRequest request, HttpServletResponse
	 * response){ try { //파일정보 String sFileInfo = ""; //파일명을 받는다 - 일반 원본파일명 String
	 * filename = request.getHeader("file-name"); //파일 확장자 String filename_ext =
	 * filename.substring(filename.lastIndexOf(".")+1); //확장자를소문자로 변경 filename_ext =
	 * filename_ext.toLowerCase(); //파일 기본경로 String dftFilePath =
	 * request.getSession().getServletContext().getRealPath("/"); //파일 기본경로 _ 상세경로
	 * String filePath = dftFilePath + "resource" + File.separator + "photo_upload"
	 * + File.separator; File file = new File(filePath); if(!file.exists()) {
	 * file.mkdirs(); } String realFileNm = ""; SimpleDateFormat formatter = new
	 * SimpleDateFormat("yyyyMMddHHmmss"); String today= formatter.format(new
	 * java.util.Date()); realFileNm = today+UUID.randomUUID().toString() +
	 * filename.substring(filename.lastIndexOf(".")); String rlFileNm = filePath +
	 * realFileNm; ///////////////// 서버에 파일쓰기 ///////////////// InputStream is =
	 * request.getInputStream(); OutputStream os=new FileOutputStream(rlFileNm); int
	 * numRead; byte b[] = new
	 * byte[Integer.parseInt(request.getHeader("file-size"))]; while((numRead =
	 * is.read(b,0,b.length)) != -1){ os.write(b,0,numRead); } if(is != null) {
	 * is.close(); } os.flush(); os.close(); ///////////////// 서버에 파일쓰기
	 * ///////////////// // 정보 출력 sFileInfo += "&bNewLine=true"; // img 태그의 title
	 * 속성을 원본파일명으로 적용시켜주기 위함 sFileInfo += "&sFileName="+ filename;; sFileInfo +=
	 * "&sFileURL="+"/resource/photo_upload/"+realFileNm; PrintWriter print =
	 * response.getWriter(); print.print(sFileInfo); print.flush(); print.close(); }
	 * catch (Exception e) { e.printStackTrace(); } }
	 */

	@RequestMapping("/search_curri.do")
	public String search(Model model, HttpServletRequest request) throws Exception {

		String flag = "search";
		// 컬럼명
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");
		System.out.println(column + " / " + keyvalue);

		Map<String, Object> map = new HashMap<String, Object>(); // colcurriion
		map.put("column", column); // column : name or email or home
		map.put("keyvalue", keyvalue); // keyvalue

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// List<MemberDTO> list = memberdao.getMemberList(page);
		map.put("page", page);
		int count = curriDAO.getSearchCount(map);
		// count = page;
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		System.out.println(count);
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("column", column);
		model.addAttribute("keyvalue", keyvalue);

		map.put("column", column); // column : name or email or home
		map.put("keyvalue", keyvalue); // keyvalue
		map.put("page", String.valueOf(page));

		List<CurriDTO> list = curriDAO.searchCurri(map);

		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "curriculum.list";
	}

	@RequestMapping(value="/monthlist_curri.do",produces = "application/text; charset=utf8")
	public void monthlist(Model model, HttpServletResponse response, HttpServletRequest request, CurriDTO dto) throws IOException {
		request.setCharacterEncoding("utf-8");
	       response.setCharacterEncoding("utf-8");
		String monthvalue = request.getParameter("monthvalue");
		String yearvalue= request.getParameter("yearvalue");
		String start_day = "", end_day = "";
		int y = Integer.parseInt(yearvalue), m =Integer.parseInt(monthvalue), lastday;
		
		if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12)
			lastday = 31;
		else if (m == 2) {
			if ((y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0)))
				lastday = 29;
			else
				lastday = 28;
		} else {
			lastday = 30;
		}
		System.out.println(y);

		
	Map<String,String> map = new HashMap();

	start_day=yearvalue+monthvalue+"-01";
	end_day=yearvalue+monthvalue+"-"+lastday;
	System.out.println(start_day);
	System.out.println(end_day);
	map.put("start_day",start_day);
	map.put("end_day",end_day);

	List<CurriDTO> list = curriDAO.monthlistCurri(map);

	StringBuffer sb = new StringBuffer("");System.out.println(list.size());sb.append("{ \"result\" : [");for(
	int i = 0;i<list.size();i++)
	{
		sb.append("[{\"value\" : \"" + list.get(i).getCurri_id() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getLect_start_day() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getCurri_subject() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getMember_id() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getCurri_level() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getLect_name() + "\"},");
		sb.append("{\"value\" : \"" + list.get(i).getLect_person_num() + "\"}],");
	}
	sb.append("]}");
	response.getWriter().write(sb.toString());
	model.addAttribute("monthvalue",monthvalue);
}

}
