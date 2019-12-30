package com.enovell.km_app_micro_service.action.dataStatisticsManage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.enovell.km_app_micro_service.dto.DataStatisticsDto;
import com.enovell.km_app_micro_service.dto.GridDto;
import com.enovell.km_app_micro_service.service.dataStatisticsManage.DataStatisticsManageService;
import com.enovell.yunwei.enocommon.utils.JsonUtil;

@RestController
@RequestMapping("/dataStatisticsManageAction")
public class dataStatisticsManageAction {
	@Resource(name = "dataStatisticsManageService")
	private DataStatisticsManageService service;
	@CrossOrigin
	@PostMapping("/findAll")
    public GridDto<Document> findAll(@RequestParam String basicInformation,
    								 @RequestParam String uploadFileManage,
                                     String yearStart,
                                     String yearEnd,
                                     String monthStart,
                                     String monthEnd,
                                     String searchCycle,
                                     String name,
                                     String orgName,
                                     @RequestParam int start, @RequestParam int limit) {
		if(searchCycle==null){
			return null;
		}
		System.out.println("basicInformation = [" + basicInformation + "], uploadFileManage = [" + uploadFileManage + "], yearStart = [" + yearStart + "], yearEnd = [" + yearEnd + "], monthStart = [" + monthStart + "], monthEnd = [" + monthEnd + "], searchCycle = [" + searchCycle + "], name = [" + name + "], orgName = [" + orgName + "]");
		String monthStartNumber = monthStart.substring(0,monthStart.indexOf("月"));
		String startUploadDate = "";
		if(monthStartNumber.length()==1){
			startUploadDate = yearStart+"0"+monthStartNumber;
        }else{
        	startUploadDate = yearStart+monthStartNumber;
        }
		String monthEndNumber = monthEnd.substring(0,monthEnd.indexOf("月"));
		String endUploadDate = "";
		if(monthEndNumber.length()==1){
			endUploadDate = yearEnd+"0"+monthEndNumber;
		}else{
			endUploadDate = yearEnd+monthEndNumber;
		}
		GridDto<Document> result = new GridDto<>();
        result.setResults(service.findAllDocumentCount(basicInformation,uploadFileManage,searchCycle,monthStartNumber,monthEndNumber, orgName, name, startUploadDate, endUploadDate));
        result.setRows(service.findAllDocument(basicInformation,uploadFileManage,searchCycle,monthStartNumber,monthEndNumber, orgName, name, startUploadDate, endUploadDate, start, limit));
        return result;
    }
	
	@CrossOrigin
	@PostMapping("/findUploadFileById")
    public GridDto<Document> findUploadFileById(
    		@RequestParam String collectionName,
            String yearStart,
            String yearEnd,
            String monthStart,
            String monthEnd,
            String docId,
            @RequestParam int start, @RequestParam int limit) {
		String monthStartNumber = monthStart.substring(0,monthStart.indexOf("月"));
		String startUploadDate = "";
		if(monthStartNumber.length()==1){
			startUploadDate = yearStart+"0"+monthStartNumber;
        }else{
        	startUploadDate = yearStart+monthStartNumber;
        }
		String monthEndNumber = monthEnd.substring(0,monthEnd.indexOf("月"));
		String endUploadDate = "";
		if(monthEndNumber.length()==1){
			endUploadDate = yearEnd+"0"+monthEndNumber;
		}else{
			endUploadDate = yearEnd+monthEndNumber;
		}
		GridDto<Document> result = new GridDto<>();
        result.setResults(service.findUploadFileByIdCount(collectionName,docId,startUploadDate, endUploadDate));
        result.setRows(service.findUploadFileById(collectionName,docId,startUploadDate, endUploadDate, start, limit));
        return result;
    }
	
	
	 /**
     * 
     * exportXls 导出数据
     * @param exportXlsJson
     * @param request
     * @param response
     */
    @PostMapping(value = "/exportXlsBy")
    public void exportXls(@RequestParam(name = "exportXlsJson", required = false) String exportXlsJson,
        HttpServletRequest request,
        HttpServletResponse response) {
        List < DataStatisticsDto > dataList = new ArrayList < DataStatisticsDto > ();
        DataStatisticsDto[] dtos = JsonUtil.jsonToJavaObj(exportXlsJson, DataStatisticsDto[].class);
        Collections.addAll(dataList, dtos);
        String[] headerTableColumns = new String[] {
            "巡检地点" + "_" + "30" + "_" + "my.getName()",
            "所属机构" + "_" + "30" + "_" + "my.getOrgName()",
            "巡检周期" + "_" + "30" + "_" + "my.getSearchCycle()",
            "巡检次数" + "_" + "30" + "_" + "my.getSearchNumber()",
            "完成率（%）" + "_" + "30" + "_" + "my.getFinishRate()"
        };
        PoiExport < DataStatisticsDto > export = new PoiExport < DataStatisticsDto > ();
        export.exportXls("巡检数据统计管理", headerTableColumns, new HashMap(), dataList, request, response);
    }
}
