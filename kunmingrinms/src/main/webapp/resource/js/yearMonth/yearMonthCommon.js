//---------------------------------------------------------------------------------------------------
//																	年月表状态定义开始
//---------------------------------------------------------------------------------------------------
////////////////////////////////////////////////////初步计划开始//////////////////////////////////////////////
/**
 * 初步计划工区草稿（归属main：工区）
 */
var ORIGIN_PLAN_WORKAREA_DRAFT = 0;

/**
 * 初步计划工区上报（归属main：工区）
 */
var ORIGIN_PLAN_WORKAREA_REPORT = 1;

/**
 * 初步计划车间待审核（归属main：车间）
 */
var ORIGIN_PLAN_WORKSHOP_AUDIT= 2;

/**
 * 初步计划车间审核通过（归属main：工区，车间----工区全部审核通过，车间审核通过）
 */
var ORIGIN_PLAN_WORKSHOP_PASS= 3;

/**
 * 初步计划车间审核不通过（归属main：工区）
 */
var ORIGIN_PLAN_WORKSHOP_FAIL = 4;

/**
 * 初步计划车间上报（归属main：车间）
 */
var ORIGIN_PLAN_WORKSHOP_REPORT = 5;

/**
 * 初步计划段审核通过（归属main：工区，车间----段审核通过，车间，工区审核通过）
 */
var ORIGIN_PLAN_SEGMENT_PASS = 6;

/**
 * 初步计划段审核不通过（归属main：车间）
 */
var ORIGIN_PLAN_SEGMENT_FAIL = 7;
////////////////////////////////////////////////////初步计划结束//////////////////////////////////////////////

////////////////////////////////////////////////////确认计划开始//////////////////////////////////////////////
/**
 * 确认计划工区草稿（归属main：工区）
 */
var CONFIRM_PLAN_WORKAREA_DRAFT = 10;

/**
 * 确认计划工区上报（归属main：工区）
 */
var CONFIRM_PLAN_WORKAREA_REPORT = 11;

/**
 * 确认计划车间待审核（归属main：车间）
 */
var CONFIRM_PLAN_WORKSHOP_AUDIT= 12;

/**
 * 确认计划车间审核通过（归属main：工区，车间----工区全部审核通过，车间审核通过）
 */
var CONFIRM_PLAN_WORKSHOP_PASS= 13;

/**
 * 确认计划车间审核不通过（归属main：工区）
 */
var CONFIRM_PLAN_WORKSHOP_FAIL = 14;

/**
 * 确认计划车间上报（归属main：车间）
 */
var CONFIRM_PLAN_WORKSHOP_REPORT = 15;

/**
 * 确认计划段审核通过（归属main：工区，车间----段审核通过，车间，工区审核通过）
 */
var CONFIRM_PLAN_SEGMENT_PASS = 16;

/**
 * 确认计划段审核不通过（归属main：车间）
 */
var CONFIRM_PLAN_SEGMENT_FAIL = 17;
////////////////////////////////////////////////////确认计划结束//////////////////////////////////////////////

////////////////////////////////////////////////////完成情况开始//////////////////////////////////////////////
/**
 * 完成计划工区草稿（归属main：工区）
 */
var FINISH_PLAN_WORKAREA_DRAFT = 20;

/**
 * 完成计划工区上报（归属main：工区）
 */
var FINISH_PLAN_WORKAREA_REPORT = 21;

/**
 * 完成计划车间待审核（归属main：车间）
 */
var FINISH_PLAN_WORKSHOP_AUDIT= 22;

/**
 * 完成计划车间审核通过（归属main：工区，车间----工区全部审核通过，车间审核通过）
 */
var FINISH_PLAN_WORKSHOP_PASS= 23;

/**
 * 完成计划车间审核不通过（归属main：工区）
 */
var FINISH_PLAN_WORKSHOP_FAIL = 24;

/**
 * 完成计划车间上报（归属main：车间）
 */
var FINISH_PLAN_WORKSHOP_REPORT = 25;

/**
 * 完成计划段审核通过（归属main：工区，车间----段审核通过，车间，工区审核通过）
 */
var FINISH_PLAN_SEGMENT_PASS = 26;

/**
 * 完成计划段审核不通过（归属main：车间）
 */
var FINISH_PLAN_SEGMENT_FAIL = 27;
////////////////////////////////////////////////////完成情况结束//////////////////////////////////////////////

/**
 * 根据状态中文字符串
 */
function getChinaByOperType(value) {
	
	switch(value) {
		// 初步计划状态
		case ORIGIN_PLAN_WORKAREA_DRAFT:
			return "初步计划工区草稿";
		case ORIGIN_PLAN_WORKAREA_REPORT:
			return "初步计划工区上报";
		case ORIGIN_PLAN_WORKSHOP_AUDIT:
			return "初步计划车间待审核";
		case ORIGIN_PLAN_WORKSHOP_PASS:
			return "初步计划车间审核通过";
		case ORIGIN_PLAN_WORKSHOP_FAIL:
			return "初步计划车间审核不通过";
		case ORIGIN_PLAN_WORKSHOP_REPORT:
			return "初步计划车间上报";
		case ORIGIN_PLAN_SEGMENT_PASS:
			return "初步计划段审核通过";
		case ORIGIN_PLAN_SEGMENT_FAIL:
			return "初步计划段审核不通过";
		// 确认计划状态
		case CONFIRM_PLAN_WORKAREA_DRAFT:
			return "确认计划工区草稿";
		case CONFIRM_PLAN_WORKAREA_REPORT:
			return "确认计划工区上报";
		case CONFIRM_PLAN_WORKSHOP_AUDIT:
			return "确认计划车间待审核";
		case CONFIRM_PLAN_WORKSHOP_PASS:
			return "确认计划车间审核通过";
		case CONFIRM_PLAN_WORKSHOP_FAIL:
			return "确认计划车间审核不通过";
		case CONFIRM_PLAN_WORKSHOP_REPORT:
			return "确认计划车间上报";
		case CONFIRM_PLAN_SEGMENT_PASS:
			return "确认计划段审核通过";
		case CONFIRM_PLAN_SEGMENT_FAIL:
			return "确认计划段审核不通过";
		// 完成情况状态
		case FINISH_PLAN_WORKAREA_DRAFT:
			return "完成计划工区草稿";
		case FINISH_PLAN_WORKAREA_REPORT:
			return "完成计划工区上报";
		case FINISH_PLAN_WORKSHOP_AUDIT:
			return "完成计划车间待审核";
		case FINISH_PLAN_WORKSHOP_PASS:
			return "完成计划车间审核通过";
		case FINISH_PLAN_WORKSHOP_FAIL:
			return "完成计划车间审核不通过";
		case FINISH_PLAN_WORKSHOP_REPORT:
			return "完成计划车间上报";
		case FINISH_PLAN_SEGMENT_PASS:
			return "完成计划段审核通过";
		case FINISH_PLAN_SEGMENT_FAIL:
			return "完成计划段审核不通过";
		default:
			return "";
	}
}

//-------------------------------------------------------------------------------
// 设备类型
//
//
//
//-------------------------------------------------------------------------------
/**
 * 无线年表计划
 */
var  WIRELESS_YEAR = 1;

/**
 * 无线月表计划
 */
var  WIRELESS_MONTH = 2;

/**
 * 有线年表计划（与无线共用数据）
 */
var  WIRE_YEAR = 1;

/**
 * 有线月表计划（与无线共用数据）
 */
var  WIRE_MONTH = 2;

/**
 * 高铁通信月表计划
 */
var  HIGH_MONTH = 5;

/**
 * 高铁通信年表计划
 */
var  HIGH_YEAR = 6;

/**
 * 高铁网管月表计划
 */
var  HIGH_WG_MONTH = 7;

/**
 * 高铁网管年表计划
 */
var  HIGH_WG_YEAR = 8;

/**
 * 技术支持中心通信月表计划
 */
var  TECH_SUPPORT_MONTH = 5;

/**
 * 技术支持中心通信年表计划
 */
var  TECH_SUPPORT_YEAR = 6;

/**
 * 技术支持中心网管月表计划
 */
var  TECH_SUPPORT_WG_MONTH = 7;

/**
 * 技术支持中心网管年表计划
 */
var  TECH_SUPPORT_WG_YEAR = 8;



/**
 * 根据状态中文字符串
 */
function getChinaByDeviceType(value) {
	switch(value) {
		// 初步计划状态
		case WIRE_YEAR:
			return "年表";
		case WIRE_MONTH:
			return "月表";
		case WIRELESS_YEAR:
			return "年表";
		case WIRELESS_MONTH:
			return "月表";
		case HIGH_MONTH:
			return "月表";
		case HIGH_YEAR:
			return "年表";
		case HIGH_WG_MONTH:
			return "月表";
		case HIGH_WG_YEAR:
			return "年表";
		// 确认计划状态
		case TECH_SUPPORT_YEAR:
			return "年表";
		case TECH_SUPPORT_MONTH:
			return "月表";
		case TECH_SUPPORT_WG_YEAR:
			return "年表";
		case TECH_SUPPORT_WG_MONTH:
			return "月表";
		default:
			return "";
	}
}
//-----------------设备类型结束---------------------------










//---------------------------------------------------------------------------------------------------
//																	年月表状态定义结束
//---------------------------------------------------------------------------------------------------
/**
 * 判断一个数组中是否包含对应的值
 * @param arr 待查询数组
 * @param value 值
 */
function arrContains(arr,value){
	if(arr == null || arr.length == 0 || value == null){
		return false;
	}
	if(isNaN(value)){
		for(var i = 0;i < arr.length;i++){
			if(arr[i] == value){
				return true;
			}
		}
	}else{
		var arrs = arr.join();
		if(arrs.indexOf(value) != -1){
			return true;
		}
	}
	return false;
}
/**
 * 根据select的id及选项值数组生成对应的下拉框列表
 */
function generateOperTypeOptions(id,optionArr){
	var allOperTypes = '';
	for(var i = 0; i < optionArr.length;i++){
		if(i == optionArr.length - 1){
			allOperTypes += optionArr[i];
		}else{
			allOperTypes += optionArr[i] + ",";
		}
	}
	$("#"+id).append("<option value='"+ allOperTypes+"' selected>全部</option>");
	for(var i = 0; i < optionArr.length;i++){
		$("#"+id).append("<option value='"+ optionArr[i] +"'>"
					+ getChinaByOperType(optionArr[i]) +"</option>");
	}
	
}