
/**   
 * 文件名：TypeMap.java    
 * 版本信息：IRMS1.0   
 * 日期：2017-2-28 下午3:36:11   
 * Copyright Enovell Corporation 2017    
 * 版权所有   
 *   
 */

package com.enovell.yunwei.dailySpare;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**      
 * 项目名称：kunmingrinms
 * 类名称：TypeMap   
 * 类描述:  todo 将该模块中设备类别、单位转化为中文
 * 创建人：ltf 
 * 创建时间：2017-2-28 下午3:36:11
 * 修改人：ltf
 * 修改时间：2017-2-28 下午3:36:11   
 *    
 */

public class TypeMap {
	
	/********************************************************设备类别转化为中文**************************************************/		
	public final static int shiPinJianKong = 10003;	//视屏监控设备
	public final static String shiPinJianKong_name = "视屏监控设备";	//视屏监控设备
	public final static int chuanShuWangJiJieRu = 10004;	//传输及接入网设备
	public final static String chuanShuWangJiJieRu_name = "传输及接入网设备";	//传输及接入网设备
	public final static int tongXinXianLu = 10005;	//通信线路设备
	public final static String tongXinXianLu_name = "通信线路设备";	//通信线路设备
	public final static int huiYi = 10006;	//会议设备
	public final static String huiYi_name = "会议设备";	//会议设备
	public final static int tongXinDianYuan = 10007;	//通信电源设备
	public final static String tongXinDianYuan_name = "通信电源设备";	//通信电源设备
	public final static int shuTiao = 10008;	//数调设备
	public final static String shuTiao_name = "数调设备";	//数调设备
//	public final static int ceShi = 3110155;	//设备类别测试
//	public final static String ceShi_name = "设备类别测试";	//设备类别测试
	
	public final static int xianluAndFushu = 20001;	//通信线路及附属设备
	public final static String xianluAndFushu_name = "通信线路及附属设备";	//通信线路及附属设备
	public final static int chuangshuwang = 20002;	//传输网设备
	public final static String chuangshuwang_name = "传输网设备";	//传输网设备
	public final static int jieruwang = 20003;	//接入网设备
	public final static String jieruwang_name = "接入网设备";	//接入网设备
	public final static int tongbu = 20004;	//同步设备
	public final static String tongbu_name = "同步设备";	//同步设备
	public final static int shujuwang = 20005;	//数据网设备
	public final static String shujuwang_name = "数据网设备";	//数据网设备
	public final static int diaodutongxin = 20006;	//调度通信设备
	public final static String diaodutongxin_name = "调度通信设备";	//调度通信设备
	public final static int huiyitongxin = 20007;	//会议通信设备
	public final static String huiyitongxin_name = "会议通信设备";	//会议通信设备
	
	public final static int guangboAndzctongxin = 20008;	//广播与站场通信设备
	public final static String guangboAndzctongxin_name = "广播与站场通信设备";	//广播与站场通信设备
	public final static int baohua =20009;	//报话设备
	public final static String baohua_name ="报话设备";	//报话设备
	public final static int yinjitongxin = 200010;	//日常通信设备
	public final static String yinjitongxin_name = "日常通信设备";	//日常通信设备
	public final static int zongheSpjk = 200011;	//综合视频监控设备
	public final static String zongheSpjk_name = "综合视频监控设备";	//综合视频监控设备
	public final static int TxdyAndJfhjjk = 200012;	//通信电源及机房环境监控设备
	public final static String TxdyAndJfhjjk_name = "通信电源及机房环境监控设备";	//通信电源及机房环境监控设备
	public final static int zhuangxianDljr = 200013;	//专线电路接入设备
	public final static String zhuangxianDljr_name = "专线电路接入设备";	//专线电路接入设备
	public final static int zonghewangguan = 200014;	//综合网管设备
	public final static String zonghewangguan_name = "综合网管设备";	//综合网管设备
	
	public final static int jifang = 200015;	//机房设备
	public final static String jifang_name =  "机房设备";	//机房设备
	public final static int wuxianlietiao = 200016;	//无线列调设备
	public final static String wuxianlietiao_name =  "无线列调设备";	//无线列调设备
	public final static int GSM_R=200017;	//GSM-R设备
	public final static String GSM_R_name= "GSM-R设备";	//GSM-R设备
	
	public static String specialityToChinese(Integer value) {
		switch(value) {
			case shiPinJianKong:
				return shiPinJianKong_name;
			case chuanShuWangJiJieRu:
				return chuanShuWangJiJieRu_name;
			case tongXinXianLu:
				return tongXinXianLu_name;
			case huiYi:
				return huiYi_name;
			case tongXinDianYuan:
				return tongXinDianYuan_name;
			case shuTiao:
				return shuTiao_name;
//			case ceShi:
//				return ceShi_name;
				
			case xianluAndFushu:
				return xianluAndFushu_name;
			case chuangshuwang:
				return chuangshuwang_name;
			case jieruwang:
				return jieruwang_name;
			case tongbu:
				return tongbu_name;
			case shujuwang:
				return shujuwang_name;
			case diaodutongxin:
				return diaodutongxin_name;
			case huiyitongxin:
				return huiyitongxin_name;
			
			case guangboAndzctongxin:
				return guangboAndzctongxin_name;
			case baohua:
				return baohua_name;
			case yinjitongxin:
				return yinjitongxin_name;
			case zongheSpjk:
				return zongheSpjk_name;
			case TxdyAndJfhjjk:
				return TxdyAndJfhjjk_name;
			case zhuangxianDljr:
				return zhuangxianDljr_name;
			case zonghewangguan:
				return zonghewangguan_name;
				
			case jifang:
				return jifang_name;
			case wuxianlietiao:
				return wuxianlietiao_name;
			case GSM_R:
				return GSM_R_name;
		}
		return "";
	}
	
	/**
	 * 
	 * chineseToSpeciality 验证传过来的日常备品名称是否存在，如存在返回它对应的数字值，不存在则返回0
	 * @author quyy
	 * @param value 日常备品名称
	 * @return
	 */
	public static Integer chineseToSpeciality(String value) {
		for(Entry<Integer, String> entry : SPECIALITY_MAP.entrySet()){
			if(entry.getValue().equals(value)) {
				return entry.getKey();
			}
		}
		return 0;
	}
	
	public static final Map<Integer, String> SPECIALITY_MAP = new HashMap<Integer, String>() {
		
		private static final long serialVersionUID = 1L;

		{
	    	put(new Integer(shiPinJianKong), shiPinJianKong_name);  
	    	put(new Integer(chuanShuWangJiJieRu), chuanShuWangJiJieRu_name);  
	    	put(new Integer(tongXinXianLu), tongXinXianLu_name);  
	    	put(new Integer(huiYi), huiYi_name);  
	    	put(new Integer(tongXinDianYuan), tongXinDianYuan_name);  
	    	put(new Integer(shuTiao), shuTiao_name);  
//	    	put(new Integer(ceShi), ceShi_name);  
	    	
	    	put(new Integer(xianluAndFushu), xianluAndFushu_name);  
	    	put(new Integer(chuangshuwang), chuangshuwang_name);  
	    	put(new Integer(jieruwang), jieruwang_name);  
	    	put(new Integer(tongbu), tongbu_name);  
	    	put(new Integer(shujuwang), shujuwang_name);  
	    	put(new Integer(diaodutongxin), diaodutongxin_name);  
	    	put(new Integer(huiyitongxin), huiyitongxin_name); 
	    	
	    	put(new Integer(guangboAndzctongxin), guangboAndzctongxin_name);  
	    	put(new Integer(baohua), baohua_name);  
	    	put(new Integer(yinjitongxin), yinjitongxin_name);  
	    	put(new Integer(zongheSpjk), zongheSpjk_name);  
	    	put(new Integer(TxdyAndJfhjjk), TxdyAndJfhjjk_name);  
	    	put(new Integer(zhuangxianDljr), zhuangxianDljr_name);  
	    	put(new Integer(zonghewangguan), zonghewangguan_name); 
	    	
	    	put(new Integer(jifang), jifang_name);  
	    	put(new Integer(wuxianlietiao), wuxianlietiao_name);  
	    	put(new Integer(GSM_R), GSM_R_name);  
	    }
	};
	
/********************************************************单位转化为中文**************************************************/	
	public final static int ta= 3110156;
	public final static int tai= 10044;
	public final static int metre= 310118;
	public final static int ba= 310119;
	public final static int ding= 310122;
	public final static int M= 310125;
	public final static int kilometre= 10045;
	public final static int tao= 10046;
	public final static int kuai= 10047;
	public final static int ge= 10048;
	public final static int tiao= 10049;
	public final static int jian= 310120;
	public final static int sheng= 310121;
	public final static int gen= 310123;
	public final static int KM= 310124;
	public final static int zuo= 310126;
	
	public static String unitToChinese(int value) {
		switch(value) {
		case ta:
			return "他";
		case tai:
			return "台";
		case metre:
			return "米";
		case ba:
			return "把";
		case ding:
			return "顶";
		case M:
			return "M";
		case kilometre:
			return "公里";
		case tao:
			return "套";
		case kuai:
			return "块";
		case ge:
			return "个";
		case tiao:
			return "条";
		case jian:
			return "件";
		case sheng:
			return "升";
		case gen:
			return "根";
		case KM:
			return "KM";
		case zuo:
			return "座";
		}
		return "";
	}
	
}



