package com.enovell.km_app_micro_service.service;

import java.util.List;

import org.bson.Document;

public interface BaseInformationService {

	Document addDocument(Document document, String collectionName);

	Long findAllDocumentCount(String collectionName, String orgName, String name, String special);

	List<Document> findAllDocument(String collectionName, String orgName, String name, String special, int start,
			int limit);

	Document findDocumentById(String id, String collectionName);

	void removeDocument(List<String> ids, String collectionName);

	Document modifyDocument(Document document, String collectionName, String id);

}
