package com.enovell.yunwei.onduty.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.enovell.system.common.domain.User;
import com.enovell.yunwei.util.CellUtil;
import com.enovell.yunwei.util.DataExistStatus;
import com.enovell.yunwei.util.NumberUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.enovell.yunwei.onduty.domain.OnDutyCheckDTO;
import com.enovell.yunwei.onduty.service.OnDutyValidateService;
import com.enovell.yunwei.onduty.service.OndutyInsertService;
import com.enovell.yunwei.onduty.service.OndutyService;
import com.enovell.yunwei.util.ValidateMsg;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：OnDutyValidateServiceImpl   
 * 类描述:  验证数据有效型
 * 创建人：yangsy
 * 创建时间：2017-5-15 上午10:15:26
 * 修改人： luoyan  2017-7-7  提取方法
 */
@Transactional
@Service("onDutyValidateService")
public class OnDutyValidateServiceImpl implements OnDutyValidateService {
	
	@Autowired
	private SessionFactory sessionFactory;
	@Resource(name = "ondutyInsertService")
	private OndutyInsertService ondutyInsertService;
	@Resource(name="ondutyService")
	OndutyService ondutyService;
	@Resource(name="namedParameterJdbcTemplate")
	NamedParameterJdbcTemplate nj;
	SimpleDateFormat sdfToDate = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdfToStr = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public List<ValidateMsg> validate(String originFileName,List<ValidateMsg> msgs, Workbook wb,User createUser) {
			
		List<ValidateMsg> results = fileTypeValidate(originFileName,msgs,wb);//对文件进行验证（文件标题）
		
		if(results.isEmpty()){//数据的有效性验证（是否有空行，单元格是否为空，日期与星期是否匹配，值班人与值班部门是否存在系统组织里）
			results = ondutyDeptAndPeopleValidate(originFileName,msgs,wb,null);
		}
		if(results.isEmpty()){//验证数据是否重复
			results = ondutyRepeatValidate(originFileName,msgs,wb);
		}
		if(results.isEmpty()){//无任何错误信息（导入数据库）
			ondutyInsertService.batchInsertDeviceAnalyse(wb,createUser);
		}
		return results;
		
	}
	
	/**
	 * 
	 * ondutyDeptAndPeopleValidate 
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @return
	 * 修改人： luoyan  2017-7-7  提取方法
	 */
	@Override
	public List<ValidateMsg> ondutyDeptAndPeopleValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb,String orgId){
		Sheet sheet = wb.getSheetAt(0);
		
		int rowNum = sheet.getPhysicalNumberOfRows();
	    int cellNum = sheet.getRow(2).getPhysicalNumberOfCells();
	    
	    
	    //验证单元格是否为空
	    //遍历行（从第3行开始，下标从2开始）
	    for(int j=2;j<rowNum;j++){
	    	Row row = sheet.getRow(j);
	    	//遍历列（从第1列开始，下标从0开始）
	    	int count = 0;
	    	for(int k=0;k<cellNum;k++){
	    		Cell cell = row.getCell(k);
	    		String content = CellUtil.getCellValue(cell);
	    		if(StringUtils.isBlank(content)){
	    			count++;
	    		}
	    	}
	    	if(count==cellNum){
	    		//如果每列都是空执行该方法并结束这次循环执行下一次
	    		CellUtil.rowNullMsg(j+1, originFileName, msgs, sheet.getSheetName());
	    		continue;
	    	}
	    	
	    	//如果有一列不为空从这里开始执行单元格非空验证
	    	validateSpace(originFileName, msgs,sheet,row,cellNum,j);
	    	//验证日期与星期是否匹配
	    	validateWeek(originFileName,msgs,sheet,row,j);
	    	//验证值班人是否存在于系统组织机构，值班部门是否存在于系统组织机构，值班人与值班部门是否匹配
	    	validateDeptAndPeople(originFileName,msgs,sheet,row,j,orgId);
	    }
	    return msgs;
	}
	
	
	/**
	 * 
	 * ondutyRepeatValidate 
	 * @param originFileName
	 * @param msgs
	 * @param wb
	 * @return
	 * 修改人： luoyan  2017-7-7  提取方法
	 */
	@Override
	public List<ValidateMsg> ondutyRepeatValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb){
		
		Sheet sheet = wb.getSheetAt(0);
		int rowNum = sheet.getPhysicalNumberOfRows();
		//用于封装是重复的数据的集合
	    List<OnDutyCheckDTO> repeatOnDutys = new ArrayList<OnDutyCheckDTO>();
	    
	    //验证填写excel表中数据是否有多行数据是相同的（同一时间里的用户只能有一个）
	    handleRepeatDate(sheet,rowNum,repeatOnDutys);
	    //封装错误提示信息（用于下载成excel）
	    handleErrorMsg(originFileName,msgs,repeatOnDutys,sheet);
		
		return msgs;
		
	}
	
	private List<ValidateMsg> fileTypeValidate(String originFileName,List<ValidateMsg> msgs, Workbook wb){
		
		Sheet sheet = wb.getSheetAt(0);
		String title = CellUtil.getTitle(sheet);
		
		if(StringUtils.isBlank(title) || !title.equals("全部值班管理信息表")){
			ValidateMsg m = new ValidateMsg();
			m.setRow("1");
			m.setSheet(sheet.getSheetName());
			m.setFileName(originFileName);
			m.setErrorMsg("文件标题有误，应为【全部值班管理信息表】");
			msgs.add(m);
			return msgs;
		}
		//验证文件第二行是否有误
		Row row = sheet.getRow(1);
		for (int i = 0; i < row.getPhysicalNumberOfCells(); i++) {
			String cell  = CellUtil.getCellValue(row.getCell(i));
			switch (i) {
			case 0:
				checkHeader(cell, "序号", sheet, originFileName, msgs,1,row);
				break;
			case 1:
				checkHeader(cell, "值班日期", sheet, originFileName, msgs,2,row);
				break;
			case 2:
				checkHeader(cell, "星期", sheet, originFileName, msgs,3,row);
				break;
			case 3:
				checkHeader(cell, "值班部门", sheet, originFileName, msgs,4,row);
				break;
			case 4:
				checkHeader(cell, "值班人", sheet, originFileName, msgs,5,row);
				break;
			case 5:
				checkHeader(cell, "固定电话", sheet, originFileName, msgs,6,row);
				break;
			case 6:
				checkHeader(cell, "手机", sheet, originFileName, msgs,7,row);
				break;
			default:
				break;
			}
		}	
		return msgs;
		
	}
	
	/**
	 * 判断表头是否符合要求
	 * 符合 --- 返回为 true
	 * 不符合 --- 返回为false
	 * @return
	 * @author	liwt
	 */
	private Boolean checkHeader(String cell,String field,Sheet sheet,String originFileName,List<ValidateMsg> msgs,int i,Row row) {
		if(StringUtils.isBlank(cell)||!field.equals(cell)) {
			ValidateMsg m = new ValidateMsg();
			m.setRow("2");
			m.setIndex(CellUtil.getCellValue(row.getCell(0)));//设置序号
			m.setSheet(sheet.getSheetName());
			m.setFileName(originFileName);
			m.setColumn(NumberUtil.columnNum2String(i));//设置第几列
			m.setErrorMsg("文件表头有误，请使用标准格式");
			msgs.add(m);
			return false;
		}
		return true;
	}
	
	private void validateDeptAndPeople(String originFileName,List<ValidateMsg> msgs,Sheet sheet,Row row,int j,String orgId) {
		String ondutyDept = CellUtil.getCellValue(row.getCell(3));
    	String ondutyPeople = CellUtil.getCellValue(row.getCell(4));
    	if(StringUtils.isNotBlank(ondutyDept)&&StringUtils.isNotBlank(ondutyPeople)){
    		Boolean flag = checkDeptAndPeople(ondutyDept,ondutyPeople,orgId);
    		if (flag == false) {
    			ValidateMsg m = new ValidateMsg();
    			m.setFileName(originFileName);
    			m.setIndex(CellUtil.getCellValue(row.getCell(0)));//设置序号
    			m.setRow(String.valueOf(j+1));//设置第几行
    			m.setColumn(NumberUtil.columnNum2String(4)+"和"+NumberUtil.columnNum2String(5));//设置第几列
    			m.setSheet(sheet.getSheetName());
    			m.setErrorMsg("值班部门与值班人数据有误");					
    			msgs.add(m);
    		}
    	}
		
	}
	
	private void validateWeek(String originFileName,List<ValidateMsg> msgs,Sheet sheet,Row row,int j) {
		//验证日期与星期是否匹配
    	String ondutyDate = CellUtil.getCellValue(row.getCell(1));
    	String ondutyWeek = CellUtil.getCellValue(row.getCell(2));
    	if(StringUtils.isNotBlank(ondutyDate)&&StringUtils.isNotBlank(ondutyWeek)){
    		boolean flag = CellUtil.checkDateAndWeek(ondutyDate,ondutyWeek);
    		if(flag==false){
    			ValidateMsg m = new ValidateMsg();
    			m.setFileName(originFileName);
    			m.setIndex(CellUtil.getCellValue(row.getCell(0)));//设置序号
    			m.setRow(String.valueOf(j+1));//设置第几行
    			m.setColumn(NumberUtil.columnNum2String(2)+"和"+NumberUtil.columnNum2String(3));//设置第几列
    			m.setSheet(sheet.getSheetName());
    			m.setErrorMsg("日期与星期不匹配");					
    			msgs.add(m);
    		}
    	}
	}

	
	private void validateSpace(String originFileName,List<ValidateMsg> msgs,Sheet sheet,Row row, int cellNum,int j) {
		
    	//如果有一列不为空从这里开始执行
    	for(int k=0;k<cellNum-2;k++){
    		//遍历列
    		Cell cell = row.getCell(k);
    		String content = CellUtil.getCellValue(cell);
    		if(StringUtils.isBlank(content)){
				ValidateMsg m = new ValidateMsg();
				m.setFileName(originFileName);
				m.setIndex(CellUtil.getCellValue(row.getCell(0)));//设置序号
				m.setRow(String.valueOf(j+1));//设置第几行
				m.setColumn(NumberUtil.columnNum2String(k+1));//设置第几列
				m.setSheet(sheet.getSheetName());
				if(k==0){
					m.setErrorMsg("序号不能为空");
				}
				if(k==1){
					m.setErrorMsg("日期不能为空");
				}
				if(k==2){
					m.setErrorMsg("星期不能为空");
				}
				if(k==3){
					m.setErrorMsg("值班部门不能为空");
				}
				if(k==4){
					m.setErrorMsg("值班人不能为空");
				}
				msgs.add(m);
			}else{
				if(k==1){
					//验证日期格式
					String ondutyDate = CellUtil.getCellValue(row.getCell(k));
					try {
						ondutyDate = sdfToStr.format(sdfToDate.parse(ondutyDate));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					if(!(CellUtil.checkDateIsFormat(ondutyDate))){
						CellUtil.dateFormat(CellUtil.getCellValue(row.getCell(0)), j+1, k+1, originFileName, msgs, sheet.getSheetName(), ondutyDate);
					}
				}
			}
    	}
    	
	}

	

	private void handleErrorMsg(String originFileName,List<ValidateMsg> msgs,List<OnDutyCheckDTO> repeatOnDutys,Sheet sheet) {
		//封装错误提示信息（用于下载成excel）
		for(OnDutyCheckDTO rod : repeatOnDutys){
			ValidateMsg m = new ValidateMsg();
			m.setFileName(originFileName);
			m.setIndex(rod.getIndex());
			m.setRow(rod.getRow());
			m.setColumn(NumberUtil.columnNum2String(2)+"和"+NumberUtil.columnNum2String(4)+"和"+NumberUtil.columnNum2String(5));
			m.setSheet(sheet.getSheetName());
			m.setErrorMsg("日期为"+StringDateToDateUtil.getDateStringNotTime(rod.getDutyDate())+"并且部门为"+rod.getUser().getOrganization().getName()
					+"并且值班人为"+rod.getUser().getName()+"的数据存在重复，请修改！");
			msgs.add(m);
		}
			    
	}

	private void handleRepeatDate(Sheet sheet,int rowNum,List<OnDutyCheckDTO> repeatOnDutys) {
		//封装用于判断重复的基准数据
	    Map<String,OnDutyCheckDTO> basicData = new HashMap<String,OnDutyCheckDTO>();
		
		for (int i = 2; i < rowNum; i++) {
			//获取每行数据
	    	Row row = sheet.getRow(i);
	    	
	    	String index = CellUtil.getCellValue(row.getCell(0));
	    	String dutyDate = CellUtil.getCellValue(row.getCell(1));
    		String orgName = CellUtil.getCellValue(row.getCell(3));
    		String userName = CellUtil.getCellValue(row.getCell(4));
    		User user = ondutyService.getDeptAndPeople(orgName, userName);
    		
    		OnDutyCheckDTO dto = new OnDutyCheckDTO();
    		try {
    			dutyDate = sdfToStr.format(sdfToDate.parse(dutyDate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
    		dto.setDutyDate(StringDateToDateUtil.getDate(dutyDate+" 00:00:00"));
    		dto.setUser(user);
    		dto.setRow(String.valueOf(i+1));
    		dto.setIndex(index);
    		//由于判断是否是重复数据的依据是同一日期下的相同值班部门，所以将日期与值班部门的字符串拼接后作为key
    		//修改人：luoyan 2017-11-22  判断是否是重复数据的依据是同一日期下的相同值班部门的同一个人
    		String key = dto.getDutyDate().toString()+dto.getUser().getOrganization().getId()+dto.getUser().getId();
    		//修改人：luoyan 2018-04-19 导入数据与数据库数据对比是否有重复
    		String sql = "SELECT " + 
	    				"    count(*) " + 
	    				"FROM " + 
	    				"    onduty " + 
	    				"WHERE " + 
	    				"        userid_ = :userId " + 
	    				"    AND " + 
	    				"        TO_CHAR(dutydate_,'yyyy-mm-dd') = :dutyDate "+ 
	    				"	 AND EXIST_=:exist ";
    		Map<String,Object> param = new HashMap<>();
    		param.put("userId", user.getId());
    		param.put("dutyDate", dutyDate);
    		param.put("exist", DataExistStatus.EXIST);
    		Long count = nj.queryForObject(sql, param, Long.class);
    		if(count>=1) {
    			repeatOnDutys.add(dto);
    			break;
    		}
    		//将获取到的key作为参数在基准数据中查询是否存在
    		OnDutyCheckDTO basicDto = basicData.get(key);
			if(basicDto!=null){
				repeatOnDutys.add(dto);
			}
    		basicData.put(key,dto);
    		
		}
		
	}

	private Boolean checkDeptAndPeople(String ondutyDept, String ondutyPeople, String orgId) {
			
		Session session = sessionFactory.getCurrentSession();
		String eql = "FROM User u "
				+ " LEFT JOIN FETCH u.organization o"
				+ " WHERE u.name=:name AND o.name=:dept AND u.deleState=:userdel AND o.deleteState=:orgdel";
		Query query = session.createQuery(eql);
		query.setParameter("name", ondutyPeople);
		query.setParameter("dept", ondutyDept);
		query.setParameter("userdel", 1);
		query.setParameter("orgdel", 1);
		
		User user = (User) query.uniqueResult();
		
		if(StringUtils.isNotBlank(orgId)){
			if(user != null && orgId.equals(user.getOrganization().getId())){
				return true;
			}
		}else{
			if(user!=null){
				return true;
			}
		}
		return false;
	}
	

}
