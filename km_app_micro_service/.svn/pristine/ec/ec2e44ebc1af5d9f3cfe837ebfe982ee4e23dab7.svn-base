package com.enovell.km_app_micro_service.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

@Service("baseInformationService")
public class BaseInformationServiceImpl implements BaseInformationService{

    @Autowired
	private MongoTemplate mt;
	@Override
	public Document addDocument(Document doc, String collectionName) {
		doc.put("status", 1);
		mt.save(doc,collectionName);
		return doc;
	}
	@Override
	public Long findAllDocumentCount(String collectionName, String orgName, String name, String special) {
		Criteria criteria = getCriteriaQuery(orgName,name,special);
		Long cout = mt.count(new Query(criteria),collectionName);
		return cout;
	}
	private Criteria getCriteriaQuery(String orgName, String name,String special) {
		Criteria criteria = Criteria.where("status").is(1);
		if (StringUtils.isNotBlank(orgName)) {
			criteria.and("orgName").is(orgName);
		}
		if (StringUtils.isNotBlank(name)) {
			criteria.and("name").is(name);
		}
		if (StringUtils.isNotBlank(special)) {
			criteria.and("special").is(special);
		}
		return criteria;
	}

	@Override
	public List<Document> findAllDocument(String collectionName, String orgName, String name, String special, int start,
			int limit) {
		Criteria criteria = getCriteriaQuery(orgName,name,special);
		List<Document> resultDocuments = mt.find(new Query(criteria).skip(start).limit(limit), Document.class,collectionName);
		resultDocuments.stream().forEach(d -> {
            d.append("docId", d.getObjectId("_id").toHexString());
            d.remove("_id");
        });
		return resultDocuments;
	}
	@Override
	public Document findDocumentById(String id, String collectionName) {
		Document doc = mt.findOne(new Query(Criteria.where("_id").is(id).and("status").is(1)), Document.class, collectionName);
		doc.append("docId", doc.getObjectId("_id").toHexString());
        doc.remove("_id");
		return doc;
	}
	@Override
	public void removeDocument(List<String> ids, String collectionName) {
		Query query = Query.query(Criteria.where("_id").in(ids));
		mt.remove(query,collectionName);
		
	}
	@Override
	public Document modifyDocument(Document document, String collectionName, String id) {
		Query query = new Query(Criteria.where("_id").is(id).and("status").is(1));
		Update update = new Update();
        update.set("latitude", document.get("latitude"));
        update.set("longitude", document.get("longitude"));
        update.set("special", document.get("special"));
        update.set("code", document.get("code"));
        update.set("name", document.get("name"));
        update.set("orgName", document.get("orgName"));
        update.set("searchCycle", document.get("searchCycle"));
        update.set("status", document.get("status"));
		mt.updateFirst(query, update, collectionName);
		return document;
	}

}
