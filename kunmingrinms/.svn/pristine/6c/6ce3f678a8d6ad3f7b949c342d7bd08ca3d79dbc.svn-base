package com.enovell.yunwei.home.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.common.dto.GridDto;
import com.enovell.yunwei.fileSystemNew.domain.FileSystemNew;
import com.enovell.yunwei.fileSystemNew.dto.FileSystemDTO;
import com.enovell.yunwei.fileSystemNew.service.FileSystemNewService;
import com.enovell.yunwei.message.domain.IssueMessage;
import com.enovell.yunwei.message.dto.IssueMessageDTO;
import com.enovell.yunwei.message.service.MessageService;
import com.enovell.yunwei.safeSystem.domain.SafeSystem;
import com.enovell.yunwei.safeSystem.dto.SafeSystemDTO;
import com.enovell.yunwei.safeSystem.service.SafeSystemService;
import com.enovell.yunwei.taskManage.service.TaskRootService;
import com.enovell.yunwei.util.JsonUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

/**
 * 首页展示ACTION
 * 
 * @author roy 2015年7月16日-上午10:45:26
 * 修改人：zhouxingyu 
 * 修改时间：2019年7月3日 下午2:27:35   
 */

@Controller
@RequestMapping("/homeAction")
public class HomeAction {

	@Resource(name = "MessageService")
	private MessageService messageService;
	@Resource(name = "taskRootService")
	private TaskRootService taskRootService;
	@Resource(name = "safeSystemService")
	private SafeSystemService safeSystemService;
	// 技术规章
	@Resource(name = "fileSystemNewService")
	private FileSystemNewService fileSystemNewService;
	@Autowired
	private NamedParameterJdbcTemplate jt;
	@Autowired
	private MongoTemplate mt;

	/**
	 * 首页显示 --- 最新通知 index.jsp中一块 getMessageList
	 * 
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value = "/getHomeMessage", method = RequestMethod.POST)
	public @ResponseBody String getMessageList() {
		IssueMessage m = new IssueMessage();
		m.setIssue(IssueMessage.ISISSUE);
		m.setType(10022);
		m.setOrgType(1501);// 段科室发布的通知，段领导是1500，但考虑到领导不会亲自发通知，就不做此项判断
		List<IssueMessage> ms = messageService.getMessage(m, 0, 10);
		return JsonUtil.javaToJsonAsString(ms, JsonUtil.DATE);
	}

	/**
	 * 获取首页临时任务显示 getHomeTask
	 * 
	 * @author zxy
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getHomeTask", method = RequestMethod.POST)
	public @ResponseBody String getHomeTaskList() throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DBCollection collection = mt.getCollection("task");
		DBObject obj = new BasicDBObject(); 
		obj.put("status",1);
		obj.put("flowState",new BasicDBObject("$gt","0"));
		DBObject sortDbObject = new BasicDBObject(); 
		sortDbObject.put("createDate", -1);
		DBCursor cursor = collection.find(obj).skip(0).limit(10).sort(sortDbObject);
		List<DBObject> result = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			if (d.get("status").toString().equals("1") && !d.get("flowState").toString().equals("0")) {
				Date dateFString = simpleDateFormat.parse(d.get("createDate").toString());
				d.put("createDate", dateFString);
				result.add(d);
			}
		}
		cursor.close();
		result.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);

	}

	/**
	 * 
	 * getHomeTaskList 获取首页临时任务
	 * 
	 * @param start
	 * @param limit
	 * @param title
	 * @author zhouxingyu
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getHomeTaskList", method = RequestMethod.POST)
	public @ResponseBody String getHomeTaskList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DBCollection collection = mt.getCollection("task");
		DBObject query = new BasicDBObject();
		query.put("status", 1);
		if (StringUtils.isNotBlank(title)) {
			Pattern queryPattern = Pattern.compile(title, Pattern.CASE_INSENSITIVE);
			query.put("workOrderName", queryPattern);
		}
		DBObject sortDbObject = new BasicDBObject(); 
		sortDbObject.put("createDate", -1);
		DBCursor cursor = collection.find(query).skip(start).limit(limit).sort(sortDbObject);
		List<DBObject> resultRows = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			if (d.get("status").toString().equals("1") && !d.get("flowState").toString().equals("0")) {
				Date dateFString = simpleDateFormat.parse(d.get("createDate").toString());
				d.put("createDate", dateFString);
				resultRows.add(d);
			}
		}
		cursor.close();
		resultRows.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		long count = collection.count(query);
		GridDto<DBObject> result = new GridDto<DBObject>();
		result.setRows(resultRows);
		result.setResults(count);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 首页最新通知列表 indexMessage.jsp getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getHomeMessageList", method = RequestMethod.POST)
	public @ResponseBody String getHomeMessageList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) {
		IssueMessageDTO m = new IssueMessageDTO();
		m.setTheme(title);
		m.setIssue(IssueMessage.ISISSUE);
		m.setType(10022);
		m.setOrgType(1501);// 段科室发布的通知，段领导是1500，但考虑到领导不会亲自发通知，就不做此项判断
		GridDto<IssueMessageDTO> result = messageService.getIssueMessages(m, start, limit);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 根据日期查询首页值班列表内容 getOnduty
	 * 
	 * @param dutyDate yyyy-MM-dd
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getOnduty", method = RequestMethod.POST)
	public @ResponseBody String getOnduty() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String dutyDate = sdf.format(new Date());
		List<Map> m = mt.find(new Query(Criteria.where("date").is(dutyDate)), Map.class, "dayDutyManage");
		Map<String, String> result = new HashMap<String, String>();
		result.put("today", dutyDate);
		if (m.size() != 0) {
			if (StringUtils.isNotBlank(m.get(0).get("leader").toString())) {
				result.put("leader", m.get(0).get("leader").toString());
			}
			if (StringUtils.isNotBlank(m.get(0).get("cadre").toString())) {
				result.put("depart", m.get(0).get("cadre").toString());
			}
			if (StringUtils.isNotBlank(m.get(0).get("dispatch").toString())) {
				result.put("dispatch", m.get(0).get("dispatch").toString());
			}
			return JsonUtil.javaToJsonAsString(result);
		} else {
			return JsonUtil.javaToJsonAsString(result);
		}
	}

	/**
	 * 根据日期查询首页值班详情内容
	 * 
	 * @param dutyDate yyyy-MM-dd
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/showOnduty", method = RequestMethod.POST)
	public @ResponseBody String showOnduty(@RequestParam(value = "dutyDate", required = false) String dutyDate,
			HttpServletRequest request) {
		if (StringUtils.isBlank(dutyDate)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
			dutyDate = sdf.format(new Date());
		} else {
			String[] date = dutyDate.split("-");
			dutyDate = date[0] + "年" + date[1] + "月" + date[2] + "日";
		}
		List<Map> m = mt.find(new Query(Criteria.where("date").is(dutyDate)), Map.class, "dayDutyManage");
		List<Map<String, String>> duties = new ArrayList<Map<String, String>>();
		Map<String, String> leaderMap = new HashMap<String, String>();
		Map<String, String> departMap = new HashMap<String, String>();
		Map<String, String> dispatchMap = new HashMap<String, String>();
		if (m.size() == 0) {
			leaderMap.put("theme", "值班领导：暂无填写");
			departMap.put("theme", "值班干部：暂无填写");
			dispatchMap.put("theme", "值班调度：暂无填写");
			duties.add(leaderMap);
			duties.add(departMap);
			duties.add(dispatchMap);
			return JsonUtil.javaToJsonAsString(duties);
		} else {
			if (StringUtils.isNotBlank(m.get(0).get("leader").toString()))
				leaderMap.put("theme", "值班领导：" + m.get(0).get("leader"));
			else
				leaderMap.put("theme", "值班领导：暂无数据");
			duties.add(leaderMap);

			if (StringUtils.isNotBlank(m.get(0).get("cadre").toString()))
				departMap.put("theme", "值班干部：" + m.get(0).get("cadre"));
			else
				departMap.put("theme", "值班干部：暂无数据");
			duties.add(departMap);

			if (StringUtils.isNotBlank(m.get(0).get("dispatch").toString()))
				dispatchMap.put("theme", "值班调度：" + m.get(0).get("dispatch"));
			else
				dispatchMap.put("theme", "值班调度：暂无数据");
			duties.add(dispatchMap);
			return JsonUtil.javaToJsonAsString(duties);
		}
	}

	/**
	 * 跳转最新通知及公告数据详情展示页面 showMessage
	 * 
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value = "/showMessage", method = RequestMethod.GET)
	public String showMessage(String id, HttpServletRequest request) {
		IssueMessageDTO issueMessage = messageService.getMessageDtoById(id);
		request.setAttribute("messageData", issueMessage);
		return "views/index/indexDetail";
	}

	/**
	 * 
	 * showTask 展示临时任务数据
	 * 
	 * @param id
	 * @param request
	 * @return
	 * @author zhouxingyu
	 */
	@RequestMapping(value = "/showMessageOfTask", method = RequestMethod.GET)
	public String showTask(String id, HttpServletRequest request) {
		Map m = mt.findById(new ObjectId(id), Map.class, "task");
		if (m == null)
			System.out.println("没有找到任务id" + new ObjectId(id));
		request.setAttribute("messageData", m);
		return "views/index/indexTaskDetail";
	}

	public String showMessageSyn(String id, String title, HttpServletRequest request) {
		return title;

	}

	/**
	 * 首页显示 ---新闻 getMessageList
	 * 
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value = "/getHomeNews", method = RequestMethod.POST)
	public @ResponseBody String getNewsList() {
		IssueMessage m = new IssueMessage();
		m.setIssue(IssueMessage.ISISSUE);
		m.setType(10023);
		List<IssueMessage> ms = messageService.getMessage(m, 0, 10);
		return JsonUtil.javaToJsonAsString(ms, JsonUtil.DATE);
	}

	/**
	 * 首页显示 ---公示公告index.jsp中的一块 getMessageList
	 * 
	 * @return
	 * @author luoyan
	 */
	@RequestMapping(value = "/getHomeNotice", method = RequestMethod.POST)
	public @ResponseBody String getNoticeList() {
		IssueMessage m = new IssueMessage();
		m.setIssue(IssueMessage.ISISSUE);
		m.setType(10024);
		m.setOrgType(1501);// 段科室发布的通知，段领导是1500，但考虑到领导不会亲自发通知，就不做此项判断
		List<IssueMessage> ms = messageService.getMessage(m, 0, 10);
		return JsonUtil.javaToJsonAsString(ms, JsonUtil.DATE);
	}

	@RequestMapping(value = "/getIndexCircuitWorkOrder", method = RequestMethod.POST)
	public @ResponseBody String getIndexCircuitWorkOrder() throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DBCollection collection = mt.getCollection("circuitWorkOrder");
		
		DBObject obj = new BasicDBObject(); 
		obj.put("status",1);
		DBObject sortObj = new BasicDBObject(); 
		sortObj.put("createDate", -1);
		DBCursor cursor = collection.find(obj).skip(0).limit(10).sort(sortObj);
		List<DBObject> result = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			if (d.get("status").toString().equals("1")) {
				Date dateFString = simpleDateFormat.parse(d.get("createDate").toString());
				d.put("createDate", dateFString);
				result.add(d);
			}
		}
		cursor.close();
		result.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 首页显示 ---电路工单列表indexNotice.jsp getIndexCircuitWorkOrderList
	 * 
	 * @return
	 * @author zhouxingyu
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getIndexCircuitWorkOrderList", method = RequestMethod.POST)
	public @ResponseBody String getHomeNoticeList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DBCollection collection = mt.getCollection("circuitWorkOrder");
		DBObject query = new BasicDBObject();
		query.put("status", 1);
		if (StringUtils.isNotBlank(title)) {
			Pattern queryPattern = Pattern.compile(title, Pattern.CASE_INSENSITIVE);
			query.put("workOrderName", queryPattern);
		}
		DBObject sortDbObject = new BasicDBObject();
		sortDbObject.put("createDate", -1);
		DBCursor cursor = collection.find(query).skip(start).limit(limit).sort(sortDbObject);
		List<DBObject> resultRows = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			if (d.get("status").toString().equals("1")) {
				Date dateFString = simpleDateFormat.parse(d.get("createDate").toString());
				d.put("createDate", dateFString);
				resultRows.add(d);
			}
		}
		cursor.close();
		resultRows.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		long count = collection.count(query);
		GridDto<DBObject> result = new GridDto<DBObject>();
		result.setRows(resultRows);
		result.setResults(count);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 
	 * showWorkrule 获取首页电路工单展示详情
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/showIndexCircuitWorkOrder", method = RequestMethod.GET)
	public String showIndexCircuitWorkOrder(String id, HttpServletRequest request) {
		Map m = mt.findById(new ObjectId(id), Map.class, "circuitWorkOrder");
		if (m == null)
			System.out.println("没有找到id" + new ObjectId(id));
		request.setAttribute("messageData", m);
		return "views/index/indexCircuitWorkOrderDetail";
	}

	/**
	 * 首页显示 ---置顶index.jsp中的一块 getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getTop", method = RequestMethod.POST)
	public @ResponseBody String getTop() {
		IssueMessage m = new IssueMessage();
		m.setTopStatus(IssueMessage.ISTOP);
		m.setIssue(IssueMessage.ISISSUE);
		m.setOrgType(1501);// 段科室发布的通知，段领导是1500，但考虑到领导不会亲自发通知，就不做此项判断
		List<IssueMessage> ms = messageService.getMessage(m, 0, 5);// 置顶区域比较小，所以只取5条
		return JsonUtil.javaToJsonAsString(ms);
	}

	/**
	 * 首页显示 --- 安全规章 index.jsp中一块 getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getHomeSaferule", method = RequestMethod.POST)
	public @ResponseBody String getHomeSaferule() {
		SafeSystemDTO m = new SafeSystemDTO();
		List<SafeSystemDTO> ms = safeSystemService.getAllSafeSystems(m, 0, 10);
		return JsonUtil.javaToJsonAsString(ms, JsonUtil.DATE);
	}

	/**
	 * 首页最新安全规章列表 indexSaferule.jsp getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getHomeSaferuleList", method = RequestMethod.POST)
	public @ResponseBody String getHomeSaferuleList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) {
		SafeSystemDTO m = new SafeSystemDTO();
		m.setFileName(title);
		List<SafeSystemDTO> ms = safeSystemService.getAllSafeSystems(m, start, limit);
		long count = safeSystemService.getAllSafeSystemCount(m);
		GridDto<SafeSystemDTO> result = new GridDto<SafeSystemDTO>();
		result.setRows(ms);
		result.setResults(count);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 跳转最新安全规章详情首页展示页面 showMessage
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/showSaferule", method = RequestMethod.GET)
	public String showSaferule(String id, HttpServletRequest request) {
		SafeSystem m = safeSystemService.getSafeSystemById(id);
		request.setAttribute("messageData", m);
		return "views/index/indexSaferuleDetail";
	}

	/**
	 * 首页显示 --- 技术规章 index.jsp中一块 getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getHomeTecrule", method = RequestMethod.POST)
	public @ResponseBody String getHomeTecrule() {
		FileSystemDTO dto = new FileSystemDTO();
		List<FileSystemDTO> ms = fileSystemNewService.getAllFileSystems(dto, 0, 10);
		return JsonUtil.javaToJsonAsString(ms, JsonUtil.DATE);
	}

	/**
	 * 首页最新技术规章列表 indexSaferule.jsp getMessageList
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/getHomeTecruleList", method = RequestMethod.POST)
	public @ResponseBody String getHomeTecruleList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) {
		FileSystemDTO dto = new FileSystemDTO();
		dto.setFileName(title);
		List<FileSystemDTO> ms = fileSystemNewService.getAllFileSystems(dto, start, limit);
		long count = fileSystemNewService.getAllFileSystemCount(dto);
		GridDto<FileSystemDTO> result = new GridDto<FileSystemDTO>();
		result.setRows(ms);
		result.setResults(count);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 跳转最新技术规章详情首页展示页面 showMessage
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/showTecrule", method = RequestMethod.GET)
	public String showTecrule(String id, HttpServletRequest request) {
		FileSystemNew m = fileSystemNewService.getFileSystemById(id);
		request.setAttribute("messageData", m);
		return "views/index/indexTecruleDetail";
	}

	/**
	 * 首页显示 --- 施工协议 index.jsp中一块
	 * 
	 * @return
	 * @author roysong
	    * 修改人：zhouxingyu 
	    * 修改时间：2019年7月3日 下午2:27:35   
	 */
	@RequestMapping(value = "/getHomeWorkrule", method = RequestMethod.POST)
	public @ResponseBody String getHomeWorkrule() {
		DBCollection collection = mt.getCollection("constructProtocol");
		DBObject query = new BasicDBObject();
		query.put("status", 1);
		DBObject sortDbObject = new BasicDBObject();
		sortDbObject.put("createDate", -1);
		DBCursor cursor = collection.find(query).skip(0).limit(10).sort(sortDbObject);
		List<DBObject> result = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			if (d.get("status").toString().equals("1")) {
				result.add(d);
			}
		}
		cursor.close();
		result.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 首页最新施工协议列表 indexWorkrule.jsp
	 * 
	 * @return
	 * @author roysong
	   * 修改人：zhouxingyu 
	   * 修改时间：2019年7月3日 下午2:27:35   
	 */
	@RequestMapping(value = "/getHomeWorkruleList", method = RequestMethod.POST)
	public @ResponseBody String getHomeWorkruleList(@RequestParam int start, @RequestParam int limit,
			@RequestParam(required = false) String title) {
		DBCollection collection = mt.getCollection("constructProtocol");
		DBObject query = new BasicDBObject();
		query.put("status", 1);
		if (StringUtils.isNotBlank(title)) {
			Pattern queryPattern = Pattern.compile(title, Pattern.CASE_INSENSITIVE);
			query.put("proName", queryPattern);
			
		}
		DBObject sortDbObject = new BasicDBObject();
		sortDbObject.put("createDate", -1);
		DBCursor cursor = collection.find(query).skip(0).limit(10).sort(sortDbObject);
		List<DBObject> resultRows = new ArrayList<DBObject>();
		while (cursor.hasNext()) {
			DBObject d = cursor.next();
			resultRows.add(d);
		}
		cursor.close();
		resultRows.stream().forEach(m -> {
			ObjectId id = (ObjectId) m.get("_id");
			m.put("docId", id.toString());
		});
		long count = collection.count(query);
		GridDto<DBObject> result = new GridDto<DBObject>();
		result.setRows(resultRows);
		result.setResults(count);
		return JsonUtil.javaToJsonAsString(result, JsonUtil.DATE);
	}

	/**
	 * 跳转最新施工协议详情首页展示页面
	 * 
	 * @return
	 * @author roysong
	 */
	@RequestMapping(value = "/showWorkcrule", method = RequestMethod.GET)
	public String showWorkrule(String id, HttpServletRequest request) {
		Map m = mt.findById(new ObjectId(id), Map.class, "constructProtocol");
		if (m == null)
			System.out.println("没有找到id" + new ObjectId(id));
		request.setAttribute("messageData", m);
		return "views/index/indexWorkruleDetail";
	}

	@GetMapping("/download")
	public void downLoad(@RequestParam String path, @RequestParam String fileName, HttpServletRequest request,
			HttpServletResponse response) {
		File fileLoad = new File(path);
		try {
			fileName = urlEncoder(request, fileName);
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setContentType("binary/octet-stream");
			response.setHeader("Content-disposition", "attachment; fileName = " + fileName);
			FileInputStream in = new FileInputStream(fileLoad);
			OutputStream out = response.getOutputStream();
			byte[] buffer = new byte[2048];
			int n = -1;
			while ((n = in.read(buffer)) != -1) {
				out.write(buffer, 0, n);
			}
			out.close();
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * urlEncoder 防止附件中文乱码
	 *
	 * @param request
	 * @param fileName
	 * @return
	 */
	public static String urlEncoder(HttpServletRequest request, String fileName) {
		try {
			// 将字母全部转化为大写，判断是否存在RV字符串
			if (request.getHeader("User-Agent").toUpperCase().indexOf("RV") > 0) {
				// 处理IE 的头部信息
				fileName = URLEncoder.encode(fileName, "UTF-8");// 对字符串进行URL加码，中文字符变成%+16进制
			} else {
				// 处理其他的头部信息
				fileName = new String(fileName.substring(fileName.lastIndexOf("/") + 1).getBytes("UTF-8"), "ISO8859-1");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@RequestMapping(value = "/findNum", method = RequestMethod.POST)
    public @ResponseBody String findNum(String collectionName
    							) {
//		String id ="5d809046d792895ccc6c639e";
		collectionName = "dayNum";
		Map doc =  mt.findOne(new Query(), HashMap.class, collectionName);
		String  dayNum = (String) doc.get("dayNum");
		return dayNum;
    }
}
