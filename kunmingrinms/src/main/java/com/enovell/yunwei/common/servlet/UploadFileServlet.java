package com.enovell.yunwei.common.servlet;

import com.enovell.yunwei.attach.web.AttachFileAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 初始化文件上传路径
 * @author pzr
 * 2014-12-12上午10:25:40
 */
public class UploadFileServlet extends HttpServlet {

	public void init() throws ServletException {  
		
    	String filePath = getServletContext().getInitParameter("filePath");
    	
    	AttachFileAction.filePath = filePath;
	}  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
