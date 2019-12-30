package com.enovell.km_app_micro_service.action;

import com.enovell.km_app_micro_service.dto.CheckPoint;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * km_app_server
 * 昆铁APP打卡Action
 * @author bili
 * @date 2019/7/23
 */
@RestController
public class CheckInAction {
	
	
	@Autowired
	private MongoTemplate mt;
	
    @RequestMapping("/getAddrs")
    @CrossOrigin
    public List<CheckPoint> getCheckPoing(){
        System.out.println("返回巡检地点数据");
        Criteria criteria = Criteria.where("status").is(1);
        List<Document> resultDocuments = mt.find(new Query(criteria), Document.class,"basicInformation");
		resultDocuments.stream().forEach(d -> {
            d.append("docId", d.getObjectId("_id").toHexString());
            d.remove("_id");
        });
        
        List<CheckPoint> addrs = new ArrayList<>();
        
        for (Document document : resultDocuments) {
        	CheckPoint cp = new CheckPoint();
        	cp.setId(document.getString("docId"));
//        	if(Double.valueOf(document.getString("latitude")).isNaN()){
//        		
//        	}
        	cp.setLatitude(Double.valueOf(document.getString("latitude")));
//        	if(Double.valueOf(document.getString("longitude")).isNaN()){
//    		
//        	}
        	cp.setLongitude(Double.valueOf(document.getString("longitude")));
        	if("1".equals(document.getString("special"))){
        		cp.setSpecial(true);
        	}else{
        		cp.setSpecial(false);
        	}
        	cp.setCode(document.getString("code"));
        	cp.setName(document.getString("name"));
        	addrs.add(cp);
		}
        
//        CheckPoint cp1 = new CheckPoint();
//        cp1.setId("1");
//        cp1.setLatitude(30.6895003574);
//        cp1.setLongitude(104.0516799688);
//        cp1.setSpecial(true);
//        cp1.setCode("test");
//        cp1.setName("检修地址1");
//        CheckPoint cp2 = new CheckPoint();
//        cp2.setId("2");
//        cp2.setLatitude(30.6940303239);
//        cp2.setLongitude(104.0498507023);
//        cp2.setSpecial(false);
//        cp2.setCode("");
//        cp2.setName("检修地址2");
//        addrs.add(cp1);
//        addrs.add(cp2);
        return addrs;
    }
}
