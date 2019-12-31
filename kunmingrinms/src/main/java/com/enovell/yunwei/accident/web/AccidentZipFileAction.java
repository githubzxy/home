package com.enovell.yunwei.accident.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enovell.yunwei.accident.domain.AccidentShop;
import com.enovell.yunwei.attach.tozip.ZipFileDTO;
import com.enovell.yunwei.attach.tozip.ZipFileManager;
import com.enovell.yunwei.util.JsonUtil;

/**
 * 
 * 项目名称：kunmingrinms
 * 类名称：AccidentZipFileAction   
 * 类描述:  应急演练附件打包Action
 * 创建人：yangsy
 * 创建时间：2016-12-20
 *
 */
@Controller
@RequestMapping(value = "/accidentZipFileAction")
public class AccidentZipFileAction {
	/**
	 * getZipFile 获取需要打包的文件
	 */
	@RequestMapping(value = "/getZipFile", method = RequestMethod.POST)
	@ResponseBody
	public String getZipFile (@RequestParam(value = "accidentShopStr", required = false) String accidentShopStr) {
		
		AccidentShop[] as = JsonUtil.jsonToJavaObj(accidentShopStr, AccidentShop[].class);
		List<ZipFileDTO> zfDTOs = new ArrayList<ZipFileDTO>();
		for(int i = 0 ; i<as.length ; i++){
			if(as[i].getAttachFile()!=null){
				ZipFileDTO zDTO = new ZipFileDTO();
				zDTO.setName(as[i].getOrg().getName());
				zDTO.setAf(as[i].getAttachFile());
				zfDTOs.add(zDTO);
			}
		}
		ZipFileManager zfm = new ZipFileManager();
		
		String targetZip = zfm.filesToZip(zfDTOs);
		
		return targetZip;
		
	}
}
