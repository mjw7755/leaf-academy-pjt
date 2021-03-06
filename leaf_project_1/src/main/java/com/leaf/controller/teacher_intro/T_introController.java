package com.leaf.controller.teacher_intro;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
      if (strPage == null) {
         page = 1;
      } else {
         page = Integer.parseInt(request.getParameter("page"));
      }
      List<T_introDTO> list = t_introDAO.getT_introList(page);
      int count = t_introDAO.getCount();
      int countPage = (int) Math.ceil((float) count / 9);
      int startPage = (int) ((Math.ceil((float) page / 9) - 1) * 9) + 1;
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
   public ModelAndView write(T_introDTO dto, HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      /* dto.setMember_id((String)request.getSession().getAttribute("sessionid")); */

      MultipartFile uploadfile = dto.getUploadfile();
      if (uploadfile != null) {
         String teacher_image = uploadfile.getOriginalFilename();
         dto.setTeacher_image(teacher_image);
         try {
            // 1. FileOutputStream 사용
            // byte[] fileData = file.getBytes();
            // FileOutputStream output = new FileOutputStream("C:/images/" + book_image); //
            // output.write(fileData);
            // 2. File 사용
            File file = new File("C://Users/LeeRam/git/leaf-academy-pjt/leaf_project_1/src/main/webapp/resources/ram/"
                  + teacher_image);
            uploadfile.transferTo(file);
         } catch (IOException e) {
            e.printStackTrace();
         } // try - catch
      } // if
         // 데이터 베이스 처리를 현재 위치에서 처리
      t_introDAO.insertT_intro(dto);
      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }

   @RequestMapping("/t_intro_updateform.do")
   public ModelAndView updateForm(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      T_introDTO dto = t_introDAO.getT_introByteacher_id(teacher_id);
      mav.addObject("dto", dto);
      mav.setViewName("ram.t_intro_updateform");
      return mav;
   }

   @RequestMapping("/t_intro_update.do")
   public ModelAndView update(T_introDTO dto) throws Exception {
      ModelAndView mav = new ModelAndView();
      MultipartFile uploadfile = dto.getUploadfile();
      if (uploadfile != null) {
         String teacher_image = uploadfile.getOriginalFilename();
         dto.setTeacher_image(teacher_image);
         try {
            // 1. FileOutputStream 사용
            // byte[] fileData = file.getBytes();
            // FileOutputStream output = new FileOutputStream("C:/images/" + book_image); //
            // output.write(fileData);
            // 2. File 사용
            File file = new File("C://Users/LeeRam/git/leaf-academy-pjt/leaf_project_1/src/main/webapp/resources/ram/"
                  + teacher_image);
            uploadfile.transferTo(file);
         } catch (IOException e) {
            e.printStackTrace();
         } // try - catch
      } // if
         // 데이터 베이스 처리를 현재 위치에서 처리
      t_introDAO.updateT_intro(dto);
      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }

   @RequestMapping("/t_intro_delete.do")
   public ModelAndView delete(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      int teacher_id = new Integer(request.getParameter("teacher_id"));
      t_introDAO.deleteT_intro(teacher_id);
      mav.setViewName("redirect:t_intro_list.do");
      return mav;
   }

   @RequestMapping("/t_intro_multidelete.do")
   public ModelAndView multidelete(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      List<String> deleteTarget = new ArrayList<String>();
      for (String item : request.getParameter("teacher_id").split(",")) {
         deleteTarget.add(item);
      }
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
      map.put("member_id", "member_id"); // column : name or email or home
      map.put("keyvalue", keyvalue);

      List<T_introDTO> searchedList = t_introDAO.searchT_introList(map);

      mav.addObject("list", searchedList);
      mav.setViewName("ram.t_intro_list");
      return mav;
   }

   @RequestMapping("/t_intro_content.do")
   public ModelAndView content(ReviewDTO dto3, HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      String teacher_id = request.getParameter("teacher_id");

      List<ReviewDTO> list1 = reviewDAO.get_headline(teacher_id);

      mav.addObject("list1", list1);
      mav.setViewName("ram.t_intro_content");

      String strPage = request.getParameter("page");
      String flag = "list";
      int page;
      if (strPage == null) {
         page = 1;
      } else {
         page = Integer.parseInt(request.getParameter("page"));
      }

      T_introDTO dto = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      List<ReviewDTO> list = reviewDAO.getReviewList(page, teacher_id);

      int count = reviewDAO.getCount();
      int countPage = (int) Math.ceil((float) count / 5);
      int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
      mav.addObject("count", count);
      mav.addObject("countPage", countPage);
      mav.addObject("startPage", startPage);
      mav.addObject("dto", dto);
      mav.addObject("flag", flag);
      mav.addObject("list", list);

      return mav;
   }

   @RequestMapping(value = "/review_list.do", produces = "text/plain;charset=UTF-8")
   public void reviewlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      String strPage = request.getParameter("page");
      String flag = "list";
      int page;

      if (strPage == null) {
         page = 1;
      } else {
         page = Integer.parseInt(request.getParameter("page"));
      }
      String teacher_id = request.getParameter("teacher_id");

      T_introDTO dto = t_introDAO.getT_introByteacher_id(Integer.parseInt(teacher_id));
      List<ReviewDTO> list = reviewDAO.getReviewList(page, teacher_id);

      int count = reviewDAO.getCount();
      int countPage = (int) Math.ceil((float) count / 5);
      int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;

      Gson gson = new Gson();
      JsonObject json = new JsonObject();

      json.addProperty("count", count);
      json.addProperty("countPage", countPage);
      json.addProperty("startPage", startPage);
      json.addProperty("list", gson.toJson(list));
      json.addProperty("dto", gson.toJson(dto));
      json.addProperty("flag", flag);
      json.addProperty("page", page);
      Writer writer = response.getWriter();
      writer.write(json.toString());
      writer.close();
   }

   @RequestMapping("/review_writeform.do")
   public String review_writeForm() {
      return "ram.review_writeform";
   }

   @RequestMapping("/review_write.do")
   public void review_write(ReviewDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
      dto.setMember_id((String) request.getSession().getAttribute("sessionid"));
      Date date = new Date();
      String r_write_time = dateFormat.format(date);
      dto.setR_write_time(r_write_time);
      dto.setTeacher_id(dto.getTeacher_id());
      reviewDAO.insertReivew(dto);
      Writer writer = response.getWriter();
      writer.write("");
      writer.close();
   }

   @RequestMapping("/review_updateform.do")
   public ModelAndView review_updateForm(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      int review_id = new Integer(request.getParameter("review_id"));
      ReviewDTO dto = reviewDAO.getReviewByreview_id(review_id);
      mav.addObject("dto", dto);
      mav.setViewName("ram.review_updateform");
      return mav;
   }

   @RequestMapping("/review_update.do")
   public void review_update(ReviewDTO dto, HttpServletRequest request, HttpServletResponse response)
         throws Exception {
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
      Date date = new Date();
      String r_modify_time = dateFormat.format(date);
      dto.setR_modify_time(r_modify_time);
      reviewDAO.updateReview(dto);
      Writer writer = response.getWriter();
      writer.write("");
      writer.close();
   }

   @RequestMapping("/review_delete.do")
   public void review_delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
      int review_id = new Integer(request.getParameter("review_id"));
      reviewDAO.deleteReview(review_id);
      Writer writer = response.getWriter();
      writer.write("");
      writer.close();
   }

   @RequestMapping("/review_multidelete.do")
   public ModelAndView review_multidelete(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      List<String> deleteTarget = new ArrayList<String>();
      for (String item : request.getParameter("review_id").split(",")) {
         deleteTarget.add(item);
      }
      String teacher_id = request.getParameter("teacher_id");
      reviewDAO.multideleteReview(deleteTarget);
      mav.setViewName("redirect:review_list.do?teacher_id=" + teacher_id);
      return mav;
   }

   @RequestMapping("/review_search.do")
   public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
         throws Exception {
      String flag = "search";
      request.setCharacterEncoding("UTF-8");
      // 컬럼명
      String column = request.getParameter("column");
      String keyvalue = request.getParameter("keyvalue");

      Map<String, Object> map = new HashMap<String, Object>(); // collection
      map.put("column", column); // column : name or email or home
      map.put("keyvalue", keyvalue); // keyvalue

      String strPage = request.getParameter("page");
      int page;
      if (strPage == null) {
         page = 1;
      } else {
         page = Integer.parseInt(strPage);
      }
      map.put("page", page);
      int count = reviewDAO.getCount2(map);
      List<ReviewDTO> list = reviewDAO.searchReviewList(map);

      // count = page;
      int countPage = (int) Math.ceil((float) count / 5);
      int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;

      model.addAttribute("count", count);
      model.addAttribute("countPage", countPage);
      model.addAttribute("startPage", startPage);
      model.addAttribute("column", column);
      model.addAttribute("keyvalue", keyvalue);
      map.put("column", column); // column : name or email or home
      map.put("keyvalue", keyvalue); // keyvalue
      model.addAttribute("list", list);
      model.addAttribute("flag", flag);
      return "ram.review_list";
   }

   @RequestMapping("/review_content.do")
   public void review_content(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      String review_id = request.getParameter("review_id");
      ReviewDTO dto = reviewDAO.getReviewByreview_id(Integer.parseInt(review_id));
      Gson gson = new Gson();
      JsonObject json = new JsonObject();
      json.addProperty("dto", gson.toJson(dto));
      Writer writer = response.getWriter();
      writer.write(json.toString());
      writer.close();
   }

   @RequestMapping("/academy.do")
   public String acedemy() {
      return "ram.academy";
   }
}