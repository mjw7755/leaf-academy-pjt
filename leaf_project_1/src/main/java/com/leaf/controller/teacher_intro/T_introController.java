package com.leaf.controller.teacher_intro;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.teacher_intro.ReviewDAO;
import com.leaf.model.teacher_intro.ReviewDTO;
import com.leaf.model.teacher_intro.T_introDAO;
import com.leaf.model.teacher_intro.T_introDTO;

@Controller
public class T_introController {

   @Resource
   private T_introDAO t_introDAO;
   @Resource
   private ReviewDAO reviewDAO;
   
   @RequestMapping("/t_intro_list.do")
      public String list(Model model, HttpServletRequest request) {
         String strPage = request.getParameter("page");
       
         int page;
         if (strPage == null) {page = 1;} 
         else {page = Integer.parseInt(request.getParameter("page"));}
         List<T_introDTO> list = t_introDAO.getT_introList(page);
         int count = t_introDAO.getCount();
         int countPage = (int) Math.ceil((float) count / 5);
         int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
         model.addAttribute("count", count);
         model.addAttribute("countPage", countPage);
         model.addAttribute("startPage", startPage);
         model.addAttribute("list", list);

         return "ram.t_intro_list";
      }
   
   @RequestMapping("/t_intro_writeform.do")
   public String writeForm() {
      return "ram.t_intro_writeform";
   }
   
   @RequestMapping("/t_intro_write.do")
   public ModelAndView write(T_introDTO dto,HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      dto.setMember_id((String)request.getSession().getAttribute("sessionid"));
      t_introDAO.insertT_intro(dto);

      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }
   
   @RequestMapping("/t_intro_updateform.do")
   public ModelAndView updateForm(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      T_introDTO dto = t_introDAO.getT_introByteacher_id(teacher_id);
      mav.addObject("dto", dto);
      mav.setViewName("ram.t_intro_updateform");
      return mav;
   }
   
   @RequestMapping("/t_intro_update.do")
   public ModelAndView update(T_introDTO dto) throws Exception{
      ModelAndView mav = new ModelAndView();
      t_introDAO.updateT_intro(dto);
      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }
   
   @RequestMapping("/t_intro_delete.do")
   public ModelAndView delete(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      t_introDAO.deleteT_intro(teacher_id);
      
      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }
   
   @RequestMapping("/t_intro_multidelete.do")
      public ModelAndView multidelete(HttpServletRequest request) throws Exception {
         ModelAndView mav = new ModelAndView();
         List deleteTarget = new ArrayList();
         for(String item : request.getParameter("teacher_id").split(",")) {
            deleteTarget.add(item);
         }
         System.out.println("multidelete 한당~ : "+deleteTarget.toString());
         t_introDAO.multideleteT_intro(deleteTarget);
         mav.setViewName("redirect:t_intro_list.do");
         return mav;
      }
   
   @RequestMapping("/t_intro_search.do")
   public ModelAndView search(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      request.setCharacterEncoding("UTF-8");
      
      String keyvalue = request.getParameter("keyvalue");
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("member_id", "member_id");  // column : name or email or home
      map.put("keyvalue", keyvalue);
      
      List<T_introDTO> searchedList = t_introDAO.searchT_introList(map);
      System.out.println("검색된 결과 : " + searchedList.toString());
      
      mav.addObject("list", searchedList);
      mav.setViewName("ram.t_intro_list");
      
      return mav;
   }
   
   @RequestMapping("/t_intro_content.do")
   public ModelAndView content(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      
      String teacher_id = request.getParameter("teacher_id");
      System.out.println("content.teacher_id : " + teacher_id);
      T_introDTO dto = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
/*      String review_id = request.getParameter("review_id");
      System.out.println("content.review_id : " + review_id);
      ReviewDTO dto2 = reviewDAO.getReviewByreview_id(Integer.parseInt(review_id));*/

      List<ReviewDTO> list =reviewDAO.get_headline(teacher_id);
      System.out.println(list.size());
      
      
      mav.addObject("dto", dto);
      /*mav.addObject("dto2", dto2);*/
      mav.addObject("list", list);
      
      mav.setViewName("ram.t_intro_content");
      
      return mav;
   }

      @RequestMapping("/review_list.do")
      public String reviewlist(Model model, HttpServletRequest request) {
      	   String strPage = request.getParameter("page");
      	   String flag = "list";
       	   int page;
       	   if (strPage == null) {page = 1;} 
       	   else {page = Integer.parseInt(request.getParameter("page"));}
            String teacher_id = request.getParameter("teacher_id");
          
            T_introDTO dto = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
            System.out.println("list teacher_id : " + teacher_id);
            List<ReviewDTO> list = reviewDAO.getReviewList(page, teacher_id);
            
            int count = reviewDAO.getCount();
            int countPage = (int) Math.ceil((float) count / 5);
            int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
            model.addAttribute("count", count);
            model.addAttribute("countPage", countPage);
            model.addAttribute("startPage", startPage);
            model.addAttribute("list", list);
            model.addAttribute("dto", dto);
            model.addAttribute("flag", flag);
            
            return "ram.review_list";
      }
 
   @RequestMapping("/review_writeform.do")
   public String review_writeForm() {
      return "ram.review_writeform";
   }
   
   @RequestMapping("/review_write.do")
   public ModelAndView review_write(ReviewDTO dto, HttpServletRequest request) throws Exception{

      /*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/
        SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
         dto.setMember_id((String)request.getSession().getAttribute("sessionid")); 
        Date date = new Date();
         String r_write_time = dateFormat.format(date);
         dto.setR_write_time(r_write_time);
         System.out.println(dto.getR_headline());
         
         int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
         System.out.println("teacher_id"+teacher_id);
         
         T_introDTO dto2 = t_introDAO.getT_introByteacher_id(teacher_id);
         System.out.println(dto.getTeacher_id());
      ModelAndView mav = new ModelAndView();
      dto.setTeacher_id(teacher_id);
      reviewDAO.insertReivew(dto);

      mav.addObject("dto2", dto2);
      mav.setViewName("redirect:review_list.do?teacher_id="+teacher_id);
      return mav;
   }
   
   @RequestMapping("/review_updateform.do")
   public ModelAndView review_updateForm(HttpServletRequest request) throws Exception{
	      ModelAndView mav = new ModelAndView();
	      int review_id = new Integer(request.getParameter("review_id"));
	      ReviewDTO dto = reviewDAO.getReviewByreview_id(review_id);
	      mav.addObject("dto", dto);
	      mav.setViewName("ram.review_updateform");
      return mav;
   }
   
   @RequestMapping("/review_update.do")
   public ModelAndView review_update(ReviewDTO dto,HttpServletRequest request) throws Exception{
	   SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
	   Date date = new Date();
	   String r_modify_time = dateFormat.format(date);
	   dto.setR_modify_time(r_modify_time);
	   
      ModelAndView mav = new ModelAndView();
      reviewDAO.updateReview(dto);
      
      String teacher_id = request.getParameter("teacher_id");
      System.out.println("update teacher_id : " + teacher_id);
      T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
      /*mav.addObject("dto2", dto2);*/
      mav.setViewName("redirect:review_list.do?teacher_id="+teacher_id);
      return mav;
   }
   
   
   @RequestMapping("/review_delete.do")
   public ModelAndView review_delete(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int review_id = new Integer(request.getParameter("review_id"));
      reviewDAO.deleteReview(review_id);
      
      String teacher_id = request.getParameter("teacher_id");
      System.out.println("delete teacher_id : " + teacher_id);
      T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
      mav.setViewName("redirect:review_list.do?teacher_id="+teacher_id);
      return mav;
   }
   
   @RequestMapping("/review_multidelete.do")
      public ModelAndView review_multidelete(HttpServletRequest request) throws Exception {
         ModelAndView mav = new ModelAndView();
         List deleteTarget = new ArrayList();
         for(String item : request.getParameter("review_id").split(",")) {
            deleteTarget.add(item);
         }
         
         String teacher_id = request.getParameter("teacher_id");
         System.out.println("delete teacher_id : " + teacher_id);
         T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
         
         System.out.println("multidelete 한당~ : "+deleteTarget.toString());
         reviewDAO.multideleteReview(deleteTarget);
         mav.setViewName("redirect:review_list.do?teacher_id="+teacher_id);
         return mav;
      }
   
/*   @RequestMapping("/review_search.do")
   public ModelAndView review_search(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      request.setCharacterEncoding("UTF-8");
      
      String keyvalue = request.getParameter("keyvalue");
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("member_id", "member_id");  // 회원 아이디
      map.put("r_headline", "r_headline"); // 제목
      map.put("keyvalue", keyvalue);
      
      List<ReviewDTO> searchedList = reviewDAO.searchReviewList(map);
      System.out.println("검색된 결과 : " + searchedList.toString());
      
      mav.addObject("list", searchedList);
      mav.setViewName("list");
      
      return mav;
   }*/
   @RequestMapping("/review_search.do")
   public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
      String flag = "search";
      request.setCharacterEncoding("UTF-8");
      //컬럼명
         String column =request.getParameter("column");
         String keyvalue = request.getParameter("keyvalue");
         System.out.println(column + " / " + keyvalue);
         
         Map<String, Object> map = new HashMap<String, Object>(); //collection
         map.put("column",column ); //column : name or email or home
         map.put("keyvalue", keyvalue); //keyvalue 
        
         String strPage = request.getParameter("page");
         System.out.println("page" + strPage);
         int page;
         if (strPage == null) {page = 1;} 
         else {page = Integer.parseInt(strPage);}
         //List<MemberDTO> list = memberdao.getMemberList(page);
         map.put("page", page);
         int count = reviewDAO.getCount2(map);
         List<ReviewDTO> list = reviewDAO.searchReviewList(map);
         
         //count = page;
         int countPage = (int) Math.ceil((float) count / 5);
         int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        
         model.addAttribute("count", count);
         model.addAttribute("countPage", countPage);
         model.addAttribute("startPage", startPage);
         model.addAttribute("column", column);
         model.addAttribute("keyvalue", keyvalue);
         map.put("column",column ); //column : name or email or home
         map.put("keyvalue", keyvalue); //keyvalue 
         System.out.println(list.get(0).getMember_id());
         System.out.println(count);
         System.out.println(countPage);
         System.out.println(startPage);
         System.out.println(column);
         System.out.println(keyvalue);
      model.addAttribute("list", list);
      model.addAttribute("flag",flag);
      return "ram.review_list";
   }

   @RequestMapping("/review_content.do")
   public ModelAndView review_content(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      
      String review_id = request.getParameter("review_id");
      System.out.println("review_content.review_id : " + review_id);
      ReviewDTO dto = reviewDAO.getReviewByreview_id(Integer.parseInt(review_id));

      String teacher_id = request.getParameter("teacher_id");
      System.out.println("review_content teacher_id : " + teacher_id);
      T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
      mav.addObject("dto", dto);
      mav.addObject("dto2", dto2);
      mav.setViewName("ram.review_content");
      
      return mav;
   }

}