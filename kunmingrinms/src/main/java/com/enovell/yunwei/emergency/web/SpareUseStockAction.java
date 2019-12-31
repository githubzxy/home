
/**   
 * 文件名：SpareUseStockAction.java    
 * 版本信息：IRMS1.0   
 * 日期：2016-12-1 下午12:58:12   
 * Copyright Enovell Corporation 2016    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.emergency.web;

import com.enovell.yunwei.common.CommonPoiExportExcel;
import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.emergency.domain.SpareUseStock;
import com.enovell.yunwei.emergency.dto.SpareUseStockDto;
import com.enovell.yunwei.emergency.service.SpareUseStockService;
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
@RequestMapping("/spareUseStockAction")
public class SpareUseStockAction {
	@Resource(name="spareUseStockService")
	SpareUseStockService spareUseStockService;
	
	@RequestMapping(value="/getSpareUseStock",method=RequestMethod.POST)
	@ResponseBody
	public String getSpareUseStock(@RequestParam("sparePartId") String sparePartId, String state,int start,int limit){
		List<SpareUseStock> useStockList =spareUseStockService.getSpareUseStockBySparePartId(sparePartId, state,start,limit);
		List<SpareUseStockDto> dtoList=new ArrayList<SpareUseStockDto>();
		for(SpareUseStock us:useStockList){
			SpareUseStockDto dto=new SpareUseStockDto();
			dto.setDate(us.getDate());
			dto.setUser(us.getUser().getName());
			dto.setAmount(us.getAmount());
			dto.setReason(us.getReason());
			dto.setState(us.getState());
			dtoList.add(dto);
			System.out.println(dto);
		}
		GridDto<SpareUseStockDto> gridDto=new GridDto<SpareUseStockDto>();
		gridDto.setRows(dtoList);
		gridDto.setResults(spareUseStockService.getSpareUseStockCountBySparePartId(sparePartId, state));
		return JsonUtil.javaToJsonAsString(gridDto);
	}
	
	/**导出应急备品使用记录数据至Excel*/
	@RequestMapping(value="/expSpareUseStock",method = RequestMethod.POST)
	@ResponseBody
	public void expSpareUseStock(@RequestParam("exportXlsJson") String exportXlsJson,
												HttpServletRequest request, HttpServletResponse response ){
		//获得当前页的所有记录（数组）
		SpareUseStockDto[] dtos=JsonUtil.jsonToJavaObj(exportXlsJson, SpareUseStockDto[].class);
		if(dtos==null){
			return;
		}
		//将数组转化为List集合	
		List<SpareUseStockDto> dataList=new ArrayList<SpareUseStockDto>(Arrays.asList(dtos));	
		
		Map<String, Object> expandJexlContext = new HashMap<String, Object>();
		expandJexlContext.put("tool", new SimpleDateFormat(JsonUtil.DATE_AND_TIME));
		
		CommonPoiExportExcel<SpareUseStockDto> export = new CommonPoiExportExcel<SpareUseStockDto>();
		if(SpareUseStock.RUKU.equals(dataList.get(0).getState())){
			String[] headerTableColumns = new String[] {//标题行
					"入库时间" + "_" + "20" + "_" + "tool.format(my.getDate())",
					"入库人" + "_" + "20" + "_" + "my.getUser()",
					"入库数量" + "_" + "20" + "_"+ "my.getAmount()",
					"使用详情" + "_" + "50" + "_" + "my.getReason()"
			};
			export.exportXls("应急备品使用记录(入库)", headerTableColumns, expandJexlContext,dataList, request, response);
		}
		if(SpareUseStock.CHUKU.equals(dataList.get(0).getState())){
			String[] headerTableColumns = new String[] {//标题行
					"出库时间" + "_" + "20" + "_" + "tool.format(my.getDate())",
					"出库人" + "_" + "20" + "_" + "my.getUser()",
					"出库数量" + "_" + "20" + "_"+ "my.getAmount()",
					"使用详情" + "_" + "50" + "_" + "my.getReason()"
			};
			export.exportXls("应急备品使用记录(出库)", headerTableColumns, expandJexlContext,dataList, request, response);
		}
	}
	
	
}







