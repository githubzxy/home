///////////////////////////////////主单状态////////////////////////////////
/**
 * 草稿-1
 */
var CAO_GAO = "1";
/**
 * 已派发-2
 */
var YI_PAI_FA = "2";
/**
 * 处理中-3
 */
var CHU_LI_ZHONG = "3";
/**
 * 待归档-5
 */
var DAI_GUI_DANG  = "5";
/**
 * 已归档-6
 */
var YI_GUI_DANG = "6";

/**
 * 针对回复的审批 合格-0
 */
var HE_GE = "0";

/**
 * 针对回复的审批 不合格-1
 */
var BU_HE_GE = "1";
///////////////////////////////////子单状态////////////////////////////////
/**
 * 待接收-7
 */
var DAI_JIE_SHOU = "7";
/**
 * 待回复-8
 */
var DAI_HUI_FU = "8";
/**
 * 待回答-9
 */
var DAI_HUI_DA = "9";
/**
 * 已回答-10
 */
var Yi_HUI_DA = "10";
/**
 * 待审批-11
 */
var DAI_SHEN_PI = "11";
/**
 * 完成-12
 */
var WAN_CHENG = "12";
/**
 * 未完成-13
 */
var WEI_WAN_CHENG = "13";
/**
 * 已归档-14
 */
var SUB_YI_GUI_DANG = "14";
/**
 * 已分派-15
 */
var YI_FEN_PAI ="15";

/**
 * 主状态
 */
function initMainStatus(id) {
	$("#" + id).append("<option value='' selected='selected'>全部</option>");
	$("#" + id).append("<option value='1' >草稿</option>");
	$("#" + id).append("<option value='2' >已派发</option>");
	$("#" + id).append("<option value='3' >处理中</option>");
	$("#" + id).append("<option value='5' >待归档</option>");
	$("#" + id).append("<option value='6' >已归档</option>");
}

/**
 * 子状态
 */
function initSubStatus(id) {
	$("#" + id).append("<option value='' selected='selected'>全部</option>");
	$("#" + id).append("<option value='7' >待接收</option>");
	$("#" + id).append("<option value='8' >待回复</option>");
	$("#" + id).append("<option value='9' >待回答</option>");
	$("#" + id).append("<option value='10' >已回答</option>");
	$("#" + id).append("<option value='11' >待审批</option>");
	$("#" + id).append("<option value='12' >完成</option>");
	$("#" + id).append("<option value='13' >未完成</option>");
	$("#" + id).append("<option value='14' >已归档</option>");
	$("#" + id).append("<option value='15' >已分派</option>");
}

var workOrder_type = {
		wired : 3110112,
//		wireless : 3110113,
		high :  3110114,
		typeName : function(value) {
			switch(value) {
//				case this.wired:
//					return "普铁有线科";
//				case this.wireless:
//					return "普铁无线科";
				case this.wired:
					return "普铁科";
				case this.high:
					return "高铁技术科";
			}
		},
		listData : function(id) {
			$(id).append("<option value='" + this.wired + "' >" + this.typeName(this.wired) + "</option>");
//			$(id).append("<option value='" + this.wireless + "' >" + this.typeName(this.wireless) + "</option>");
			$(id).append("<option value='" + this.high + "' >" + this.typeName(this.high) + "</option>");
		}
};

function initOrderNum(id, orderType) {
	
	   $.ajax({
		   type : "POST",
		   url : contextPath + "workOrderAction/getMaxOrderSeq.cn", 
		   dataType : "json",
		   async : false,
		   data: {
			   orderType : orderType
			},
			success: function(data){
 				var year = data.year;
 				var orderSeq = data.orderSeq;
 				orderSeq = setCount(orderSeq);
 				var orderSeqContent =  orderNumFormat(orderType, year, orderSeq);
 				$("#" + id).val(orderSeqContent);
 				$("#" + id).attr("data-seq", data.orderSeq);
			}
	   });
}

/**
 *设置编号 
 * @param count
 * 
 */
function setCount(count){
	var numStr = "";
	if(count < 10 && count > 0){
		numStr = "00"+count;
	}
	if(count >=10 && count < 100){
		numStr = "0"+count;
	}
	if(count >= 100){
		numStr =""+count;
	}
	return numStr;
}

function orderNumFormat(orderType, year, orderSeq) {
	
	var headStr = "";
	switch(Number(orderType)) {
		case workOrder_type.wireless : 
			headStr = "广普无技";
			return headStr +  "【"+year+"】"+orderSeq+"号";
		case workOrder_type.high :
			headStr = "GT";
			return "【"+year+"】"+headStr +"—"+orderSeq+"号";
		case workOrder_type.wired : 
			headStr = "广普有技";
			return headStr +  "【"+year+"】"+orderSeq+"号";
		default:
			return headStr +  "【"+year+"】"+orderSeq+"号";
	}
}

/**
 * 主单状态转换为中文
 */
function mainStatusToChinese(value) {
	switch(value) {
		case "1":
			return "草稿";
		case "2":
			return "已派发";
		case "3":
			return "处理中";
		case "5":
			return "待归档";
		case "6":
			return "已归档";
		default :
			return "";
	}
}

/**
 * 子单状态转换为中文
 */
function subStatusToChinese(value) {
	switch(value) {
		case "7":
			return "待接收";
		case "8":
			return "待回复";
		case "9":
			return "待回答";
		case "10":
			return "已回答";
		case "11":
			return "待审批";
		case "12":
			return "完成";
		case "13":
			return "未完成";
		case "14":
			return "已归档";
		case "15":
			return "已分派";
		default :
			return "";
	}
}





