package com.enovell.yunwei.common;

import com.enovell.yunwei.util.CommonTools;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

/**
 * 
 * 项目名称：kunmingrinmsFINAL 类名称：ExportTools 类描述: 导出word工具类 创建人：zhangsihong
 * 创建时间：2013-7-10 上午9:52:32 修改人：zhangsihong 修改时间：2013-7-10 上午9:52:32
 * 
 */
public class ExportTools {

	private static ExportTools tool = null;

	private ExportTools() {

	}

	public static ExportTools getInstance() {

		if (tool == null) {
			tool = new ExportTools();
		}
		return tool;
	}

	/**
	 * 
	 * createDoc 创建word文档
	 * 
	 * @param dataMap
	 *            填充数据
	 * @param sourcePath
	 *            源路径（从项目路径开始）
	 * @param destPath
	 *            目标路径（从项目路径开始）
	 * @return 返回创建成功的word文档路径。
	 */
	public String createDoc(Map<String, Object> dataMap, String sourcePath, String destPath) {

		String filePath = null;
		File sourceFile = new File(sourcePath);
		Writer out = null;
		try {

			Configuration configuration = new Configuration();
			configuration.setDefaultEncoding("utf-8");
			// 设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
			File templatePath = new File(getPath() + sourceFile.getParent() + "/");
			configuration.setDirectoryForTemplateLoading(templatePath);

			Template t = null;
			// *.ftl为要装载的模板
			t = configuration.getTemplate(sourceFile.getName());
			// 输出文档路径及名称
			File outFile = new File(getPath() + destPath);

			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
			t.process(dataMap, out);

			filePath = getPath() + destPath;

		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} finally {

			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return filePath;
	}

	/**
	 * 将给定的map集合导出为word
	 * @param dataMap 结果集
	 * @param fileName 文件名，带后缀，如：abc.doc
	 * @param templateName 模板名，带后缀，如：InnerRequest.ftl
	 * @param request
	 * @param response
	 */
	public static void webExport(Map<String, String> dataMap,String fileName, String templateName,HttpServletRequest request, HttpServletResponse response) {
		try {
			stringSet(dataMap);//换行设置
			// 创建配置实例
			Configuration configuration = new Configuration();
			// 设置编码
			configuration.setDefaultEncoding("UTF-8");
			// ftl模板文件位置
			configuration.setServletContextForTemplateLoading(request.getSession().getServletContext(), "Template/");
			// 获取模板
			Template template = configuration.getTemplate(templateName);
			// 根据浏览器不同，设置文件名的编码格式，防止中文乱码
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") > 0) {// firefox浏览器
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			} else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
				fileName = URLEncoder.encode(fileName, "UTF-8");// IE浏览器
			} else if (request.getHeader("User-Agent").toUpperCase().indexOf("CHROME") > 0) {
				fileName = URLEncoder.encode(fileName, "UTF-8");// 谷歌浏览器
			} else if (request.getHeader("User-Agent").toUpperCase().indexOf("MAXTHON") > 0) {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			} else {
				fileName = URLEncoder.encode(fileName, "UTF-8");// IE浏览器
			}
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setContentType("binary/octet-stream");
			response.setHeader("Content-disposition", "attachment; fileName = " + fileName);
			// 使用response中的OutputStream输出流定义文件写入对象Writer
			Writer out = new BufferedWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));
			// 将数据写入文件中
			template.process(dataMap, out);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 字符串设置
	 * 将数据库中的换行符\n，替换为word中的换行符
	 * 将xml的特殊字符转义
	 * @param dataMap
	 */
	private static void stringSet(Map<String,String> dataMap){
		Set<String> keySet = dataMap.keySet();
		for(String key : keySet){
			String str = dataMap.get(key);
			if(str != null){
				str = escapeChar(str);//特殊字符转义
				str = wrapString(str);//设置换行
				dataMap.put(key, str);
			}
		}
	}
	
	
	/**
	 * 换行
	 * @param str
	 * @return
	 */
	private static String wrapString(String str) {
		str = str.replace("\n", "</w:t></w:r></w:p><w:p><w:pPr><w:rPr></w:rPr></w:pPr><w:r><w:rPr></w:rPr><w:t>");
		return str;
	}

	/**
	 * 特殊字符转义
	 * 将xml特殊字符转义
	 * @param str
	 */
	private static String escapeChar(String str) {
		str = str.replace("&", "&amp;");
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace("\'", "&apos;");
		str = str.replace("\"", "&quot;");
		return str;
	}

	/**
	 * 
	 * 获取工程发布到的服务上的webRoot下得路径
	 * 
	 * @return
	 */
	public String getPath() {

		String path = null;
		String folderPath = this.getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		if (folderPath.indexOf("WEB-INF") > 0) {
			path = folderPath.substring(0, folderPath.indexOf("WEB-INF/classes"));
		}

		// 如果是windows
		if (CommonTools.isWindowsSystem()) {

			return path.substring(1, path.length());
		}

		// 如果是linux
		return path;
	}
}
