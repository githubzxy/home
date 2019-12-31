//---------------------------------------------------------------------------------------------------
//																	内部请示状态设置
//---------------------------------------------------------------------------------------------------
/////////////////////////////////主单状态/////////////////////////////////////////////////////
/**
 * 作废（归属：管理员） 0
 */
var DELETE = 0;

/**
 * 草稿（归属：车间） 1
 */
var WORKSHOP_DRAFT = 1;

/**
 * 上报（车间上报）（归属：车间） 2
 */
var WORKSHOP_REPORT = 2;

/**
 * 车间申请回退（归属：车间，管理员） 3
 */
var WORKSHOP_APPLY_RETURN = 3;

/**
 * 待确认（归属：车间） 4
 */
var WORKSHOP_UNCONFIRM = 4;

/**
 * 已确认（归属：车间） 5
 */
var WORKSHOP_CONFIRM = 5;

/**
 * 完成（归属：车间） 6
 */
var WORKSHOP_FINISH = 6;

/**
 * 管理员回退（归属：车间，管理员） 20
 */
var MANAGER_RETURN = 20;

/**
 * 处理中（管理员转发给科室）（归属：管理员，段科室） 21
 */
var MANAGER_FORWARD = 21;

/**
 * 段长待审批（归属：段长）40
 */
var BIG_LEADER_NO_APPROVAL = 40;

/**
 * 段长回退（归属：段长） 41
 */
var BIG_LEADER_RETURN = 41;

/**
 * 段长同意（归属：段长） 42
 */
var BIG_LEADER_AGREE = 42;
// ////////////////////////////////////////////子单状态///////////////////////////////////////////
/**
 * 作废 
 * 0
 */
var CHILD_DELETE = 0;

/**
 * 科室待接收
 * 1
 */
var CHILD_SEGMENT_NO_RECEIVE = 1;

/**
 * 科室接收
 * 2
 */
var CHILD_SEGMENT_RECEIVE = 2;

/**
 * 科室回退
 * 3
 */
var CHILD_SEGMENT_RETURN = 3;

/**
 * 科室回复
 * 4
 */
var CHILD_SEGMENT_REPLY = 4;

/**
 * 主管领导回退
 */
var CHILD_LEAD_RETURN = 20;

/**
 * 主管领导同意
 */
var CHILD_LEAD_AGREE = 21;

/**
 * 科室待确认
 */
var CHILD_SEGMENT_UNCONFIRM = 40;

/**
 * 科室已确认
 */
var CHILD_SEGMENT_CONFIRM = 41;

/////////////////////////////////////紧急程度常量///////////////////////////////////////////////////////
//1:紧急
var EMERGENCY = 1;
//2:比较紧急
var COMPARE_EMERGENCY = 2;
//3:一般
var GENERAL = 3;
//////////////////////////////////////问题性质//////////////////////////////////////////////////////////

//安全管理 1
var SAFETY_MANAGEMENT = 1;
//2:设备质量、
var DEVICE_QUALITY = 2;
//3:人员素质、
var PERSONNEL_QUILTY = 3;
//4:生产生活、
var PRODUCTION_LIFE = 4;
//5:思想动态、
var IDEA_DYNAMIC = 5;
//6:奖励申请
var REWARD_APPLY = 6;
///////////////////////////////////////通过状态值获取状态名称///////////////////////////////////////////
/**
 * 根据紧急登记获取紧急状态中文字符串
 */
function getNameByEmergencyLV(value) {
	switch(value) {
	case EMERGENCY:
		return "紧急";
	case COMPARE_EMERGENCY:
		return "比较紧急";
	case GENERAL:
		return "一般";
	default:
		return "未知";
	}
}

/**
 * 根据问题性质获取问题性质中文字符串
 */
function getNameByProblemNature(value) {
	switch(value) {
	case SAFETY_MANAGEMENT:
		return "安全管理";
	case DEVICE_QUALITY:
		return "设备质量";
	case PERSONNEL_QUILTY:
		return "人员素质";
	case PRODUCTION_LIFE:
		return "生产生活";
	case IDEA_DYNAMIC:
		return "思想动态";
	case REWARD_APPLY:
		return "奖励申请";
	default:
		return "";
	}
}

/**
 * 通过状态获取子单状态中文名
 * @param status
 */
function getChildNameByStatus(value){
	switch(value) {
		//子任务状态
		case CHILD_DELETE:
			return "作废 ";
		case CHILD_SEGMENT_NO_RECEIVE:
			return "科室待接收";
		case CHILD_SEGMENT_RECEIVE:
			return "科室接收";
		case CHILD_SEGMENT_RETURN:
			return "科室回退";
		case CHILD_SEGMENT_REPLY:
			return "科室回复";
		case CHILD_LEAD_RETURN:
			return "主管领导回退 ";
		case CHILD_LEAD_AGREE:
			return "主管领导同意 ";
		// 科室确认类状态
		case CHILD_SEGMENT_UNCONFIRM:
			return "科室待确认";
		case CHILD_SEGMENT_CONFIRM:
			return "科室已确认";
		default:
			return "";
	}
}

/**
 * 根据状态获取主单中文字符串
 */
function getNameByStatus(value) {
	switch(value) {

		case DELETE:
			return "作废";
		case WORKSHOP_DRAFT:
			return "草稿";
		case WORKSHOP_REPORT:
			return "上报";
		case WORKSHOP_APPLY_RETURN:
			return "车间申请回退";
		case WORKSHOP_UNCONFIRM:
			return "待确认";
		case WORKSHOP_CONFIRM:
			return "已确认";
		case WORKSHOP_FINISH:
			return "完成";
		case MANAGER_RETURN:
			return "管理员回退";
		case MANAGER_FORWARD:
			return "处理中";
		case BIG_LEADER_NO_APPROVAL:
			return "段长待审批 ";
		case BIG_LEADER_RETURN:
			return "段长回退";
		case BIG_LEADER_AGREE:
			return "段长同意";
		default:
			return "";
	}
}

/**
 * 获取内部请示【紧急程度】下拉框数据
 * @param id 下拉框组件id
 * @param type 下拉框类型 "search" 用于查询页面，包含【全部】选项 "edit" 用于编辑页面，没有【全部】选项
 */
function initEmergencyLVCbo(id,type){
	var optionArr = [
						EMERGENCY,
						COMPARE_EMERGENCY,
						GENERAL
					 ];
	if( !type || type == "search" ){
		$("#"+id).append("<option value=' ' selected>全部</option>");
	}
	for(var i = 0; i < optionArr.length;i++){
		$("#"+id).append("<option value='"+ optionArr[i] +"'>"
				+ getNameByEmergencyLV(optionArr[i]) +"</option>");
	}
}

/**
 * 获取内部请示【问题性质】下拉框数据
 * @param id 下拉框组件id
 * @param type 下拉框类型 "search" 用于查询页面，包含【全部】选项 "edit" 用于编辑页面，没有【全部】选项
 */
function initProblemNatureCbo(id,type){
	var optionArr = [
					 SAFETY_MANAGEMENT,
					 DEVICE_QUALITY,
					 PERSONNEL_QUILTY,
					 PRODUCTION_LIFE,
					 IDEA_DYNAMIC,
					 REWARD_APPLY
					 ];
	if(type == "search" || type == null){
		$("#"+id).append("<option value=' ' selected>全部</option>");
	}
	for(var i = 0; i < optionArr.length;i++){
		$("#"+id).append("<option value='"+ optionArr[i] +"'>"
				+ getNameByProblemNature(optionArr[i]) +"</option>");
	}
}

/**
 * 生成子单状态下拉框
 */
function getChildStatusOptions(id,optionArr){
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
				+ getChildNameByStatus(optionArr[i]) +"</option>");
	}
}

/**
 * 生成主单状态下拉框
 */
function getInnerRequestStatusOptions(id,optionArr){
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
					+ getNameByStatus(optionArr[i]) +"</option>");
	}
}





/**
 * 将id数组转化为以","分隔Ids字符串</br>
 * （注：该方法只能在BUI.Grid中使用）
 * @param idArray
 * @return ids字符串
 */
function arrayToIdsStr(idArray) {
	if(idArray == null || idArray.length == 0) {
		return "";
	}
	var ids = "";
	for(var i = 0;i < idArray.length;i++){
		var record = idArray[i];
		if(i == idArray.length - 1){
			ids += record.id;
		}else{
			ids += record.id + ",";
		}
	}
	return ids;
}

/**
 * 格式化文本域内容
 * 如果文本域中有回车符则将其更换为【<br/>】
 * @param value
 * @return
 */
function formateTextArea(value){
	if(value == null) {
		return "";
	}
	return value.replace(/\n/g,"<br/>");
}

//导出
function exportWord(selectedId){
	window.location.href= contextPath + "innerRequestCommon/export.cn?selectedId="+selectedId;
}
