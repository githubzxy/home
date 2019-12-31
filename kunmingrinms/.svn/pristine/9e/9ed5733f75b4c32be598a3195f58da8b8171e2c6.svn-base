
/**   
 * 文件名：SparePartAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-11-30 下午1:18:22   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.enovell.system.common.domain.Organization;
import com.enovell.system.common.domain.User;
import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dailySpare.ExportExcel;
import com.enovell.yunwei.dailySpare.TypeMap;
import com.enovell.yunwei.dailySpare.domain.DailySparePart;
import com.enovell.yunwei.dailySpare.dto.DailySpareAndNormDTO;
import com.enovell.yunwei.dailySpare.dto.DailySpareAndNormExportDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartExportDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartInfoDTO;
import com.enovell.yunwei.dailySpare.dto.DailySparePartShowDTO;
import com.enovell.yunwei.dailySpare.service.DailyDeviceNameService;
import com.enovell.yunwei.dailySpare.service.DailySparePartService;
import com.enovell.yunwei.system.service.OrganizationService;
import com.enovell.yunwei.util.JsonUtil;
import com.enovell.yunwei.util.StringDateToDateUtil;

/**      
 * 项目名称：kunmingrinms
 * 类名称：SparePartAction   
 * 类描述:  日常备品 action
 * 创建人：ltf 
 * 创建时间：2016-11-30 下午1:18:22
 * 修改人：ltf
 * 修改时间：2016-11-30 下午1:18:22   
 *    
 */
@Controller
@RequestMapping("/dailySpare/sparePartAction")
public class DailySparePartAction {
	 /**   
	  * 变量 fixedHeadName : 表头固定列名称（用于标题行固定列）
	  */   
	private  final String[] fixedHeadName={"设备类别","板件名称","设备所属系统","规格型号","单位","厂家","存放地点"};
	   
	 /**   
	  * 变量 fixedHeadId : 固定列id（用于标题结果集Map中的key值）
	  */   
	private  final String[] fixedHeadId={"speciality","sparePartName","deviceProperties","sparePartModel","unit","factory","depositLocation"};
	
	
	
	@Resource(name="dailySparePartService")
	DailySparePartService dailySparePartService;
	
	@Resource(name="dailyDeviceNameService")
	DailyDeviceNameService dailyDeviceNameService;
	
	@Resource(name="organizationService")
	OrganizationService organizationService;
	
	/**
	 * 
	 * getSparePartsByDto 这里添加描述信息
	 *
	 * @author lidt
	 * @date 2017年7月31日 上午10:31:32 
	 * @param speciality 设备类别
	 * @param deviceNameId 设备名称
	 * @param sparePartModel 规格型号
	 * @param workShopId 所属车间
	 * @param workAreaId 所属工区
	 * @param deviceProperties 设备属性
	 * @param start
	 * @param limit
	 * @return
	 */
	@RequestMapping(value="/getSparePartsByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getSparePartsByDto(
			@RequestParam(required = false) String platesName,
			@RequestParam(required = false) String speciality,
			@RequestParam(required = false) String deviceNameId,
			@RequestParam(required = false) String sparePartModel,
			@RequestParam(required = false) String workShopId,
			@RequestParam(required = false) String workAreaId,
			@RequestParam(required = false) String deviceProperties,
			@RequestParam(required = false) String checkStatus,
			@RequestParam(required = false) String putInEndTime,
			@RequestParam(required = false) String putInStartTime,
			int start, int limit){
		DailySparePartDTO dto = new DailySparePartDTO();
		if (StringUtils.isNotBlank(platesName)) {
			dto.setPlatesName(platesName);
		}
		if (StringUtils.isNotBlank(speciality)) {
			dto.setSpeciality(speciality);
		}
//		if (StringUtils.isNotBlank(deviceNameId)) {
//			dto.setDeviceNameId(deviceNameId);
//		}
		if (StringUtils.isNotBlank(sparePartModel)) {
			dto.setSparePartModel(sparePartModel);
		}
		if (StringUtils.isNotBlank(workShopId)) {
			dto.setWorkShopId(workShopId);
		}
		if (StringUtils.isNotBlank(workAreaId)) {
			dto.setWorkAreaId(workAreaId);
		}
		if (StringUtils.isNotBlank(deviceProperties)) {
			dto.setDeviceProperties(deviceProperties);
		}
//		if (StringUtils.isNotBlank(checkStatus)) {
//			dto.setCheckStatus(checkStatus);
//		}
		if (StringUtils.isNotBlank(putInEndTime)) {
			dto.setInEndDate(StringDateToDateUtil.getDate(putInEndTime));
		}
		if (StringUtils.isNotBlank(putInStartTime)) {
			dto.setInStartDate(StringDateToDateUtil.getDate(putInStartTime));
		}
		List<DailySparePartShowDTO> showDtoList= dailySparePartService.getSparePartShowDto(dto, start, limit);
		GridDto<DailySparePartShowDTO> gridDto=new GridDto<DailySparePartShowDTO>();
		gridDto.setRows(showDtoList);
		gridDto.setResults(dailySparePartService.getSparePartCount(dto));
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	/**
	 * 根据系统名获取设备类别
	 */
	@RequestMapping(value="/getTypeBySystemName",method=RequestMethod.POST)
	@ResponseBody
	  public List<Map<String, String>> getMachineroom(@RequestParam(name = "systemName") String systemName) {
			List<String> lbList = dailySparePartService.getTypeBySystem(systemName);
			List<Map<String, String>> lbDatas = new ArrayList<>();
			for (String string : lbList) {
				Map<String, String> map = new HashMap();
				map.put("text", string);
				map.put("value", string);
				lbDatas.add(map);
			}
			return lbDatas;
		}
	@RequestMapping(value="/getSystemName",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> getSystemName() {
		List<String> lbList = dailySparePartService.getSystemName();
		List<Map<String, String>> lbDatas = new ArrayList<>();
		for (String string : lbList) {
			Map<String, String> map = new HashMap();
			map.put("text", string);
			map.put("value", string);
			lbDatas.add(map);
		}
		return lbDatas;
	}



	

	/** 日常备品-新增*/
	@RequestMapping(value="/addSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String addSparePart(@RequestParam("param") String param,
													HttpServletRequest request){
		DailySparePartInfoDTO spareInfo=JsonUtil.jsonToJavaObj(param, DailySparePartInfoDTO.class, "yyyy-MM-dd HH:mm:ss");
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		dailySparePartService.addSparePart(spareInfo, user);
		return JsonUtil.javaToJsonAsString("保存成功");
	}
	
	/**日常备品-入库*/
	@RequestMapping(value="/inSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String inSparePart(@RequestParam("id") String id,
												@RequestParam("amountIn") double amountIn,
												@RequestParam("comment") String comment,
													HttpServletRequest request){
		DailySparePart paramSpare=new DailySparePart();
		paramSpare.setId(id);
		paramSpare.setAmount(amountIn);//入库数量
		paramSpare.setComment(comment);//备注
		
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		dailySparePartService.inSparePart(paramSpare, user);
		return JsonUtil.javaToJsonAsString("入库成功");
	}
	
	/**日常备品-根据id查询*/
	@RequestMapping(value="/getSparePartById",method=RequestMethod.POST)
	@ResponseBody
	public String getSparePartById(@RequestParam("id") String id){
		return JsonUtil.javaToJsonAsString(dailySparePartService.getSparePartById(id));
	}
	
	/**日常备品-修改*/
	@RequestMapping(value="/updateSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String updateSparePart(@RequestParam("param") String param){
		DailySparePart sp=JsonUtil.jsonToJavaObj(param, DailySparePart.class);
		dailySparePartService.updateSparePartNoRecordUseStock(sp);
		return JsonUtil.javaToJsonAsString("修改成功");
	}
	
	/**日常备品-出库*/
	@RequestMapping(value="/outSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String outSparePart(@RequestParam("id") String id,
												@RequestParam("amountOut") double amountOut,
												@RequestParam("rearon") String rearon,
												HttpServletRequest request){
		DailySparePart paramSpare=new DailySparePart();
		paramSpare.setId(id);
		paramSpare.setAmount(amountOut);//出库数量
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		dailySparePartService.outOrScrapSparePart(paramSpare, user, "出库："+rearon);
		return JsonUtil.javaToJsonAsString("出库成功");
	}
	
	/**日常备品-移库*/
	@RequestMapping(value="/moveSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String moveSparePart(@RequestParam("id") String id,
												@RequestParam("workShopId") String workShopId,
												@RequestParam("workAreaId") String workAreaId,
												@RequestParam("amountMove") double amountMove,
												HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		dailySparePartService.moveSparePart(id, workShopId, workAreaId, amountMove, user);
		return JsonUtil.javaToJsonAsString("移库成功");
	}
	
	/**日常备品-返厂*/
	@RequestMapping(value="/ReturnSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String ReturnSparePart(@RequestParam("id") String id,
												@RequestParam("amountReturn") double amountReturn,
												HttpServletRequest request){
		DailySparePart paramSpare=new DailySparePart();
		paramSpare.setId(id);
		paramSpare.setAmount(amountReturn);//返厂数量
		
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		
		dailySparePartService.ReturnSparePart(paramSpare, user);
		return JsonUtil.javaToJsonAsString("返厂成功");
	}
	
	/**日常备品-报废*/
	@RequestMapping(value="/scrapSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String scrapSparePart(@RequestParam("id") String id,
												@RequestParam("amountScrap") double amountScrap,
												@RequestParam("reasonScrap") String reasonScrap,
												HttpServletRequest request){
		DailySparePart paramSpare=new DailySparePart();
		paramSpare.setId(id);
		paramSpare.setAmount(amountScrap);//报废数量
		User user = (User) request.getSession().getAttribute("user");// 读取session中的用户信息
		dailySparePartService.outOrScrapSparePart(paramSpare, user, "报废："+reasonScrap);
		return JsonUtil.javaToJsonAsString("报废成功");
	}
	
	/**日常备品-删除*/
	@RequestMapping(value="/deleteSparePart",method=RequestMethod.POST)
	@ResponseBody
	public String deleteSparePart(@RequestParam("ids") String ids){
		String[] idArr=ids.split(",");
//		for(String id:idArr){
//			System.out.println("要删除的id："+id);
//		}
		dailySparePartService.deleteSpareParts(idArr);
		return JsonUtil.javaToJsonAsString("删除成功");
	}
	
	/**日常备品-导出至Excel*/
	@RequestMapping(value="/expSparePart",method = RequestMethod.POST)
	@ResponseBody
	public void expSparePart(@RequestParam("exportXlsJson") String exportXlsJson,
												HttpServletRequest request, HttpServletResponse response ){
		
		
		DailySparePartDTO dto=JsonUtil.jsonToJavaObj(exportXlsJson, DailySparePartDTO.class);
		List<DailySparePartExportDTO> dataList= dailySparePartService.getSparePartExportDto(dto);
	
		String[] headerTableColumns = new String[] {//标题行
				"设备所属系统" + "_" + "20" + "_" + "my.getDeviceProperties()",
				"设备类别" + "_" + "20" + "_" + "my.getSpeciality()",
				"板件名称" + "_" + "20" + "_" + "my.getPlatesName()",
				"板件可用设备型号" + "_" + "20" + "_" + "my.getAvailableModle()",
				"设备或单板编号" + "_" + "20" + "_" + "my.getSingleNumber()",
				"规格型号" + "_" + "20" + "_"+ "my.getSparePartModel()",
				"单位" + "_" + "10" + "_" + "my.getUnit()",
				"数量" + "_" + "20" + "_" + "my.getAmount()",
				
				"入库原因" + "_" + "20" + "_" + "my.getBuyReason()",
				"入库时间" + "_" + "20" + "_" + "my.getInDate()",
				"软件版本" + "_" + "20" + "_" + "my.getSoftwareEdition()",
				
				"所属车间" + "_" + "20" + "_" + "my.getWorkShop()",
				"所属工区" + "_" + "20" + "_" + "my.getWorkArea()",
				"厂家" + "_" + "20" + "_" + "my.getFactory()",
				"存放地点" + "_" + "20" + "_" + "my.getDepositLocation()",
				"备注" + "_" + "30" + "_" + "my.getComment()"
		};
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<DailySparePartExportDTO> export = new CommonPoiExportExcel<DailySparePartExportDTO>();
	
		export.exportXls("日常备品", headerTableColumns, expandJexlContext,dataList, request, response);
	}
	
	/**备品统计-统计车间下各工区的备品数量*/
	@RequestMapping(value="/getAreaSpareStatisticsByShop",method=RequestMethod.POST)
	@ResponseBody
	public String getAreaSpareStatisticsByShop(@RequestParam("workShopId") String workShopId, int start, int limit){
		//查询所有数据
		List<Map<String,Object>> rowsAll= dailySparePartService.getAreaSpareStatisticsByShop(workShopId);
		//分页，即取子集
		int fromIndex=start;
		int toIndex=start+limit;
		if(toIndex>rowsAll.size()){
			toIndex=rowsAll.size();
		}
		List<Map<String,Object>> rows=rowsAll.subList(fromIndex,toIndex);
		GridDto<Map<String,Object>> gridDto=new GridDto<Map<String,Object>>();
		gridDto.setRows(rows);
		gridDto.setResults((long)rowsAll.size());
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**备品统计-统计各车间的备品数量*/
	@RequestMapping(value="/getShopSpareStatistics",method=RequestMethod.POST)
	@ResponseBody
	public String getShopSpareStatistics(int start, int limit){
		//查询所有数据
		List<Map<String,Object>> rowsAll= dailySparePartService.getShopSpareStatistics();
		//分页，即取子集
		int fromIndex=start;
		int toIndex=start+limit;
		if(toIndex>rowsAll.size()){
			toIndex=rowsAll.size();
		}
		List<Map<String,Object>> rows=rowsAll.subList(fromIndex, toIndex);
		GridDto<Map<String,Object>> gridDto=new GridDto<Map<String,Object>>();
		gridDto.setRows(rows);
		gridDto.setResults((long)rowsAll.size());
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	
	/******************************************************************导出Excel**************************************************************/
	/**    
	 * exportArea 导出指定车间下所有工区的日常备品统计
	 * @param workShopId 车间id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exportArea", method = RequestMethod.GET)
	@ResponseBody
	public void exportArea (@RequestParam("workShopId") String workShopId,
											HttpServletRequest request, 
											HttpServletResponse response) {
		//获取表体数据
		List<Map<String,Object>> dataList= dailySparePartService.getAreaSpareStatisticsByShop(workShopId);
		//将数据中设备类别、单位转化为中文
		dataList=convertDataToChinese(dataList);
		
		//获取固定列
		List<String[]> fixedIdAndNames=new ArrayList<String[]>();
		fixedIdAndNames.add(fixedHeadId);
		fixedIdAndNames.add(fixedHeadName);
		
		//获取日常备品所属机构（动态列）
		List<List<String>> idAndNames=getOrgIdAndName(workShopId);
		if(idAndNames==null||idAndNames.size()==0){
			return;
		}
		
		ExportExcel exp=new ExportExcel();
		exp.exportXls("日常备品统计", null,"存放地点及数量", fixedIdAndNames, idAndNames, dataList, request, response);
		
	}
	
	
	/**    
	 * exportShop 导出所有车间的日常备品
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exportShop", method = RequestMethod.GET)
	@ResponseBody
	public void exportShop (HttpServletRequest request, HttpServletResponse response) {
		//获取表体数据
		List<Map<String,Object>> dataList= dailySparePartService.getShopSpareStatistics();
		//将数据中设备类别、单位转化为中文
		dataList=convertDataToChinese(dataList);
		
		//获取固定列
		List<String[]> fixedIdAndNames=new ArrayList<String[]>();
		fixedIdAndNames.add(fixedHeadId);
		fixedIdAndNames.add(fixedHeadName);
		
		//获取日常备品所属机构（动态列）
		List<List<String>> idAndNames=getOrgIdAndName(null);//参数为null查询所有车间
		if(idAndNames==null||idAndNames.size()==0){
		return;
		}
		
		ExportExcel exp=new ExportExcel();
		exp.exportXls("日常备品统计", null,"存放地点及数量", fixedIdAndNames, idAndNames, dataList, request, response);
		
	}
	
	
	/**    
	 * convertDataToChinese 将数据中设备类别、单位转化为中文
	 * @param dataList
	 * @return
	 */
	private List<Map<String,Object>> convertDataToChinese(List<Map<String,Object>> dataList){
		for(Map<String,Object> map : dataList){
			//设备类别转化为中文
			Integer speciality=map.get("speciality")!=null ? (Integer)map.get("speciality"):-1;
			map.put("speciality", dailySparePartService.emergencySpeciality(speciality));
			//单位转化为中文
			Integer unit=map.get("unit")!=null ? (Integer)map.get("unit"):-1;
			map.put("unit", TypeMap.unitToChinese(unit));
		}
		return dataList;
	}
	
	
	/**    
	 * getOrgIdAndName 将组织机构id与名称封装在List集合并返回
	 * @param workShopId 车间id，；当为null时，查询所有车间
	 * @return
	 */
	//当不为null时，查询其下所有工区
	private List<List<String>> getOrgIdAndName(String workShopId){
		List<List<String>> idAndNames=new ArrayList<List<String>>();//机构id和名称
		
		List<String> ids=new ArrayList<String>();//机构id（对应结果集Map中的key值）
		List<String> names=new ArrayList<String>();//机构名称（对应结果集Map中的value值）
		
		List<Organization> orgList=new ArrayList<Organization>();
		
		if(StringUtils.isNotBlank(workShopId)){
			
			String[] wsIds = workShopId.split(",");
			//获取当前组织机构名
			for (int i = 0; i < wsIds.length; i++) {
				Organization cur_org=organizationService.getOrgChildrenById(wsIds[i]);
				String workShopName=cur_org!=null?cur_org.getName():"";
				//根据车间id获取工区
				for(Organization o:organizationService.getChildrenByPid(wsIds[i])){
					orgList.add(o);
				}
				ids.add(wsIds[i]);//当前车间也作为工区的一员，且放在第一个
				names.add(workShopName);
			}
		}else{
			orgList=organizationService.getAllWorkshop();
		}
		
		
		for(Organization o:orgList){
			ids.add(o.getId());
			names.add(o.getName());
		}
		//最后一列为：小计列
		ids.add("sum");
		names.add("小计");
		
		idAndNames.add(ids);
		idAndNames.add(names);
		
		return idAndNames;
	}
	
	
	
	
	
	
	/**日常备品及对应的指标--条件、分页查询统计（用于高铁、普铁无线、普铁有线统计）*/
	@RequestMapping(value="/getSpareAndNormByDto",method=RequestMethod.POST)
	@ResponseBody
	public String getSpareAndNormByDto(@RequestParam(value = "deviceNameId", required = false) String deviceNameId,
																@RequestParam(value = "workShopId", required = false) String workShopId,
																@RequestParam(value = "status", required = false) String status,
																@RequestParam(value = "speciality", required = false) int speciality,
																@RequestParam(value = "deviceProperties", required = false) String deviceProperties,
																@RequestParam("start") int start,
																@RequestParam("limit") int limit){
		DailySpareAndNormDTO dto= new DailySpareAndNormDTO();
		// 拼接查询条件
		if (StringUtils.isNotEmpty(String.valueOf(speciality))) {
			dto.setSpeciality(speciality);
		}
		if (StringUtils.isNotEmpty(deviceNameId)) {
			dto.setDeviceNameId(deviceNameId);
		}
		if (StringUtils.isNotEmpty(workShopId)) {
			dto.setWorkShopId(workShopId);
		}
		if (StringUtils.isNotEmpty(status)) {
			dto.setStatus(status);
		}
		if(StringUtils.isNotBlank(deviceProperties)){
			dto.setDeviceProperties(deviceProperties);
		}
//		System.out.println(dto);
		List<DailySpareAndNormDTO> rows= dailySparePartService.getSpareAndNormByDto(dto, start, limit);
		GridDto<DailySpareAndNormDTO> gridDto=new GridDto<DailySpareAndNormDTO>();
		gridDto.setRows(rows);
		gridDto.setResults(dailySparePartService.getSpareAndNormByDtoCount(dto));
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	
	/**
	 * 备品备件批量审核通过
	 * auditSparePass 
	 * @param ids
	 * @author luoyan
	 */
	@RequestMapping(value="/auditSparePass",method = RequestMethod.POST)
	@ResponseBody
	public void auditSparePass(String ids,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		dailySparePartService.auditSparePass(ids, user);
	}
	
	/**
	 * 备品备件批量审核不通过
	 * auditSparePass 
	 * @param ids
	 * @author luoyan
	 */
	@RequestMapping(value="/auditSpareNoPass",method = RequestMethod.POST)
	@ResponseBody
	public void auditSpareNoPass(String ids,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		dailySparePartService.auditSpareNoPass(ids, user);
	}
	
	/**日常备品及对应的指标--导出至Excel（用于高铁、普铁无线、普铁有线统计）*/
	@RequestMapping(value="/expSpareAndNorm",method = RequestMethod.POST)
	@ResponseBody
	public void expSpareAndNorm(@RequestParam("exportXlsJson") String exportXlsJson,
												HttpServletRequest request, HttpServletResponse response ){
//		//获得当前页的所有记录（数组）
//		SpareAndNormExportDTO[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, SpareAndNormExportDTO[].class);
//		//将数组转化为List集合	
//		List<SpareAndNormExportDTO> dataList=new ArrayList<SpareAndNormExportDTO>(Arrays.asList(dtos));	
		DailySpareAndNormDTO dto = JsonUtil.jsonToJavaObj(exportXlsJson, DailySpareAndNormDTO.class);
		List<DailySpareAndNormExportDTO> dataList = dailySparePartService.getExpSpareAndNorm(dto);
		String[] headerTableColumns = new String[] {//标题行
				"设备类别" + "_" + "28" + "_" + "my.getSpeciality()",
				"设备属性" + "_" + "25" + "_" + "my.getDeviceProperties()",
				"设备名称" + "_" + "25" + "_" + "my.getDeviceName()",
				"所属车间" + "_" + "25" + "_" + "my.getWorkShop()",
				"现有量" + "_" + "25" + "_" + "my.getAmount()",
				"标准量" + "_" + "25" + "_" + "my.getNormValue()",
				"厂家" + "_" + "25" + "_" + "my.getFactory()",
				"存放地点" + "_" + "25" + "_" + "my.getDepositLocation()",
				"是否达标" + "_" + "25" + "_" + "my.getStatus()"
		};
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		String fileName= dailySparePartService.emergencySpeciality(dto.getSpeciality())+"统计";//文件名即日常备品名
		CommonPoiExportExcel<DailySpareAndNormExportDTO> export = new CommonPoiExportExcel<DailySpareAndNormExportDTO>();
		export.exportXls(fileName, headerTableColumns, expandJexlContext,dataList, request, response);
	}
	/**
	 * 
	 * importData 导入
	 * @param request
	 * author: yangsy
	 * 修改：quyy
	 */
	@RequestMapping(value = "/importData", method = RequestMethod.POST)
	@ResponseBody
	public String importData(
			HttpServletRequest request,
			HttpServletResponse res, 
			@RequestParam("file")MultipartFile file,
			@RequestParam("threePerId") String threePerId) {
		User user = (User) request.getSession().getAttribute("user");
		try{
			Workbook wb = dailySparePartService.importExcel(file,user);
//		    System.out.println(wb);
			if(wb==null){
//				System.out.println("=====================");
				res.sendRedirect(request.getContextPath()+"/views/dailySpare/sparePartsPage.jsp?threePerId="+threePerId);
			}else{
				writeErrorMsgToResponse(wb, request, res);
			}
		 }catch(Exception e){
			e.printStackTrace();
			res.setContentType("text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");
			try {
				res.getWriter().write(getResultHTML("文件导入失败，请联系管理员"));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return "true";
		
	}
	/**
	 * 发生异常返回结果HTML
	 * @return
	 */
	private String getResultHTML(String msg) {
		String html = "<head>" +
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />" +
				"<style>"+
				"body{text-align:center}"+
				"div {margin:0 auto; width:400px; height:200px; border:1px solid #F00;valign:center;align:center;line-height:100px}"+
				"</style>"+
				"</head>" +
				"<body onLoad=\"setTimeout(window.close, 5000)\">" +
				"<div> " +
				msg + "<br/>" +
				"本页面5秒后自动关闭，或者也可以点击<a href=\"#\" onclick=\"window.close()\">关闭</a>" +
				"</div>" +
				"</body>";
		return html;
	}
	
	/**
	 * 将失败信息以文件流形式返回给客户端
	 * @param response
	 */
	private void writeErrorMsgToResponse(Workbook wb,HttpServletRequest request,
			HttpServletResponse response) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			String fileName = "errorMsg-"+sdf.format(new Date())+".xls";
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fileName.getBytes("utf-8"), "ISO8859-1"));//进行文件名转码，在win客户端下载时显示正确的文件名
			wb.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		} 		
	}
	
}
