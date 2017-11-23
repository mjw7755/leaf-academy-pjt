package com.leaf.controller.stuMgmt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class UpdateExcelForm{

	
	public UpdateExcelForm(Map<String,Object> map, HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, FileNotFoundException, IOException {
		updateExcel(map,request);
	}
	
	
	
	public void updateExcel(Map<String,Object> map,HttpServletRequest request) throws EncryptedDocumentException, InvalidFormatException, FileNotFoundException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date day = new Date();
		String cur_date = sdf.format(day);
		String excelName = (String) map.get("excelName");
		List<String> datelist = (List<String>) map.get("datelist");
		String student_name = (String)map.get("student_name");
		String chk_str = (String) map.get("chk_str");
		File exfile = new File("D://software etc/"+excelName+".xls");
		
		Workbook workbook = WorkbookFactory.create(new FileInputStream(exfile));
		
		int startRow = 6;
		int startcolumn = 1;
		Sheet updateSheet = workbook.getSheetAt(0);
		
		
		
		CellStyle cellStyle = workbook.createCellStyle();
		Row updateRow = updateSheet.createRow(startRow);
		
		Cell updateCell = updateRow.createCell(startcolumn); 
		for(String date : datelist) {
			updateCell = updateRow.createCell(startcolumn); 
	    	if(date.equals(cur_date)) {
	    		HSSFRichTextString text = new HSSFRichTextString(chk_str);	    		
	    		updateCell.setCellStyle(cellStyle);
	    		updateCell.setCellValue(text);            
	    	}
	    	startcolumn++;
	    }
		
		FileOutputStream fileOut = new FileOutputStream(exfile);
		workbook.write(fileOut);

		
	}
	/*@Override
	protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date day = new Date();
		String cur_date = sdf.format(day);
		String excelName = (String) map.get("excelName");
		List<String> datelist = (List<String>) map.get("datelist");
		String student_name = (String)map.get("student_name");
		String chk_str = (String) map.get("chk_str");
		File exfile = new File("D://software etc/"+excelName+".xls");
		
		workbook = new HSSFWorkbook(new FileInputStream(exfile));
		
		int startRow = 3;
		int startcolumn = 0;
		HSSFSheet updateSheet = workbook.getSheetAt(0);
		
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		HSSFRow updateRow = updateSheet.createRow(startRow);
		
		HSSFCell updateCell = updateRow.createCell(startcolumn); 
		HSSFRichTextString nameText = new HSSFRichTextString(student_name+"("+excelName+")");
		updateCell.setCellValue(nameText);  
		startcolumn++;
		for(String date : datelist) {
			updateCell = updateRow.createCell(startcolumn); 
	    	if(date.equals(cur_date)) {
	    		System.out.println(chk_str);
	    		HSSFRichTextString text = new HSSFRichTextString(chk_str);	    		
	    		updateCell.setCellStyle(cellStyle);
	    		updateCell.setCellValue(text);            
	    	}
	    	startcolumn++;
	    }
		
		FileOutputStream fileOut = new FileOutputStream(exfile);
		workbook.write(fileOut);

	}*/

}
