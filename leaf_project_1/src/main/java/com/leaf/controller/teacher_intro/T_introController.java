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
   
   @RequestMapping("/list.co")
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
         return "list";
      }
   
   @RequestMapping("/writeform.co")
   public String writeForm() {
      return "writeform";
   }
   
   @RequestMapping("/write.co")
   public ModelAndView write(T_introDTO dto) throws Exception{
      ModelAndView mav = new ModelAndView();
      t_introDAO.insertT_intro(dto);
      mav.setViewName("redirect:list.co");
      return mav;
   }
   
   @RequestMapping("/updateform.co")
   public ModelAndView updateForm(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      T_introDTO dto = t_introDAO.getT_introByteacher_id(teacher_id);
      mav.addObject("dto", dto);
      mav.setViewName("updateform");
      return mav;
   }
   
   @RequestMapping("/update.co")
   public ModelAndView update(T_introDTO dto) throws Exception{
      ModelAndView mav = new ModelAndView();
      t_introDAO.updateT_intro(dto);
      mav.setViewName("redirect:list.co");
      return mav;
   }
   
   @RequestMapping("/delete.co")
   public ModelAndView delete(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      t_introDAO.deleteT_intro(teacher_id);
      mav.addObject("message", teacher_id +"가 삭제되었습니다.");
      mav.setViewName("redirect:list.co");
      return mav;
   }
   
   @RequestMapping("/multidelete.co")
      public ModelAndView multidelete(HttpServletRequest request) throws Exception {
         ModelAndView mav = new ModelAndView();
         List deleteTarget = new ArrayList();
         for(String item : request.getParameter("teacher_id").split(",")) {
            deleteTarget.add(item);
         }
         System.out.println("multidelete 한당~ : "+deleteTarget.toString());
         t_introDAO.multideleteT_intro(deleteTarget);
         mav.setViewName("redirect:list.co");
         return mav;
      }
   
   @RequestMapping("/search.co")
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
      mav.setViewName("list");
      
      return mav;
   }
   
   @RequestMapping("/content.co")
   public ModelAndView content(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      
      String teacher_id = request.getParameter("teacher_id");
      System.out.println("content.teacher_id : " + teacher_id);
      T_introDTO dto = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
      String review_id = request.getParameter("review_id");
      System.out.println("content.review_id : " + review_id);
      ReviewDTO dto2 = reviewDAO.getReviewByreview_id(Integer.parseInt(review_id));

      List<ReviewDTO> list =reviewDAO.get_headline(teacher_id);
      System.out.println(list.size());
      
      
      mav.addObject("dto", dto);
      /*mav.addObject("dto2", dto2);*/
      mav.addObject("list", list);
      
      mav.setViewName("content");
      
      return mav;
   }

      @RequestMapping("/review_list.co")
      public String reviewlist(Model model, HttpServletRequest request) {
            String strPage = request.getParameter("page");
            int page;
            String teacher_id = request.getParameter("teacher_id");
          
            if (strPage == null) {page = 1;} 
            else {page = Integer.parseInt(request.getParameter("page"));}
           
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
            return "review_list";
      }

   @RequestMapping("/review_writeform.co")
   public String review_writeForm() {
      return "review_writeform";
   }
   
   @RequestMapping("/review_write.co")
   public ModelAndView review_write(ReviewDTO dto, HttpServletRequest request) throws Exception{

      /*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/
        SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
         Date date = new Date();
         String r_write_time = dateFormat.format(date);
         dto.setR_write_time(r_write_time);

         String teacher_id = request.getParameter("teacher_id");
         System.out.println("teacher_id"+teacher_id);
         Integer.parseInt(teacher_id);
         
         T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
         
      ModelAndView mav = new ModelAndView();
      reviewDAO.insertReivew(dto);

      mav.addObject("dto2", dto2);
      mav.setViewName("redirect:review_list.co?teacher_id="+teacher_id);
      return mav;
   }
   
   @RequestMapping("/review_updateform.co")
   public ModelAndView review_updateForm(HttpServletRequest request) throws Exception{
	      ModelAndView mav = new ModelAndView();
	      int review_id = new Integer(request.getParameter("review_id"));
	      ReviewDTO dto = reviewDAO.getReviewByreview_id(review_id);
	      mav.addObject("dto", dto);
	      mav.setViewName("review_updateform");
      return mav;
   }
   
   @RequestMapping("/review_update.co")
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
      mav.setViewName("redirect:review_list.co?teacher_id="+teacher_id);
      return mav;
   }
   
   
   @RequestMapping("/review_delete.co")
   public ModelAndView review_delete(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      int review_id = new Integer(request.getParameter("review_id"));
      reviewDAO.deleteReview(review_id);
      
      String teacher_id = request.getParameter("teacher_id");
      System.out.println("delete teacher_id : " + teacher_id);
      T_introDTO dto2 = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      
      mav.setViewName("redirect:review_list.co?teacher_id="+teacher_id);
      return mav;
   }
   
   @RequestMapping("/review_multidelete.co")
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
         mav.setViewName("redirect:review_list.co?teacher_id="+teacher_id);
         return mav;
      }
   
   @RequestMapping("/review_search.co")
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
   }
   

   @RequestMapping("/review_content.co")
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
      mav.setViewName("review_content");
      
      return mav;
   }
}