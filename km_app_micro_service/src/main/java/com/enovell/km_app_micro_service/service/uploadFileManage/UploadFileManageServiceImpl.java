package com.enovell.km_app_micro_service.service.uploadFileManage;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service(value = "uploadFileManageService")
public class UploadFileManageServiceImpl implements UploadFileManageService{
	
	 @Autowired
	 private MongoTemplate mt;

	@Override
	public Long findAllDocumentCount(String collectionName, String orgName, String name, String startUploadDate,
			String endUploadDate) {
		Criteria criteria = getCriteriaQuery(startUploadDate,endUploadDate);
		Long cout = mt.count(new Query(criteria),collectionName);
		return cout;
	}
	private Criteria getCriteriaQuery(String startUploadDate, String endUploadDate) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(startUploadDate)) {
			criteria.and("createDate").gte(startUploadDate);
		}
		if (StringUtils.isNotBlank(endUploadDate)) {
			criteria.and("createDate").lte(endUploadDate);
		}
		return criteria;
	}
	private Criteria getCriteriaQuery2(String orgName, String name) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(orgName)) {
			criteria.and("orgName").is(orgName);
		}
		if (StringUtils.isNotBlank(name)) {
			criteria.and("name").is(name);
		}
		return criteria;
	}
	@Override
	public List<Document> findAllDocument(String collectionName, String orgName, String name, String startUploadDate,
			String endUploadDate, int start, int limit) {
		Criteria criteria = getCriteriaQuery(startUploadDate,endUploadDate);
		Criteria criteria2 = getCriteriaQuery2(orgName,name);
		List<Document> resultDocuments = mt.find(new Query(criteria).skip(start).limit(limit), Document.class,collectionName);
		List<Document> resultDocumentsOfBasicInfo = mt.find(new Query(criteria2), Document.class,"basicInformation");
		List<Document> resultDocumentsOfjoin = new ArrayList<Document>();
		resultDocuments.stream().forEach(d -> {
            String addrId =  d.get("addrId").toString();
            for (Document doc : resultDocumentsOfBasicInfo) {
            	String docIdString  = doc.getObjectId("_id").toHexString();
            	if (addrId.equals(docIdString)) {
            		d.append("docId", d.getObjectId("_id").toHexString());
                    d.remove("_id");
            		d.append("searchCycle", doc.get("searchCycle"));
            		d.append("orgName", doc.get("orgName"));
            		d.append("name", doc.get("name"));
            		resultDocumentsOfjoin.add(d);
            		break;
				}
			}
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
}
