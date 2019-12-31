package com.enovell.yunwei.dailySpare;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.enovell.system.common.domain.Organization;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.system.service.OrganizationService;

public class ImportDailySpare {
	
	//总行数
    private int totalRows = 0;  
    //总条数
    private int totalCells = 0; 
    //错误信息接收器
    private String errorMsg;
    //构造方法
    public ImportDailySpare(){}
    //获取总行数
    public int getTotalRows()  { return totalRows;} 
    //获取总列数
    public int getTotalCells() {  return totalCells;} 
    //获取错误信息
    public String getErrorInfo() { return errorMsg; }    
  /**
   * 读EXCEL文件，获取信息集合
   * @param fielName
   * @return
   */
	public List<DailySparePart> getExcelInfo(MultipartFile mFile) {
		String fileName = mFile.getOriginalFilename();//获取文件名
		System.out.println("文件名"+fileName);
		List<DailySparePart> fdpList = null;
		try {
			if (!validateExcel(fileName)) {// 验证文件名是否合格
				return null;
			}
			boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
			if (isExcel2007(fileName)) {
				isExcel2003 = false;
			}
		  fdpList = createExcel(mFile.getInputStream(), isExcel2003);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fdpList;
	}
  /**
   * 根据excel里面的内容信息
   * @param is 输入流
   * @param isExcel2003 excel是2003还是2007版本
   * @return
 * @throws ParseException 
   * @throws IOException
   */
	public List<DailySparePart> createExcel(InputStream is, boolean isExcel2003) throws ParseException {
		List<DailySparePart> fdpList = null;
		try{
			Workbook wb = null;
			if (isExcel2003) {// 当excel是2003时,创建excel2003
				wb = new HSSFWorkbook(is);
			} else {// 当excel是2007时,创建excel2007
				wb = new XSSFWorkbook(is);
			}
			 fdpList = readExcelValue(wb);// 读取Excel里面客户的信息
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fdpList;
	}  
  /**
   * 读取Excel里面的信息
   * @param wb
   * @return
 * @throws ParseException 
   */
	private List<DailySparePart> readExcelValue(Workbook wb) throws ParseException {
		// 得到第一个shell
		Sheet sheet = wb.getSheetAt(0);
		System.out.println("gaolei dayin============" +sheet);
		// 得到Excel的行数
		this.totalRows = sheet.getPhysicalNumberOfRows();
		System.out.println("行数======="+this.totalRows);
		// 得到Excel的列数(前提是有行数)
		if (totalRows > 1 && sheet.getRow(0) != null) {
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
			System.out.println("总列数=========="+this.totalCells);
		}
		List<DailySparePart> fdpList = new ArrayList<DailySparePart>();
		// 循环Excel行数
		for (int r = 1; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null){
				continue;
			}
			DailySparePart dailySparePart = new DailySparePart();
			// 循环Excel的列

			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				if (null != cell) {
				    if (c == 1){
							dailySparePart.setDeviceProperties(cell.getStringCellValue());
						}
					else if (c == 2){  
							dailySparePart.setSpeciality(cell.getStringCellValue());
					}
					else if (c == 3){   
							dailySparePart.setPlatesName(cell.getStringCellValue());
					}
					else if (c == 4){
							 dailySparePart.setAvailableModle(cell.getStringCellValue());
					}
					else if (c == 5){
							dailySparePart.setSingleNumber(cell.getStringCellValue());
					}
					else if (c == 6){
							dailySparePart.setSparePartModel(cell.getStringCellValue());
					}
					else if (c == 7){
							dailySparePart.setUnit(cell.getStringCellValue());
					}
					else if (c == 8){
						if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
							dailySparePart.setAmount(cell.getNumericCellValue());
						}else{
							dailySparePart.setAmount(Double.parseDouble(cell.getStringCellValue()));
						}					}
					else if (c == 9){
						
							dailySparePart.setBuyReason(cell.getStringCellValue());
					}
					else if (c == 10){
						if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
							Date entryDate = cell.getDateCellValue();
				    		dailySparePart.setInDate(entryDate);
						}else{
							SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							dailySparePart.setInDate(dateFormat.parse(cell.getStringCellValue()));
						}
					}
					else if (c == 11){
						dailySparePart.setSoftwareEdition(cell.getStringCellValue());
					}
				    //==============================================
					else if (c == 12){
//						List<Organization> workShops = organizationService.getAllWorkshop();
//						 System.out.println("==================");
//						 workShops.forEach(System.out::print);
//						 String workShopId ="";
//						 for (Organization organization : workShops) {
//							 if (organization.getName().equals(cell.getStringCellValue())) {
//					              workShopId = organization.getId();
//					            }
//						 }
//							   Organization workShop = new Organization();
//			                    //设置车间id
//			                    workShop.setId(workShopId);
//			                    //设置车间
//			                    dailySparePart.setWorkShop(workShop);
						 Organization workShop = new Organization();
						 workShop.setName(cell.getStringCellValue());
						 dailySparePart.setWorkShop(workShop);
						}
					else if (c == 13){
//						 List<Organization> workAreas = organizationService.getChildrenByPid(dailySparePart.getWorkShop().getId());
//						 String workAreaId ="";
//						 for (Organization organization : workAreas) {
//							 if (organization.getName().equals(cell.getStringCellValue())) {
//								 workAreaId = organization.getId();
//					            }
//						 }
//							   Organization workArea = new Organization();
//			                    //设置车间id
//							   workArea.setId(workAreaId);
//			                    //设置车间
//			                    dailySparePart.setWorkShop(workArea);
						 Organization workArea = new Organization();
						 workArea.setName(cell.getStringCellValue());
						 dailySparePart.setWorkArea(workArea);
						}
				
					else if (c == 14){
						dailySparePart.setFactory(cell.getStringCellValue());
					}
					else if (c == 15){
						dailySparePart.setDepositLocation(cell.getStringCellValue());
					}
					else if (c == 16){
						dailySparePart.setComment(cell.getStringCellValue());
					}
				}
			}
			// 添加到list
			fdpList.add(dailySparePart);
		}
		return fdpList;
	}
	/**
	 * 验证EXCEL文件
	 * @param filePath
	 * @return
	 */
	public boolean validateExcel(String filePath) {
		if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
			errorMsg = "文件名不是excel格式";
			return false;
		}
		return true;
	}
	// @描述：是否是2003的excel，返回true是2003 
    public static boolean isExcel2003(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xls)$");  
     }  
    //@描述：是否是2007的excel，返回true是2007 
    public static boolean isExcel2007(String filePath)  {  
         return filePath.matches("^.+\\.(?i)(xlsx)$");  
     }  
}
