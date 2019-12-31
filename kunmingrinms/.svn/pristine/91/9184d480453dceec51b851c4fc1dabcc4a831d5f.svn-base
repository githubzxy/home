package com.enovell.yunwei.attach;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 下载文件servlet
 * @author zsh
 *
 */
public class DownloadFileServlet extends HttpServlet {
       
	private static final long serialVersionUID = 2322763529971894932L;

	public DownloadFileServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName =  request.getParameter("fileName");
		String filePath = request.getParameter("filePath");
		
//		System.out.println("1================" + fileName);
//		System.out.println("2================" + filePath);
		
		File file = null;
		InputStream inputStream = null;
		ByteArrayOutputStream bos = null;
		byte[] data = null;
		try {
			file = new File(filePath);
			if (file != null && !file.exists()) {
				
				response.setContentType("text/html; charset=utf-8"); 
				response.setCharacterEncoding("utf-8");
				response.getWriter().println("源文件不存在，无法下载");
				return ;
			}
			
			inputStream = new FileInputStream(file);
			bos = new ByteArrayOutputStream(1024);
			data = new byte[1024];
			int n;
			while ((n = inputStream.read(data)) != -1) {  
	              bos.write(data, 0, n);  
			} 
			response.reset();
			response.setContentType("application/x-download");
			response.setContentLength((int)file.length());
			fileName = new String(fileName.getBytes(), "ISO-8859-1");
			response.setHeader("Content-Disposition","attachment;filename="+fileName);
			
			ServletOutputStream servletOutputStream = response.getOutputStream();
			servletOutputStream.write(bos.toByteArray());
			servletOutputStream.flush();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(bos != null) {
					bos.close();
				}
				if(inputStream != null) {
					inputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
