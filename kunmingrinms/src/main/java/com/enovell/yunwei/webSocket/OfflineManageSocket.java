
/**   
 * 文件名：OfflineManageSocket.java    
 * 版本信息：IRMS1.0   
 * 日期：2019年5月30日 上午11:55:06   
 * Copyright Enovell Corporation 2019 
 *   
 */

package com.enovell.yunwei.webSocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/**      
 * 项目名称：RINMS2MAIN
 * 类名称：OfflineManageSocket   
 * 类描述: 根据用户session管理同一账号的用户自动被后登陆的用户挤下线 
 * 创建人：zhouxy
 * 创建时间：2019年5月30日 上午11:55:06 
 *    
 */
@ServerEndpoint("/websocket/offlineManageSocket/{userId}")
@Component
public class OfflineManageSocket {
	private Logger logger = LoggerFactory.getLogger(OfflineManageSocket.class);
	/**
	 * 存放session和对应的userId
	 */
	private static Map<Session,String> sessionUserIdMap = new ConcurrentHashMap<>();
	
	 /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的RealtimeSocket对象。
     */
	private static CopyOnWriteArraySet<OfflineManageSocket> copySocket = new CopyOnWriteArraySet<>();
	
	/**
     * webSocket的Session，与当前客户端的连接会话
     */
    private Session session;
    
    /**
     * 客户端连接
     * @param session session
     */
    @OnOpen
    public void onOpen(@PathParam("userId")String userId,Session session){
    	isExistSessionOfUserId(userId);
    	sessionUserIdMap.put(session,userId);
    	this.session = session;
        //把客户端加入到客户端set中
        copySocket.add(this);
    }
    /**
     * 
     * isExistSessionOfUserId 判断此用户的session是否已存在，如果是，则移除。
     * @author quyy
     * @param userId
     */
    private void isExistSessionOfUserId(String userId) {
    	try {
	        for(OfflineManageSocket socket : copySocket){
	            Session s = socket.session;
            	if(!sessionUserIdMap.get(s).equals(userId)) continue;
            	s.getBasicRemote().sendText("true");
            	logger.info("send msg succees : [userId="+userId);
//            	sessionUserIdMap.remove(s);
//                //从客户端set中移除关闭的客户端
//            	copySocket.remove(socket);
	        }
    	} catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 客户端关闭
     */
    @OnClose
    public void onClose(Session session){
    	sessionUserIdMap.remove(session);
        //从客户端set中移除关闭的客户端
    	copySocket.remove(this);
    }
    @OnMessage
    public void onMessage(String msg){
    	logger.info("msg = " + msg);
    }
    @OnError
    public void onError(Throwable e, Session session){
    	logger.info("e = [" + e + "], session = [" + session + "]");
    }
    /**
     * 根据当前用户id是否能找到session,如果能找到，则通过它来给客户端发送数据（返回登陆界面的指示）
     * @param msg 发送的信息
     */
    public void sendMassage(String userId){
    	try {
	        for(OfflineManageSocket socket : copySocket){
	            Session s = socket.session;
	            System.out.println(sessionUserIdMap.get(s)+"===="+userId);
            	if(!sessionUserIdMap.get(s).equals(userId)) continue;
            	s.getBasicRemote().sendText("true");
            	logger.info("send msg succees : [userId="+userId);
	        }
    	} catch (Exception e) {
            e.printStackTrace();
        }
    }

}
