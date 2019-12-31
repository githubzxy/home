
/**   
 * 文件名：SpareUseStockAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-1 下午12:58:12   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare.web;

import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.dailySpare.domain.DailySpareUseStock;
import com.enovell.yunwei.dailySpare.dto.DailySpareUseStockDto;
import com.enovell.yunwei.dailySpare.service.DailySpareUseStockService;
import com.enovell.yunwei.util.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;


/**      
 * 项目名称：kunmingrinms
 * 类名称：SpareUseStockAction   
 * 类描述:  备品使用情况 action
 * 创建人：ltf 
 * 创建时间：2016-12-1 下午12:58:12
 * 修改人：ltf
 * 修改时间：2016-12-1 下午12:58:12   
 *    
 */
@Controller
@RequestMapping("/dailySpare/spareUseStockAction")
public class DailySpareUseStockAction {
	@Resource(name="dailySpareUseStockService")
	DailySpareUseStockService dailySpareUseStockService;
	
	@RequestMapping(value="/getSpareUseStock",method=RequestMethod.POST)
	@ResponseBody
	public String getSpareUseStock(@RequestParam("sparePartId") String sparePartId, String state,int start,int limit){
		List<DailySpareUseStock> useStockList = dailySpareUseStockService.getSpareUseStockBySparePartId(sparePartId, state,start,limit);
		List<DailySpareUseStockDto> dtoList=new ArrayList<DailySpareUseStockDto>();
		for(DailySpareUseStock us:useStockList){
			DailySpareUseStockDto dto=new DailySpareUseStockDto();
			dto.setDate(us.getDate());
			dto.setUser(us.getUser().getName());
			dto.setAmount(us.getAmount());
			dto.setReason(us.getReason());
			dto.setState(us.getState());
			dtoList.add(dto);
			System.out.println(dto);
		}
		GridDto<DailySpareUseStockDto> gridDto=new GridDto<DailySpareUseStockDto>();
		gridDto.setRows(dtoList);
		gridDto.setResults(dailySpareUseStockService.getSpareUseStockCountBySparePartId(sparePartId, state));
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**导出日常备品使用记录数据至Excel*/
	@RequestMapping(value="/expSpareUseStock",method = RequestMethod.POST)
	@ResponseBody
	public void expSpareUseStock(@RequestParam("exportXlsJson") String exportXlsJson,
												HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		DailySpareUseStockDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, DailySpareUseStockDto[].class);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<DailySpareUseStockDto> dataList=new ArrayList<DailySpareUseStockDto>(Arrays.asList(dtos));
		
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<DailySpareUseStockDto> export = new CommonPoiExportExcel<DailySpareUseStockDto>();
		if(DailySpareUseStock.RUKU.equals(dataList.get(0).getState())){
			String[] headerTableColumns = new String[] {//标题行
					"入库时间" + "_" + "20" + "_" + "tool.format(my.getDate())",
					"入库人" + "_" + "20" + "_" + "my.getUser()",
					"入库数量" + "_" + "20" + "_"+ "my.getAmount()",
					"使用详情" + "_" + "50" + "_" + "my.getReason()"
			};
			export.exportXls("日常备品使用记录(入库)", headerTableColumns, expandJexlContext,dataList, request, response);
		}
		if(DailySpareUseStock.CHUKU.equals(dataList.get(0).getState())){
			String[] headerTableColumns = new String[] {//标题行
					"出库时间" + "_" + "20" + "_" + "tool.format(my.getDate())",
					"出库人" + "_" + "20" + "_" + "my.getUser()",
					"出库数量" + "_" + "20" + "_"+ "my.getAmount()",
					"使用详情" + "_" + "50" + "_" + "my.getReason()"
			};
			export.exportXls("日常备品使用记录(出库)", headerTableColumns, expandJexlContext,dataList, request, response);
		}
	}
	
	
}







