package com.enovell.km_app_micro_service.service.dataStatisticsManage;

import java.util.List;

import org.bson.Document;

public interface DataStatisticsManageService {

	Long findAllDocumentCount(String basicInformation, String uploadFileManage, String searchCycle,String monthStart,String monthEnd, String orgName, String name, 
			String startUploadDate,String endUploadDate);

	List<Document> findAllDocument(String basicInformation, String uploadFileManage, String searchCycle,String monthStart,String monthEnd, String orgName, String name, 
			String startUploadDate,String endUploadDate, int start, int limit);

	void removeDocument(List<String> ids, String collectionName);

	Document findDocumentById(String id, String collectionName);
	
	/**
	 * 检查上传的数据是否已存在，根据结果执行不同的操作（存在：数据覆盖更新，不存在：新增）
	 */
	Document checkDocument(String dateStr,String addrId,String collectionName);
	
	Long findUploadFileByIdCount(String collectionName,String docId,String startUploadDate,String endUploadDate);
	
	List<Document> findUploadFileById(String collectionName,String docId,String startUploadDate,String endUploadDate,int start,int limit);

}
