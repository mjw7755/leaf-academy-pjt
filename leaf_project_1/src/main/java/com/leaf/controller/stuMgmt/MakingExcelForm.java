package com.leaf.controller.stuMgmt;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class MakingExcelForm extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		/*String sheetName = (String)map.get("sheetName");*/
		/*List<String> studentList = (List<String>) map.get("studentList");
		List<String> studentNameList = (List<String>) map.get("studentNameList");*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date day = new Date();
		String cur_date = sdf.format(day);
		
		List<String> datelist = (List<String>) map.get("datelist");
		String student_name = (String) map.get("student_name");
		String student_id = (String) map.get("student_id");
		String chk_str = (String) map.get("chk_str");
		String Lect_name = (String) map.get("Lect_name");
		
		HSSFSheet sheet = workbook.createSheet(student_name);
		
		int currentRow = 1;
		int currentColumn = 1;
		
		//title Style
		HSSFCellStyle titleStyle = workbook.createCellStyle(); 
		HSSFFont titleFont = workbook.createFont();
		titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		titleStyle.setFont(titleFont);
		
		HSSFRow maintitleRow2 = sheet.createRow(currentRow);
	    HSSFCell maintitlecell2 = maintitleRow2.createCell(currentColumn);
	    HSSFRichTextString maintitletext2 = new HSSFRichTextString("["+Lect_name+" 과정 ] "+student_name+" 학생");
	    maintitlecell2.setCellStyle(titleStyle);
    	maintitlecell2.setCellValue(maintitletext2);
    	
    	currentRow++;
    	currentRow++;
		
		
		//header Style
		HSSFCellStyle headerStyle = workbook.createCellStyle(); //header style
	    HSSFFont headerFont = workbook.createFont();
	    headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	    headerStyle.setFont(headerFont); 
	    HSSFRow maintitleRow = sheet.createRow(currentRow);
	    HSSFCell maintitlecell = maintitleRow.createCell(currentColumn);
	    HSSFRichTextString maintitletext = new HSSFRichTextString("출결 현황");
	    maintitlecell.setCellStyle(titleStyle);
    	maintitlecell.setCellValue(maintitletext);
    	
	    currentRow++;
	    currentRow++;
	    
	    
	    
	    HSSFRow titleRow = sheet.createRow(currentRow);
	    for(String date : datelist) {
	    	HSSFRichTextString text = new HSSFRichTextString(date);
	    	HSSFCell cell = titleRow.createCell(currentColumn);
	    	cell.setCellStyle(titleStyle);
	    	cell.setCellValue(text);
	    	currentColumn++;
	    }
	    
	    currentRow++;
	    currentColumn = 1;
	    //create headerRow
	    HSSFRow headerRow = sheet.createRow(currentRow);
	    for(String date : datelist) {
	    	HSSFCell cell1 = headerRow.createCell(currentColumn); 
	    	if(date.equals(cur_date)) {
	    		HSSFRichTextString text1 = new HSSFRichTextString(chk_str);	    		
	    		cell1.setCellStyle(headerStyle);
	    		cell1.setCellValue(text1);            
	    	}else {
	    		HSSFRichTextString text1 = new HSSFRichTextString("");	    		
	    		cell1.setCellStyle(headerStyle);
	    		cell1.setCellValue(text1);
	    	}
	    	
	        currentColumn++;
	    }
		
	}//method end

}
