package com.enovell.km_app_micro_service.service.dataStatisticsManage;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service(value = "dataStatisticsManageService")
public class DataStatisticsManageServiceImpl implements DataStatisticsManageService{
	
	 @Autowired
	 private MongoTemplate mt;

	@Override
	public Long findAllDocumentCount(String basicInformation, String uploadFileManage, String searchCycle,String monthStart,String monthEnd, String orgName, String name, 
			String startUploadDate,String endUploadDate) {
		
		Criteria criteria = getCriteriaQuery2(searchCycle,orgName,name);
		Long cout = mt.count(new Query(criteria),basicInformation);
		return cout;
	}
	private Criteria getCriteriaQuery(String docId, String startUploadDate, String endUploadDate) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(docId)) {
			criteria.and("addrId").is(docId);
		}
		if(StringUtils.isNotBlank(startUploadDate)&&StringUtils.isNotBlank(endUploadDate)){
			criteria.andOperator(Criteria.where("ym").gte(Integer.valueOf(startUploadDate)),Criteria.where("ym").lte(Integer.valueOf(endUploadDate)));
//			criteria.and("ym").is(Integer.valueOf(startUploadDate));
		}
//		else{
//			if (StringUtils.isNotBlank(startUploadDate)) {
//				criteria.and("ym").gte(Integer.valueOf(startUploadDate));
//			}
//			if (StringUtils.isNotBlank(endUploadDate)) {
//				criteria.and("ym").lte(Integer.valueOf(endUploadDate));
//			}
//		}
		return criteria;
	}
	private Criteria getCriteriaQuery2(String searchCycle, String orgName, String name) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(searchCycle)) {
			criteria.and("searchCycle").is(searchCycle);
		}
		if (StringUtils.isNotBlank(orgName)) {
			criteria.and("orgName").regex(orgName);
		}
		if (StringUtils.isNotBlank(name)) {
			criteria.and("name").regex(name);
		}
		return criteria;
	}
	@Override
	public List<Document> findAllDocument(String basicInformation, String uploadFileManage, String searchCycle,String monthStart,String monthEnd, String orgName, String name, 
			String startUploadDate,String endUploadDate, int start, int limit) {
		
//		String[] startUploadDateArray = startUploadDate.split("-");
//		String[] endUploadDateArray = endUploadDate.split("-");
		
//		int startUploadDateInt = Integer.valueOf(startUploadDateArray[1]);
//		int endUploadDateInt = Integer.valueOf(endUploadDateArray[1]);
		
		int startUploadDateInt = Integer.valueOf(monthStart);
		int endUploadDateInt = Integer.valueOf(monthEnd);
		
		Criteria criteria2 = getCriteriaQuery2(searchCycle,orgName,name);
		List<Document> resultDocuments = mt.find(new Query(criteria2).skip(start).limit(limit), Document.class, basicInformation);
//		List<Document> resultDocumentsOfUploadFile = mt.find(new Query(criteria), Document.class, uploadFileManage);
		List<Document> resultDocumentsOfjoin = new ArrayList<Document>();
		resultDocuments.stream().forEach(d -> {
            String docId =  d.getObjectId("_id").toHexString();
//            System.out.println(docId);
            Criteria criteria = getCriteriaQuery(docId,startUploadDate,endUploadDate);
            List<Document> resultDocumentsOfUploadFile = mt.find(new Query(criteria), Document.class, uploadFileManage);
            d.append("searchNumber", String.valueOf(resultDocumentsOfUploadFile.size()));
            if("1月/次".equals(searchCycle)){
            	int uploadFileNumber = resultDocumentsOfUploadFile.size();
            	int monthNumber = endUploadDateInt-startUploadDateInt+1;
//            	System.out.println(uploadFileNumber);
//            	System.out.println(monthNumber);
            	if(uploadFileNumber>=monthNumber){
            		d.append("finishRate", "100.00%");
            	}else{
            		DecimalFormat df = new DecimalFormat("0.00");//格式化小数  
            		String num = df.format(((float)uploadFileNumber/monthNumber)*100);//返回的是String类型  
            		d.append("finishRate", num+"%");
            	}
            }
            if("3月/次".equals(searchCycle)){
            	int uploadFileNumber = resultDocumentsOfUploadFile.size();
            	int monthNumber = 0;
            	if(endUploadDateInt-startUploadDateInt==2){
            		monthNumber = 1;
            	}
            	if(endUploadDateInt-startUploadDateInt==5){
            		monthNumber = 2;
            	}
            	if(endUploadDateInt-startUploadDateInt==8){
            		monthNumber = 3;
            	}
            	if(endUploadDateInt-startUploadDateInt==11){
            		monthNumber = 4;
            	}
            	if(uploadFileNumber>=monthNumber){
            		d.append("finishRate", "100.00%");
            	}else{
            		DecimalFormat df = new DecimalFormat("0.00");//格式化小数  
            		String num = df.format(((float)uploadFileNumber/monthNumber)*100);//返回的是String类型  
            		d.append("finishRate", num+"%");
            	}
            }
            if("6月/次".equals(searchCycle)){
            	int uploadFileNumber = resultDocumentsOfUploadFile.size();
            	int monthNumber = 0;
            	if(endUploadDateInt-startUploadDateInt==5){
            		monthNumber = 1;
            	}
            	if(endUploadDateInt-startUploadDateInt==11){
            		monthNumber = 2;
            	}
            	if(uploadFileNumber>=monthNumber){
            		d.append("finishRate", "100.00%");
            	}else{
            		DecimalFormat df = new DecimalFormat("0.00");//格式化小数  
            		String num = df.format(((float)uploadFileNumber/monthNumber)*100);//返回的是String类型  
            		d.append("finishRate", num+"%");
            	}
            }
            if("1年/次".equals(searchCycle)){
            	int uploadFileNumber = resultDocumentsOfUploadFile.size();
            	int monthNumber = 1;
            	if(uploadFileNumber>=monthNumber){
            		d.append("finishRate", "100.00%");
            	}else{
            		d.append("finishRate", "0.00%");
            	}
            }
            d.append("docId", d.getObjectId("_id").toHexString());
            d.remove("_id");
            resultDocumentsOfjoin.add(d);
            
//            for (Document doc : resultDocumentsOfUploadFile) {
//            	String addrId  = doc.get("addrId").toString();
//            	if (docId.equals(addrId)) {
//            		d.append("docId", d.getObjectId("_id").toHexString());
//                    d.remove("_id");
//            		d.append("searchCycle", doc.get("searchCycle"));
//            		d.append("orgName", doc.get("orgName"));
//            		d.append("name", doc.get("name"));
//            		resultDocumentsOfjoin.add(d);
//            		break;
//				}
//			}
        });
		return resultDocumentsOfjoin;
	}
	@Override
	public void removeDocument(List<String> ids, String collectionName) {
		Query query = Query.query(Criteria.where("_id").in(ids));
		mt.remove(query,collectionName);
	}
	@Override
	public Document findDocumentById(String id, String collectionName) {
		Document doc = mt.findOne(new Query(Criteria.where("_id").is(id).and("status").is(1)), Document.class, collectionName);
        String baseIdString = doc.getString("addrId");
        Document doc2 = mt.findOne(new Query(Criteria.where("_id").is(baseIdString).and("status").is(1)), Document.class, "basicInformation");
        doc.append("docId", doc.getObjectId("_id").toHexString());
        doc.remove("_id");
        doc.append("searchCycle", doc2.get("searchCycle"));
        doc.append("orgName", doc2.get("orgName"));
        doc.append("name", doc2.get("name"));
		return doc;
	}
	@Override
	public Document checkDocument(String dateStr, String addrId, String collectionName) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(dateStr)) {
			criteria.and("dateStr").is(dateStr);
		}
		if (StringUtils.isNotBlank(addrId)) {
			criteria.and("addrId").is(addrId);
		}
		Document resultDocuments = mt.findOne(new Query(criteria), Document.class, collectionName);
		return resultDocuments;
	}
	@Override
	public Long findUploadFileByIdCount(String collectionName, String docId, String startUploadDate,
			String endUploadDate) {
		Criteria criteria = getCriteriaQuery(docId,startUploadDate,endUploadDate);
		Long cout = mt.count(new Query(criteria),collectionName);
		return cout;
	}
	@Override
	public List<Document> findUploadFileById(String collectionName, String docId, String startUploadDate,
			String endUploadDate, int start, int limit) {
		Criteria criteria = getCriteriaQuery(docId,startUploadDate,endUploadDate);
		List<Document> resultDocumentsOfUploadFile = mt.find(new Query(criteria), Document.class, collectionName);
		return resultDocumentsOfUploadFile;
	}
}
