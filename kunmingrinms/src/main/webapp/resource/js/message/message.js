/**
 * 内部请示-车间请示
 */
var  INNERREQUEST_WORKSHOP = "1";
 
 /**
  * 内部请示-管理员处理
  */
var  INNERREQUEST_MANAGER = "2";
 
 /**
  * 内部请示-段科室答复
  */
var  INNERREQUEST_SEGMENT_ANSWER = "3";

/**
 * 内部请示-段科室确认
 */
var  INNERREQUEST_SEGMENT_CONFIRM = "4";
 
 /**
  * 内部请示-主管领导批复
  */
var  INNERREQUEST_LEADER = "5";

 /**
  * 内部请示-段长，书记批复
  */
var  INNERREQUEST_BIG_LEADER = "6";

/**
 * 待办任务
 */
var TODO_TASK = "11";
/**
 * 待办调度命令
 */
var TODO_DISPATCH = "12";
/**
 * 待办电务处调度命令
 */
var TODO_ELECTRIC_DISPATCH = "13";
/**
 * 待办调度会议令
 */
var TODO_MEETING_DISPATCH = "14";
/**
 * 待办调度救援令
 */
var TODO_EMERRESCUE = "15";
/**
 * 待办工单
 */
var TODO_WORKORDER = "16";

/**
 * 通信网停机要点-停机计划-车间
 */
var COMMNETSTOP_WORKSHOP = "20";
/**
 *  通信网停机要点-停机审核-审核人-技术科
 */
var COMMNETSTOP_CHECK_TECHNSECTION = "21";
/**
 *  通信网停机要点-停机审核-审核人-安调科
 */
var COMMNETSTOP_CHECK_ANNTUNINGSECTION = "22";
/**
 *  通信网停机要点-停机审核-审核人-技术支持中心
 */
var COMMNETSTOP_CHECK_TECHNCENTER = "23";
/**
 *  通信网停机要点-停机审核-审核人-技术科科长
 */
var COMMNETSTOP_CHECK_TECHNSECTIONCHIEF = "24";
/**
 *  通信网停机要点-停机审核-审核人-安调科长
 */
var COMMNETSTOP_CHECK_ANNTUNINGSECTIONCHIEF = "25";
/**
 *  通信网停机要点-停机审核-审核人-生产主管领导
 */
var COMMNETSTOP_CHECK_PRODUCLEADER = "26";
/**
 *  通信网停机要点-停机审核-审核人-安全主管领导
 */
var COMMNETSTOP_CHECK_SAFELEADER = "27";

var strFullPath=window.document.location.href;
var strPath=window.document.location.pathname;
var pos=strFullPath.indexOf(strPath);
var prePath=strFullPath.substring(0,pos);
var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);

/**
 * 通过Type类型获取Type的名称
 */
function getTypeName(type){
	switch(type){
		case INNERREQUEST_WORKSHOP : return "车间内部请示";
		case INNERREQUEST_MANAGER : return "管理员内部请示";
		case INNERREQUEST_SEGMENT_ANSWER : return "段科室答复内部请示";
		case INNERREQUEST_SEGMENT_CONFIRM : return "段科室确认内部请示";
		case INNERREQUEST_LEADER : return "主管领导内部请示";
		case INNERREQUEST_BIG_LEADER : return "段长（书记）内部请示";
		
		case TODO_TASK : return "待办任务";
		case TODO_DISPATCH : return "待办调度命令";
		case TODO_ELECTRIC_DISPATCH : return "待办电务处调度命令";
		case TODO_MEETING_DISPATCH : return "待办调度会议令";
		case TODO_EMERRESCUE : return "待办调度救援令";
		case TODO_WORKORDER : return "待办工单";
		
		case COMMNETSTOP_WORKSHOP : return "车间回复停机计划";
		case COMMNETSTOP_CHECK_TECHNSECTION : return "科室停机审核";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTION : return "科室停机审核";
		case COMMNETSTOP_CHECK_TECHNCENTER : return "科室停机审核";
		case COMMNETSTOP_CHECK_TECHNSECTIONCHIEF : return "科长停机审核";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTIONCHIEF : return "科长停机审核";
		case COMMNETSTOP_CHECK_PRODUCLEADER : return "行政领导停机审核";
		case COMMNETSTOP_CHECK_SAFELEADER : return "行政领导停机审核";
		default : return "";
	}
}

/**
 * 通过Type类型获取对应的跳转页面路径
 * @param type
 */
function getTypeUrl(type){
	switch(type){
		case INNERREQUEST_WORKSHOP : return "../views/innerRequest/workShopPage.jsp";
		case INNERREQUEST_MANAGER : return "../views/innerRequest/managerPage.jsp";
		case INNERREQUEST_SEGMENT_ANSWER : return "../views/innerRequest/segmentPage.jsp";
		case INNERREQUEST_SEGMENT_CONFIRM : return "../views/innerRequest/segmentConfirmPage.jsp";
		case INNERREQUEST_LEADER : return "../views/innerRequest/leaderPage.jsp";
		case INNERREQUEST_BIG_LEADER : return "../views/innerRequest/bigLeaderPage.jsp";
		
		case TODO_TASK : return "../views/taskManage/toDoTask/toDoTaskManagePage.jsp";
		case TODO_DISPATCH : return "../views/dispathRoot/dispathRootBacklogPage.jsp";
		case TODO_ELECTRIC_DISPATCH : return "../views/electricDispatch/electricDispatchBacklogPage.jsp";
		case TODO_MEETING_DISPATCH : return "../views/meetingDispatch/meetingDispatchBacklogPage.jsp";
		case TODO_EMERRESCUE : return "../views/emerRescueComRail/emerRescueComRailPageToBeDone.jsp";
		case TODO_WORKORDER : return "../views/workOrder/workOrderToDoPage.jsp";
		
		case COMMNETSTOP_WORKSHOP : return "../views/commNetStop/stopPlan/stopPlanPage.jsp";
		case COMMNETSTOP_CHECK_TECHNSECTION : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTION : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_TECHNCENTER : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_TECHNSECTIONCHIEF : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTIONCHIEF : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_PRODUCLEADER : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		case COMMNETSTOP_CHECK_SAFELEADER : return "../views/commNetStop/stopExamine/stopExaminePage.jsp";
		default : return "";
	}
}


/**
 * 模块名称
 * @param type
 * @returns
 */
function getTypeTitle(type){
	switch(type){
		case INNERREQUEST_WORKSHOP : return "车间请示";
		case INNERREQUEST_MANAGER : return "管理员处理";
		case INNERREQUEST_SEGMENT_ANSWER : return "段科室答复";
		case INNERREQUEST_SEGMENT_CONFIRM : return "段科室确认";
		case INNERREQUEST_LEADER : return "主管领导批复";
		case INNERREQUEST_BIG_LEADER : return "段长（书记）批复";
		
		case TODO_TASK : return "待办任务";
		case TODO_DISPATCH : return "待办调度命令";
		case TODO_ELECTRIC_DISPATCH : return "待办电务处调度命令";
		case TODO_MEETING_DISPATCH : return "待办调度会议令";
		case TODO_EMERRESCUE : return "待办调度救援令";
		case TODO_WORKORDER : return "待办工单";
		
		case COMMNETSTOP_WORKSHOP : return "停机计划";
		case COMMNETSTOP_CHECK_TECHNSECTION : return "停机审核";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTION : return "停机审核";
		case COMMNETSTOP_CHECK_TECHNCENTER : return "停机审核";
		case COMMNETSTOP_CHECK_TECHNSECTIONCHIEF : return "停机审核";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTIONCHIEF : return "停机审核";
		case COMMNETSTOP_CHECK_PRODUCLEADER : return "停机审核";
		case COMMNETSTOP_CHECK_SAFELEADER : return "停机审核";
		default : return "";
	}
}

/**
 * 数据库权限表--cfg_safe_permission
 * @param type
 * @returns
 */
function getTypeId(type){
	switch(type){
		case INNERREQUEST_WORKSHOP : return "40fff2333a001630141a137f4ab02b5";
		case INNERREQUEST_MANAGER : return "40abcd1c412333630141a137f4fa02bb";
		case INNERREQUEST_SEGMENT_ANSWER : return "4022333c41ffff630141a137f4affff5";
		case INNERREQUEST_SEGMENT_CONFIRM : return "402ddd21234501987141a137f4affff5";
		case INNERREQUEST_LEADER : return "4028811ccc2333630141a137f4a5ffff";
		case INNERREQUEST_BIG_LEADER : return "402ddd2333a001987141a137f4affff5";
		
		case TODO_TASK : return "4028811c41a001630141a137eced0211";
		case TODO_DISPATCH : return "4028811c41a001630141a137ed1c0215";
		case TODO_ELECTRIC_DISPATCH : return "5093a47018ce4ad7aa7619b07140c771";
		case TODO_MEETING_DISPATCH : return "4a7a27e52df54a79825e8f58ce4f1d3d";
		case TODO_EMERRESCUE : return "2c7ebd729830424daf1341ed22d34c91";
		case TODO_WORKORDER : return "4028811c41a001630141a137ed990221";
		
		case COMMNETSTOP_WORKSHOP : return "4028811c41fd03940141fd2cbfc500e3";
		case COMMNETSTOP_CHECK_TECHNSECTION : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTION : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_TECHNCENTER : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_TECHNSECTIONCHIEF : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_ANNTUNINGSECTIONCHIEF : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_PRODUCLEADER : return "4028811c41fd03940141fd2cc06500f1";
		case COMMNETSTOP_CHECK_SAFELEADER : return "4028811c41fd03940141fd2cc06500f1";
		default : return ""; 
	}
}