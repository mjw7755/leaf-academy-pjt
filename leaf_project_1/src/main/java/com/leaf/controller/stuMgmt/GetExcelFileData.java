package com.leaf.controller.stuMgmt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class GetExcelFileData {
	
	public List<Map<String,Object>> getExcelData(Map<String,Object> getExcelDataMap) throws EncryptedDocumentException, InvalidFormatException, FileNotFoundException, IOException{
		List<Map<String,Object>> res_excelDataList = new ArrayList<Map<String,Object>>();
		
		List<Integer> res_diff_date_list = (List<Integer>) getExcelDataMap.get("res_diff_date_list");
		List<String> lect_name_list = (List<String>) getExcelDataMap.get("lect_name_list");
		List<String> excel_name_list = (List<String>) getExcelDataMap.get("excel_name_list");
		
		for(int i=0;i<excel_name_list.size();i++) {
			Map<String,Object> excelDataMap = new HashMap();
			List<String> dateList = new ArrayList<String>();
			List<String> chkList = new ArrayList<String>();
			
			File exfile = new File("D://software etc/"+excel_name_list.get(i)+".xls");
			System.out.println("파일이름 : "+excel_name_list.get(i));
			
			Workbook workbook = WorkbookFactory.create(new FileInputStream(exfile));
			
			Sheet getSheet = workbook.getSheetAt(0);
			
			
			Row row = getSheet.getRow(5);
			
			for(int j=0;j<res_diff_date_list.get(i);j++) {
				
				Cell cell = row.getCell(j+1);
				String value = "";
				if(cell==null){
	                continue;
	            }else{
	                //타입별로 내용 읽기
	                switch (cell.getCellType()){
	                case Cell.CELL_TYPE_FORMULA:
	                    value=cell.getCellFormula();
	                    break;
	                case Cell.CELL_TYPE_NUMERIC:
	                    value=cell.getNumericCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_STRING:
	                    value=cell.getStringCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_BLANK:
	                    value=cell.getBooleanCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_ERROR:
	                    value=cell.getErrorCellValue()+"";
	                    break;
	                }
	            }
				dateList.add(value);
	        }
			
			
			row = getSheet.getRow(6);
			
			for(int k=0;k<res_diff_date_list.get(i);k++) {
				Cell cell = row.getCell(k+1);
				String value = "";
				if(cell==null){
	                continue;
	            }else{
	                //타입별로 내용 읽기
	                switch (cell.getCellType()){
	                case Cell.CELL_TYPE_FORMULA:
	                    value=cell.getCellFormula();
	                    break;
	                case Cell.CELL_TYPE_NUMERIC:
	                    value=cell.getNumericCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_STRING:
	                    value=cell.getStringCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_BLANK:
	                    value=cell.getBooleanCellValue()+"";
	                    break;
	                case Cell.CELL_TYPE_ERROR:
	                    value=cell.getErrorCellValue()+"";
	                    break;
	                }
	            }
				chkList.add(value);
	        }
			System.out.println("여기서는?"+dateList.size());
			System.out.println("여기는?"+chkList.size());
			excelDataMap.put("dateList", dateList);
			excelDataMap.put("chkList", chkList);
			res_excelDataList.add(excelDataMap);
		}
		
		
		
		
		
		
		return res_excelDataList;
	}
}
