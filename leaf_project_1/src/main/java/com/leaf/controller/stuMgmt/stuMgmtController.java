package com.leaf.controller.stuMgmt;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.curriculum.LectDAO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.listening.ListeningDAO;
import com.leaf.model.listening.ListeningDTO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.note.NoteDAO;
import com.leaf.model.note.NoteDTO;
import com.leaf.model.stumgmt.StumgmtDAO;
import com.leaf.service.BoardPager;

@Controller
public class stuMgmtController {
	
	@Autowired
	private LectDAO  lectDAO;
	
	@Autowired
	private NoteDAO noteDAO;
	
	@Autowired
	private StumgmtDAO stumgmtDAO;
	
	@Resource
	private ListeningDAO listeningDAO;
	
	/*@RequestMapping("/attendForm.do")
	public ModelAndView excel(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ModelAndView mav = new ModelAndView();
		LectDTO dto = lectDAO.getCheckDate(sessionid);
		String start = dto.getLect_start_day();
		String end = dto.getLect_end_day();
		
		Date start_date = sdf.parse(start);
		Date end_date = sdf.parse(end);
		int count = 0;
		int year = start_date.getYear();
		long result_time = end_date.getTime() - start_date.getTime();
		
		long  diff_date = result_time/(60*60*24*1000);
		int temp = start_date.getDay();
		int start_month = start_date.getMonth();
		int end_month = end_date.getMonth();
		
		for(int i=0; i<diff_date;i++) {
			
			temp %= 7;
			if(temp == 1 || temp== 4) {
				count++;
			}
			temp++;
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=다운로드.xls");  
		response.setHeader("Content-Description", "JSP Generated Data");  
		response.setContentType("application/vnd.ms-excel"); 
		
		mav.addObject("count", count);
		mav.addObject("start_month",start_month);
		mav.addObject("end_month",end_month);
		mav.setViewName("moon.attendForm");
		return mav;
	}*/
	
	@RequestMapping("stuMgmtForm.do")
	public ModelAndView mgmtForm(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String) request.getSession().getAttribute("sessionid");
		
		List<ListeningDTO> classList = listeningDAO.getTeacherClassList(member_id);
		model.addAttribute("classList", classList);

		String lect_id_str = request.getParameter("lect_id");
		int lect_id = 0;
		if(lect_id_str==null && classList!=null) lect_id = classList.get(0).getLect_id();
		else lect_id = Integer.parseInt(lect_id_str);
		
		List<String> studentList = listeningDAO.getStudentList(lect_id);
		model.addAttribute("studentList", studentList);
		model.addAttribute("lect_id", lect_id);
		mav.setViewName("moon.stuMgmt");
		return mav;
	}
	
	@RequestMapping("stuMgmtExcel.do")
	public ModelAndView stuExcel(HttpServletRequest request,HttpServletResponse response) throws ParseException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		/*List<MemberDTO> memberlist = stumgmtDAO.getStudents(sessionid);*/
		String student_id = request.getParameter("student_id");
		String chk_str = request.getParameter("chk_str");
		String lect_id = request.getParameter("lect_id");
		System.out.println(chk_str);
		System.out.println(student_id);
		
		/*lect_name 가져오기*/
		String Lect_name = lectDAO.getLectName(Integer.parseInt(lect_id));
		
		/*학생 이름 가져오기*/
		String student_name = stumgmtDAO.getStudentName(student_id);
		/*엑셀에서 헤더로쓸 날짜 데이터 리스트*/
		
		/*해당하는 강의의 커리큘럼 날짜 뽑아오기*/
		List<String> datelist = new ArrayList<String>();
		
		LectDTO dto = lectDAO.getCheckDate(Integer.parseInt(lect_id));
		
		
		/*날짜의 차를 계산하기위한 과정*/
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		String start = dto.getLect_start_day();
		String end = dto.getLect_end_day();
			
		Date start_date = df.parse(start);
		Date end_date = df.parse(end);
			
		long result_time = end_date.getTime() - start_date.getTime();
		long diff_date = result_time/(60*60*24*1000);
			
		System.out.println(diff_date);
		for(int i=0; i<=(int)diff_date; i++) {
			cal.setTime(start_date);
			cal.add(Calendar.DATE, i);	
			datelist.add(df.format(cal.getTime()));
		}

		/*엑셀파일 만들때 넣을 자료*/
		Map<String,Object> makelistMap = new HashMap<String,Object>();
		
		/*listMap.put("studentList", studentList);
		listMap.put("studentNameList", studentNameList);*/
		makelistMap.put("datelist", datelist);
		makelistMap.put("student_id", student_id);
		makelistMap.put("student_name", student_name);
		makelistMap.put("chk_str", chk_str);
		makelistMap.put("Lect_name", Lect_name);
		
		/*엑셀파일 수정할때 넣을 자료*/
		List<String> chk_arr = new ArrayList<String>();
		if(chk_arr.size() == 0) {
			for(int i=0;i<31;i++) {
				chk_arr.add("");			
			}			
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date day = new Date();
		String cur_date = sdf.format(day);
		
		int date_index = datelist.indexOf(cur_date);
		chk_arr.set(date_index, chk_str);
		
		Map<String,Object> getExcelMap = new HashMap<String,Object>();
		getExcelMap.put("student_id", student_id);
		getExcelMap.put("lect_id", lect_id);
	    String getExcelName = stumgmtDAO.getStuExcel(getExcelMap);
	    Map<String,Object> updatelistMap = new HashMap<String,Object>();
	    updatelistMap.put("excelName", getExcelName);
	    updatelistMap.put("chk_arr", chk_arr);
	    updatelistMap.put("datelist", datelist);
	    updatelistMap.put("student_name", student_name);
	    
	    /*엑셀 파일 네이밍*/
	    Map<String, Object> makeExcelName = new HashMap<String,Object>();
	    String setExcelName = Lect_name+"_"+student_id;
	    makeExcelName.put("setExcelName", setExcelName);
	    makeExcelName.put("student_id", student_id);
	    makeExcelName.put("lect_id", lect_id);
	    
	    System.out.println("디비에 엑셀파일 이름 있지? "+getExcelName);
	    if(getExcelName != null) {
	    	System.out.println("엑셀 파일 업데이트 시작");
	    	System.out.println(getExcelName);
	    	try {
				UpdateExcelForm updateExcelForm = new UpdateExcelForm(updatelistMap,request,response);
				mav.setViewName("main.mainPage");
				return mav;
			} catch (EncryptedDocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	 
	    }else {
	    	chk_arr.removeAll(chk_arr);
	    	System.out.println("엑셀이름"+student_id);
	    	response.setContentType( "application/ms-excel" );
	    	response.setHeader( "Content-disposition", "attachment; filename="+new String(setExcelName.getBytes("KSC5601"),"8859_1")+".xls" );
	    	stumgmtDAO.insertStuExcel(makeExcelName);
	    	System.out.println("엑셀파일 들어감");
	    	return new ModelAndView(new MakingExcelForm(),makelistMap);	 
	    }
		return mav;
		
		
	}
	
	@RequestMapping("getChkAttend.do")
	public ModelAndView getChkAttend(Model model, HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, FileNotFoundException, IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		GetExcelFileData gefd = new GetExcelFileData();
		
		
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		List<ListeningDTO> classList = listeningDAO.getStudentClassList(sessionid);
		model.addAttribute("classList", classList);
		
		String lect_id_str = request.getParameter("lect_id");
		int lect_id = 0;
		if(lect_id_str==null && classList!=null) lect_id = classList.get(0).getLect_id();
		else lect_id = Integer.parseInt(lect_id_str);
		
		model.addAttribute("lect_id", lect_id);
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		///////////////////////////////////////////////////////
		
		
		/*여러개의 강의를 듣는 학생의 각 강의및  날짜 수 list 그리고 엑셀파일이름 리스트*/
		System.out.println(sessionid);
		List<LectDTO> list = stumgmtDAO.getMyLect(sessionid);
		List<Integer> res_diff_date_list = new ArrayList<Integer>();
		List<String> lect_name_list = new ArrayList<String>();
		List<String> excel_name_list = new ArrayList<String>();
		
		if(list.size() == 0) {
			mav.addObject("lect_chk","듣고있는 강의가 없습니다.");
			mav.setViewName("moon.chkAttendForm");
		}else {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			
			for(int i=0; i<list.size();i++) {
				String start = list.get(i).getLect_start_day();
				String end = list.get(i).getLect_end_day();
				String lect_name = list.get(i).getLect_name();
				
				Date start_date = df.parse(start);
				Date end_date = df.parse(end);
				
				long result_time = end_date.getTime() - start_date.getTime();
				long diff_date = result_time/(60*60*24*1000);
				int res_diff_date = (int)diff_date;
				System.out.println("날짜 차이 : "+res_diff_date);
				res_diff_date_list.add(res_diff_date);
				lect_name_list.add(lect_name);
			}
			
			System.out.println("날짜 잘들어갔나?"+res_diff_date_list.get(0)+"과연 "+res_diff_date_list.get(1));
			/*엑셀파일이름*/
				for(int i=0; i<list.size();i++) {
					excel_name_list.add(lect_name_list.get(i)+"_"+sessionid);
				}
			//
			
			
			
			/*엑셀에서 데이터를 가져오기위한 리스트모음*/
			Map<String,Object> getExcelDataMap = new HashMap<String,Object>();
			getExcelDataMap.put("res_diff_date_list", res_diff_date_list);
			getExcelDataMap.put("lect_name_list", lect_name_list);
			getExcelDataMap.put("excel_name_list", excel_name_list);
			
			List<Map<String,Object>> resultData = new ArrayList<Map<String,Object>>();
			resultData = gefd.getExcelData(getExcelDataMap);
			
			List<Map<String,Object>> dataMapList = new ArrayList<Map<String,Object>>();
			
			for(int ii=0;ii<resultData.size();ii++) {
				Map<String,Object> attend_chk_date = new HashMap<String,Object>();
				
				ArrayList<String> dateList = (ArrayList<String>) resultData.get(ii).get("dateList");
				ArrayList<String> chkList = (ArrayList<String>) resultData.get(ii).get("chkList");

				
				
				/*가져온 엑셀데이터로 출결일 계산*/
				int att = 0,abs = 0, late = 0, el = 0;
				int late_count=0, el_count=0;
				double result = 0;
				for(int i=0; i<chkList.size();i++) {
					if(chkList.get(i).equals("출석")) {
						att++;
					}else if(chkList.get(i).equals("결석")) {
						abs++;
					}else if(chkList.get(i).equals("지각")) {
						late++;
					}else if(chkList.get(i).equals("조퇴")) {
						el++;
					}
				}
				
				attend_chk_date.put("att", att);
				attend_chk_date.put("abs", abs);
				attend_chk_date.put("late", late);
				attend_chk_date.put("el", el);
				
				late_count = late/3;
				el_count = el/3;
				
				result = late_count+el_count+att;
				result = Math.round(result * 100) / 100.0;
				int listSize = chkList.size();
				double perAttd =(result/(double)listSize)*100.00;
				

				attend_chk_date.put("dateList", dateList);
				attend_chk_date.put("listSize", listSize);
				attend_chk_date.put("perAttd", perAttd);
				attend_chk_date.put("lect_name", lect_name_list.get(ii));
				dataMapList.add(attend_chk_date);
			}
			
			
			mav.addObject("dataMapList", dataMapList);
			mav.setViewName("moon.chkAttendForm");
		}
		
		
		
		return mav;
	}
	
	
}
