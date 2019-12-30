package com.enovell.km_app_micro_service.action.uploadFileManage;

import java.util.Arrays;
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
import com.enovell.km_app_micro_service.service.uploadFileManage.UploadFileManageService;

@RestController
@RequestMapping("/uploadFileManageAction")
public class UploadFileManageAction {
	@Resource(name = "uploadFileManageService")
	private UploadFileManageService service;
	@CrossOrigin
	@PostMapping("/findAll")
    public GridDto<Document> findAll(@RequestParam String collectionName,
                                     String startUploadDate,
                                     String endUploadDate,
                                     String name,
                                     String orgName,
                                     @RequestParam int start, @RequestParam int limit) {
        GridDto<Document> result = new GridDto<>();
        result.setResults(service.findAllDocumentCount(collectionName, orgName, name,startUploadDate,endUploadDate));
        result.setRows(service.findAllDocument(collectionName, orgName, name, startUploadDate,endUploadDate,start, limit));
        return result;
    }
	
	@CrossOrigin
	@PostMapping("/removeDoc")
	public ResultMsg removeDoc(@RequestParam("id") String id, @RequestParam("collectionName") String collectionName) {
		List<String> ids = Arrays.asList(id.split(","));
		service.removeDocument(ids, collectionName);
		return ResultMsg.getSuccess("删除成功");
	}	
	@CrossOrigin
	@PostMapping("/findById")
    public ResultMsg findDocById(@RequestParam("id") String id,
        @RequestParam("collectionName") String collectionName) {
        Document res = service.findDocumentById(id, collectionName);
        return ResultMsg.getSuccess("查询完成", res);
    }
}
