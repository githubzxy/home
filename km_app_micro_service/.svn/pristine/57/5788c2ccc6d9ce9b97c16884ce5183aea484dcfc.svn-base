package com.enovell.km_app_micro_service.action.basicInformation;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.bson.Document;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.enovell.km_app_micro_service.dto.GridDto;
import com.enovell.km_app_micro_service.dto.ResultMsg;
import com.enovell.km_app_micro_service.service.BaseInformationService;

@RestController
@RequestMapping("/basicInformationAction")
public class BasicInformationAction {
	
	@Resource(name = "baseInformationService")
	private BaseInformationService service;
	@RequestMapping("/addBasicInformationData")
	@CrossOrigin
	public ResultMsg addData(
			String collectionName,
			String latitude,
			String longitude,
			String special,
			String code,
			String name,
			String orgName,
			String searchCycle) {
		Document document = new Document();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDateStr = "";
		try {
			creatDateStr = sdf.format(new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.put("creatDateStr", creatDateStr);
		document.put("latitude", latitude);
		document.put("longitude", longitude);
		document.put("special", special);
		document.put("code", code);
		document.put("name", name);
		document.put("orgName", orgName);
		document.put("searchCycle", searchCycle);
		
   		Document res = service.addDocument(document, collectionName);
		return ResultMsg.getSuccess("新增成功", res);
	}
	
	@CrossOrigin
	@PostMapping("/findAll")
    public GridDto<Document> findAll(@RequestParam String collectionName,
                                     String name,
                                     String orgName,
                                     String special,
                                     @RequestParam int start, @RequestParam int limit) {
        GridDto<Document> result = new GridDto<>();
        result.setResults(service.findAllDocumentCount(collectionName, orgName, name,special));
        result.setRows(service.findAllDocument(collectionName, orgName, name, special,start, limit));
        return result;
    }
	@CrossOrigin
	@PostMapping("/findById")
    public ResultMsg findDocById(@RequestParam("id") String id,
        @RequestParam("collectionName") String collectionName) {
        Document res = service.findDocumentById(id, collectionName);
        return ResultMsg.getSuccess("查询完成", res);
    }
	@CrossOrigin
	@PostMapping("/removeDoc")
	public ResultMsg removeDoc(@RequestParam("id") String id, @RequestParam("collectionName") String collectionName) {
		List<String> ids = Arrays.asList(id.split(","));
		service.removeDocument(ids, collectionName);
		return ResultMsg.getSuccess("删除成功");
	}	
	 @CrossOrigin
	 @PostMapping("/modifyDoc")
	    public ResultMsg modifyDoc(
	        @RequestParam("id") String id,
	        @RequestParam(name = "latitude",required=false) String latitude,
			@RequestParam(name = "longitude",required=false) String longitude,
			@RequestParam(name = "special",required=false) String special,
			@RequestParam(name = "code",required=false) String code,
			@RequestParam(name = "name",required=false) String name,
			@RequestParam(name = "orgName",required=false) String orgName,
			@RequestParam(name = "searchCycle",required=false) String searchCycle,
			@RequestParam(name = "collectionName",required=false) String collectionName
			){
	        Document document = service.findDocumentById(id, collectionName);
			document.put("latitude", latitude);
			document.put("longitude", longitude);
			document.put("special", special);
			document.put("code", code);
			document.put("name", name);
			document.put("orgName", orgName);
			document.put("searchCycle", searchCycle);
	        document.put("status", 1);
	        Document res = service.modifyDocument(document, collectionName,id);
	        return ResultMsg.getSuccess("修改成功", res);
	    }
	    
}