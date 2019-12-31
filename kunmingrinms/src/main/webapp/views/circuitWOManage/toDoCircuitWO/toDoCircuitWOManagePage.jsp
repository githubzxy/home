<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    String perId = request.getParameter("threePerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待办工单</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/tableLayout.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<style type="text/css">
    .bui-stdmod-body{
        overflow-x: hidden;
        overflow-y: auto;
    }
    .userMask {
        z-index: 1100 !important;
    }
    .dialogMask{
        z-index: 1080 !important;
    }
    #miniSquareSpace{
        margin-top:15px;
        margin-right:4px; 
        float:right;
    }
    .miniSquare{
        display:inline-block;
        margin-left:10px;
        margin-right:3px;
        width:10px;
        height:10px;
        background-color:#000;
    }
    .bui-grid-row-daiJieShou{
        color: #333333;
     }
    .bui-grid-row-daiHuiFu{
        color: #00C5CD;
     }
    .bui-grid-row-yiHuiFu{
        color: #55BB00;
     }
     .bui-grid-row-yiGuiDang{
        color: #0000FF;
     }
    .bui-grid-row-yiTuiHui{
        color: #68838B;
     }
     .bui-grid-row-yiFenPai{
        color: #FF77FF;
     }
     .x-grid-rownumber{
        color:black;/* 序号，全为黑色 */
    }
    #grid .bui-grid-row{
        height: 29px;
    }
    .bui-grid-row-yiChaoQi{
    color:red;
    z-index: 1000 !important; 
 }
</style>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js_framework/bui_framework/bui-min.js"></script>
</head>
<body style="overflow: hidden;">
    <form action="#" class="form-horizontal" id="searchForm">
        <fieldset>
            <legend onclick="hiddenSearch()">查询</legend>
            <div class="row">
                <div class="control-group span8">
                    <label class="control-label">工单主题:</label>
                    <div class="controls">
                        <input type="text" id="title" class="input-normal" style="width: 170px;" />
                    </div>
                </div>
                <div class="control-group span8">
                    <label class="control-label">派发单位:</label>
                    <div class="controls">
                        <jsp:include page="/views/common_page/OrgAllInputTree.jsp" flush="true" >
                            <jsp:param name="org"  value="sendOrg" />
                            <jsp:param name="orgVal"  value="sendOrgVal" />
                            <jsp:param name="actionURL"  value="organization/getSegmentByPid.cn" />
                            <jsp:param name="width"  value="170px" />
                            <jsp:param name="height"  value="18px" />
                        </jsp:include>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="control-group span8">
                    <label class="control-label">派发时间:</label>
                    <div class="controls" >
                        <input type="text" id="sendStartDate" class="calendar"   style="width:170px;" />
                    </div>
                </div>
                <div class="control-group span8">
                    <label class="control-label">至:</label>
                    <div class="controls" >
                        <input type="text" id="sendEndDate" class="calendar"  style="width:170px;" />
                    </div>
                </div>
                <div class="control-group span8">
                    <label class="control-label">工单状态:</label>
                    <div class="controls" >
                        <select id="status" style="width: 180px;">
                            <option value="">请选择</option>
                        </select>
                    </div>
                </div>
                <div class="control-group span8">
					<label class="control-label">是否超期:</label>
					<div class="controls" >
						<select id="overtimeStatus" style="width: 181px;">
							<option value="">请选择</option>
							<option value="1">是</option>
							<option value="2">否</option>
						</select>
					</div>
				</div>
                <div style="float:right;margin-right: 100px">
                    <button type="button" id="btnSearch" class="button button-primary">查询</button>
                </div>
            </div>
        </fieldset>
    </form>
    <div class="search-grid-container">
        <fieldset>
            <legend>列表</legend>
            <div id="miniSquareSpace">
            <span class="miniSquare"  style="background-color: #FF0000"></span>已超期
                <span class="miniSquare"  style="background-color: #333333"></span>待接收
                <!-- <span class="miniSquare"  style="background-color: #00C5CD"></span>待回复 -->
                <span class="miniSquare"  style="background-color: #55BB00"></span>已回复
                <span class="miniSquare"  style="background-color: #0000FF"></span>已归档
                <span class="miniSquare"  style="background-color: #68838B"></span>已退回
                <span class="miniSquare"  style="background-color: #FF77FF"></span>已分派
            </div>
            <div id="grid"></div>
        </fieldset>
    </div>
    <form action="/kunmingrinms/toDoCircuitWOAction/expToDoCircuitWO.cn" id="exportForm" method="post">
        <input type="hidden" id="exportXlsJson" name="exportXlsJson">
        <input type="hidden" value="待办工单" name="fileName">
    </form>
    
<script type="text/javascript" src="<%=contextPath%>/resource/js/common.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resource/js/commonTypeMap.js"></script>
<script type="text/javascript">
    
    var contextPath = '<%=contextPath%>' + '/';
    var perId = "<%=perId%>";
    var orgId='${sessionScope.user.organization.id }';
    var orgName='${sessionScope.user.organization.name }';
    
    var pageNum = 0;//查询开始数，保证翻页后，store再次load的时候还停留在当前页
    
    var store,grid;// 列表及数据源声明
    
    var handleDialog;// 待办任务处理出框（一级）
    
    var checkDialog;//审核（二级弹出框）
    var backDialog;//退回（二级弹出框）
    var assignDialog;//分派（二级弹出框）
    var replyDialog;//回复（二级弹出框）
    
    /**
     * 查询栏点击触发收起和展开
     */
    function hiddenSearch() {
        $('#searchForm .row').toggle('slow',function(){
            var searchHeight = $('#searchForm').height();
            if(searchHeight < 50){//TODO自己根据条件判断收起和展开的条件及具体高度（即下面的44那个值）
                grid.set('height',grid.get('height') + 44);
            }else{
                grid.set('height',grid.get('height') - 44);
            }
        });
    }
    
    //进行高度计算
    function readyInit(){
        $("#org").width(171);
        var windownHeight = $(window).height();
        var searchHeight = $('#searchForm').height();
        grid.set('height',windownHeight - searchHeight-45);
        store.load({param : JSON.stringify(getParam())});
    }
    
    //初始化查询栏的下拉选
    function initSelection(){
        taskManage_status.listData_toDo("#status");
    }
    initSelection();//初始化查询栏的下拉选
    
    //获取查询条件参数
    function getParam(){
        return {
            title : $("#title").val().trim(),
            orgId:$(orgValInputId).val(),//派发单位
            sendStartDate : $("#sendStartDate").val(),
            overtimeStatus : $("#overtimeStatus").val(),
            sendEndDate : $("#sendEndDate").val(),
            status : $("#status").val()
        };
    }
    
    $("#btnSearch").click(function(){
        if(store){
            store.load({
                param : JSON.stringify(getParam()),
                start : pageNum, //从第一页开始
                pageSize : 10
            });
        }
    });
    
    BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/select','mod/GridBtn','common/multiSelectUser/MultiSelectUser','common/multiSelectUser/MultiSelectUserTool','bui/mask'],
            function(Grid,Data,Calendar, Form,Overlay,Select,GB,MultiSelectUser,MultiSelectUserTool,Mask){
        //日历
        var datepickerStart = new Calendar.DatePicker({
            trigger : '#sendStartDate',
//             showTime : true,
            autoRender : true
        });
        var datepickerEnd = new Calendar.DatePicker({
            trigger : '#sendEndDate',
//             showTime : true,
            autoRender : true
        });
        //设置默认时间
        datepickerStart.on('show',function(){
            var c = datepickerStart.get('calendar');
            c.set('hour',0);
            c.set('minute',0);
            c.set('second',0);
        });
        datepickerEnd.on('show',function(){
            var c = datepickerEnd.get('calendar');
            c.set('hour',23);
            c.set('minute',59);
            c.set('second',59);
        });
        
        /*表格列设置*/
        var columns = [{
                title:'工单主题',
                dataIndex:'root',
                elCls : 'center',
                width:'45%',
                renderer : function(value){
                    return value.title;
                }
            },{
                title:'工单类型',
                dataIndex:'root',
                elCls : 'center',
                width:'10%',
                renderer:function(value){
                    return taskManage_orderType.typeName(value.taskType);
                }
            },{
                title:'派发单位',
                dataIndex:'root',
                elCls : 'center',
                width:'15%',
                renderer:function(value){
					return value.sendUser.organization.name;
				}
            },{
                title:'派发时间',
                dataIndex:'root',
                elCls : 'center',
                width:'75px',
                renderer:function(value){
					return value.sendDate;
				}
            },{
                title:'完成期限',
                dataIndex:'root',
                elCls : 'center',
                width:'75px',
                renderer:function(value){
					return value.limitTime;
				}
            },{
                title:'联系人',
                dataIndex:'root',
                elCls : 'center',
                width:'15%',
                renderer : function(value){
					return value.linkman.name;
				}
            },{
                title:'状态',
                dataIndex:'status',
                elCls : 'center',
                width:'10%',
                renderer:function(value){
                    return taskManage_status.typeName(value);
                }
            },{
                title:'操作',
                dataIndex:'status',
                elCls : 'center',
                width:'30%',
                renderer:function(value){
                	if(value==taskManage_status.daiJieShou){
                		return '<span class="grid-command btn-reply">回复</span>&nbsp;'+
                		'<span class="grid-command btn-assign">分派</span>&nbsp;'+
                		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command btn-back">退回</span>&nbsp;'+
                		'<span class="grid-command infoBtn">详情</span>';
                	}else if(value==taskManage_status.daiHuiFu){
                		return '<span class="grid-command btn-reply">回复</span>&nbsp;'+
                		'<span class="grid-command btn-assign">分派</span>&nbsp;'+
                		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command infoBtn">详情</span>';
                	}else if(value==taskManage_status.yiHuiFu){
                		return '<span class="grid-command infoBtn">详情</span>';
                	}else if(value==taskManage_status.yiFenPai){
                		return'<span class="grid-command btn-assign">分派</span>&nbsp;'+
                		'<span class="grid-command btn-turn">转派</span>&nbsp;'+ 
                		'<span class="grid-command infoBtn">详情</span>';
                	}else{
                    	 return '<span class="grid-command infoBtn">详情</span>';
                	}
                }
            }];
        
        store = new Data.Store({
            url : contextPath+'toDoCircuitWOAction/getCircuitWOShowDtoOfToDo.cn',
            pageSize : 10,
            proxy : {
                method : 'post',
                dataType : 'json'
            }
        });
            
        /*表格设置*/
        grid = new GB({
            render : '#grid',
            perId : perId,
            contextPath : contextPath,
            width : '100%',//如果表格使用百分比，这个属性一定要设置
            columns : columns,
            idField : 'id',
            itemStatusFields : {
            	yiChaoQi : 'yiChaoQi',
                daiJieShou : 'daiJieShou',
                daiHuiFu : 'daiHuiFu',
                yiHuiFu : 'yiHuiFu',
                yiGuiDang : 'yiGuiDang',
                shenHeTongGuo : 'shenHeTongGuo',
                shenHeBuTongGuo : 'shenHeBuTongGuo',
                yiTuiHui : 'yiTuiHui',
                yiFenPai : 'yiFenPai'
            },
            tbar : {
                items : [{
                      btnCls : 'button button-small',
                      text : '<i class="icon-download"></i>导出EXCEL',
                      listeners : {'click' : function(){
                            var records = store.getResult();
                            if(!records||records.length<=0){
                                commonFailure('无数据可以导出！');
                                return;
                            }
                            exportXls(records);
                        }
                      }
                    },{
                        xclass : 'bar-item-text',
                        text : errorMsgHtml + sucMsgHtml
                }]
            },
            bbar : {pagingBar : true},
            plugins : [Grid.Plugins.RowNumber],
            store : store
        });

        grid.render();
        
        readyInit();
        
        grid.on('cellclick',function  (ev) {
            var record = ev.record;//点击行的记录
            var id = record.id;
            var taskStatus = record.status;
            var target = $(ev.domTarget); //点击的元素
            if(target.hasClass('infoBtn')){
                handleDialog=handleDialogCreate(record.id, record.status,'工单详情');
                handleDialog.show();
                handleDialog.get('loader').load();
            }
            /**
            * 修改：按钮放到主页面
            */
            if(target.hasClass('btn-reply')){ //回复
            	replyDialog=replyDialogCreate(id);
                replyDialog.show();
                replyDialog.get('loader').load();
                //遮罩层z-index提高至1080
                $(".bui-ext-mask").addClass("dialogMask");
            }
			if(target.hasClass('btn-assign')){ //分派
				//验证分派的任务是否未处理过（未处理可重新分派，否则不能分派）
				$.post(contextPath + 'circuitWOAction/getCircuitWOTreeList.cn',{id:id},function(children){
                	var isDaiJieShou=validateIsDaiJieShou(children);
	                if(!isDaiJieShou){
	                    tooltip("子工单已进行了处理，不可再进行分派！");
	                    $(".bui-ext-mask").addClass("userMask");
	                    return;
	                }
	                assignDialog=assignDialogCreate(id);
	                assignDialog.show();
	                assignDialog.get('loader').load();
	                //添加遮罩层，z-index:1080
	                $(".bui-ext-mask").addClass("dialogMask");       	
				},"json");
			}
			if(target.hasClass('btn-turn')){ //转派
				var multiSelectUserTool = new MultiSelectUserTool({
            		//待转派的任务id（通过该id获取父任务id，
            		//通过父任务id获取所有该父任务的子任务，
            		//子任务中有个owner属性表示的任务所属用户，
            		//通过这个属性过滤掉下拉选中已经拥有子任务的用户）
            		id:id,
            		orgId:orgId,
            		orgName:orgName,
            		contextPath:contextPath+"toDoCircuitWOAction/getSelectUsersByOrgId.cn",
            	});
            	multiSelectUserTool.show();
            	multiSelectUserTool.on('sureBtn',function(e){
            		var currUserId = "${sessionScope.user.id}";//当前用户id
                    var receiveUserId = $("#user").val();//接收人id
                    if(!receiveUserId){
                    	tooltip("接收人不能为空");
                        $(".bui-ext-mask").addClass("userMask");
                        return ;
                    }
                    $.post(contextPath + 'toDoCircuitWOAction/turnToSendMultiUser.cn',
                            {
                                id : id,
                                receiveUserId : receiveUserId,
                                status : taskStatus
                            },function(data,status){
                                if(status){
                                    commonSuccess("转派成功！");
                                }else{
                                    commonFailure("转派失败！");
                                }
                                readyInit();
                            }, 'json');
    				multiSelectUserTool.close();
    			});
			}
			if(target.hasClass('btn-back')){ //退回
				backDialog=backDialogCreate(id);
                backDialog.show();
                backDialog.get('loader').load();
                
                $(".bui-ext-mask").addClass("dialogMask");
			}
        });
        
        //声明对象
        function UploadFileDto(name,path){
            this.name = name;
            this.path = path;
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
           function handleDialogCreate(id,taskStatus,title){
               handleDialog = new Overlay.Dialog({
                    title : title,
                    width : 660,
                    height : 440,
                    closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
                    mask : true,//非模态弹出框
                    bodyStyle : {padding : 0},
                    listeners : {
                         closing : function(){//关闭窗口时刷新列表
                            $(".bui-ext-mask").removeClass("userMask");
                            $(".bui-ext-mask").removeClass("dialogMask");
                            store.load();
                        },
                        afterRenderUI : function(ev) {
//                          alert(orgType);
//                          $(".btn-assign-daiJieShou").hide();
                       }
                     },
                    buttons : [{
                        text : '审核通过',
                        elCls : 'button btn-handleToDo btn-checkPass',
                        handler : function() {
                            var handleStatus=taskManage_status.shenHeTongGuo;
                            checkDialog=checkDialogCreate(id,handleStatus);
                            checkDialog.show();
                            checkDialog.get('loader').load();
                             //遮罩层z-index提高至1080
                             $(".bui-ext-mask").addClass("dialogMask");
                        }
                    },{
                        text : '审核不通过',
                        elCls : 'button btn-handleToDo btn-checkNotPass',
                        handler : function() {
                            var handleStatus=taskManage_status.shenHeBuTongGuo;
                            checkDialog=checkDialogCreate(id,handleStatus);
                            checkDialog.show();
                            checkDialog.get('loader').load();
                             //遮罩层z-index提高至1080
                             $(".bui-ext-mask").addClass("dialogMask");
                        }
                    }
                ],
                    loader : {
                        url : contextPath + 'views/circuitWOManage/toDoCircuitWO/toDoDetailAndChildren.jsp?id='+id+'&taskStatus='+taskStatus,
                        autoLoad : false,//不在弹出框组件初始化时自动加裁
                        lazyLoad : false,//不进行延迟加裁
                        dataType : 'html'//加载内容类型
                    }
                    
                });
               
                return handleDialog;
            }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            //审核弹出框（二级弹出框）
            function checkDialogCreate(id,handleStatus){
                checkDialog = new Overlay.Dialog({
                    title : '工单审核',
                    width : 620,
                    height : 158,
                    zIndex : '1090',
                    closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
                    mask : true,//非模态弹出框
                    bodyStyle : {padding : 0},
                    listeners : {
                           closing : function(){//关闭窗口时刷新列表
                                //取消正在上传的文件
                                var uploaders = uploader.get("queue").getItems();
                                for(var i in uploaders){
                                    uploader.cancel(uploaders[i]);
                                }
                                $(".bui-ext-mask").removeClass("dialogMask");
                                store.load();
                           }
                      },
                    buttons : [ {
                        text : '推送审核',
                        elCls : 'button btn-reply',
                        handler :function(){
                            if(handleStatus==taskManage_status.shenHeBuTongGuo&&!checkForm.isValid()) {//审核不通过，才验证表单文本框
                                return ;
                            }
                            //获取回复参数
                            var arr=getUploadFileData();//获取上传文件信息
                            if(handleStatus==taskManage_status.shenHeTongGuo&&arr.length<=0){//审核通过，才验证审核附件
                                tooltip('审核附件不能为空！');
                                $(".bui-ext-mask").addClass("userMask");
                                return;
                            }
                            var checkMsg=$("#checkMsg").val();//审核意见
//                          console.log(arr);
//                          console.log(checkMsg);
                            //提交后台
                            $.post(contextPath + 'circuitWOAction/checkCircuitWO.cn',
                            {
                                id : id,
                                checkFileArr : JSON.stringify(arr),
                                checkMsg : checkMsg,
                                status : handleStatus
                            },function(data,status){
                                if(status){
                                    commonSuccess("推送审核成功！");
                                    dialogClose(checkDialog);
//                                     dialogClose(handleDialog);
                                }else{
                                    commonFailure("推送审核失败！");
                                }
                            }, 'json');
                          }
                        }, {
                        text : '取消',
                        elCls : 'button btn-close',
                        handler : function() {
                            dialogClose(checkDialog);
                        }
                    }],
                    loader : {
                        url : contextPath + 'views/circuitWOManage/circuitWOCheck/circuitWOCheck.jsp?handleStatus='+handleStatus,
                        autoLoad : false,//不在弹出框组件初始化时自动加裁
                        lazyLoad : false,//不进行延迟加裁
                        dataType : 'html'//加载内容类型
                    }
                });
                return checkDialog;
            }
            
            //退回任务（二级弹出框）
           function backDialogCreate(id){
               backDialog = new Overlay.Dialog({
                    title : '工单退回',
                    zIndex : '1130',
                    width : 620,
                    height : 159,
                    closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
                    mask : true,//非模态弹出框
                    bodyStyle : {padding : 0},
                    listeners : {
                           closing : function(){//关闭窗口时刷新列表
                                $(".bui-ext-mask").removeClass("dialogMask");
                                store.load();
                           }
                       },
                    buttons : [{
                        text : '退回',
                        elCls : 'button btn-sendBack',
                        handler : function() {
                        	if(!backForm.isValid()){
                        		return;
                        	}
                            var sendBackRemarkTemp=$("#sendBackRemark").val();
                            var sendBackRemark=sendBackRemarkTemp ? (orgName+"："+sendBackRemarkTemp) : "";//加上退回单位信息
//                          alert(sendBackRemark+",,,"+id);
                            $.post(contextPath + 'toDoCircuitWOAction/sendBackToDoCircuitWO.cn',
                                    {
                                        id : id,
                                        sendBackRemark : sendBackRemark
                                    },function(data,status){
                                        if(status){
                                            commonSuccess("退回成功！");
                                            dialogClose(backDialog);
                                            dialogClose(handleDialog);
                                        }else{
                                            commonFailure("退回失败！");
                                        }
                                    }, 'json');
                            
                            }
                        },{
                            text : '取消',
                            elCls : 'button btn-close',
                            handler : function() {
                                dialogClose(backDialog);
                            }
                    }],
                    loader : {
                        url : contextPath + 'views/circuitWOManage/toDoCircuitWO/toDoBack.jsp',
                        autoLoad : false,//不在弹出框组件初始化时自动加裁
                        lazyLoad : false,//不进行延迟加裁
                        dataType : 'html'//加载内容类型
                    }
                    
                });
                return backDialog;
            }
            
           
            //分派任务（二级弹出框）
           function assignDialogCreate(id){
               assignDialog = new Overlay.Dialog({
                    title : '工单分派',
                    zIndex : '1090',
                    width : 620,
                    height : 300,
                    closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
                    mask : true,//非模态弹出框
                    bodyStyle : {padding : 0},
                    listeners : {
                           closing : function(){//关闭窗口时刷新列表
                                $(".bui-ext-mask").removeClass("dialogMask");
                                $(".bui-ext-mask").removeClass("userMask");
                                store.load();
                           }
                       },
                    buttons : [{
                        text : '派发',
                        elCls : 'button btn-assign',
                        handler : function() {
                            var receiveUser=assignUserStore.getResult();//获取分派执行人信息
                            if(receiveUser.length <= 0){
                                tooltip("请添加执行人！");
                                $(".bui-ext-mask").addClass("userMask");
                                return ;
                            }
                            //TODO
                            var assignRemark=$("#assignRemark").val();//分派说明
//                           //验证分派的任务是否未处理过（未处理可重新分派，否则不能分派）
//                           var temp = true;
// 					       $.ajax({  
// 						         type : "post",  
// 						          url : contextPath + 'circuitWOAction/getCircuitWOTreeList.cn', 
// 						          data : {
// 						        	  id:id
// 						          } ,
// 						          dataType:'json',
// 						          async : false,  
// 						          success : function(children){  
// 						        	  var isDaiJieShou=validateIsDaiJieShou(children);
// 		            	                if(!isDaiJieShou){
// 		            	                    tooltip("子任务已进行了处理，不可再进行分派！");
// 		            	                    $(".bui-ext-mask").addClass("userMask");
// 		            	                    temp = false;
// 		            	                    return;
// 		            	                } 
		            	                
// 						          }  
// 					     }); 
// 					    if(!temp){
//        	                	return ;
//        	                }
//                          alert(assignRemark);
//                          console.log(receiveUser);

							$(".bui-ext-mask").removeClass("dialogMask");
							$(".bui-ext-mask").addClass("userMask");
                            $.post(contextPath + 'toDoCircuitWOAction/assignToDoCircuitWO.cn',
                                    {
                                        id : id,
                                        assignRemark : assignRemark,
                                        receiveUser : JSON.stringify(receiveUser)
                                    },function(status){
                                        if(status){
                                            commonSuccess("分派成功！");
                                        }else{
                                            commonFailure("分派失败,子工单已回复！");
                                        }
                                      	//关闭所有弹出框
                                        dialogClose(assignDialog);
                                    }, 'json');
                          }
                        },{
                            text : '取消',
                            elCls : 'button btn-close',
                            handler : function() {
                                dialogClose(assignDialog);
                            }
                    }],
                    loader : {
                        url : contextPath + 'views/circuitWOManage/toDoCircuitWO/toDoAssign.jsp?id='+id,
                        autoLoad : false,//不在弹出框组件初始化时自动加裁
                        lazyLoad : false,//不进行延迟加裁
                        dataType : 'html'//加载内容类型
                    }
                    
                });
                return assignDialog;
            }
            
             //获取上传文件数据(上传的)
             function getUploadFileData(){
                var arr = new Array(); //声明数组,存储数据发往后台
                //获取上传文件的对列
                var fileArray = uploader.get("queue").getItems();
                for(var i in fileArray){
                    var dto = new UploadFileDto(fileArray[i].name,fileArray[i].path); //声明对象
                    arr[i] = dto; // 向集合添加对象
                };
                return arr;
             }
            
            //回复（二级弹出框）
            function replyDialogCreate(id){
                replyDialog = new Overlay.Dialog({
                    title : '工单回复',
                    width : 620,
                    height : 285,
                    zIndex : '1090',
                    closeAction : 'destroy',//关闭时销毁加载到主页面的HTML对象
                    mask : true,//非模态弹出框
                    bodyStyle : {padding : 0},
                    listeners : {
                           closing : function(){//关闭窗口时刷新列表
                                //取消正在上传的文件
                                var uploaders = uploader.get("queue").getItems();
                                for(var i in uploaders){
                                    uploader.cancel(uploaders[i]);
                                }
                                $(".bui-ext-mask").removeClass("dialogMask");
                                store.load();
                           }
                      },
                    buttons : [ {
                        text : '回复',
                        elCls : 'button btn-reply',
                        handler :function(){
                            if(!replyForm.isValid()) {//表单验证
                                return ;
                            }
                            //获取回复参数
                            var arr=getUploadFileData();//获取上传文件信息
                            var responseDate=$("#replyForm #responseDate").val();
                            var responseContent=$("#replyForm #responseContent").val();
                            var chargeUser=$("#replyForm #chargeUser").val();
                            //提交后台
                            $.post(contextPath + 'toDoCircuitWOAction/replyToDoCircuitWO.cn',
                            {
                                param : JSON.stringify({
                                        id : id,
                                        responseDate : responseDate,
                                        responseContent : responseContent
                                }),
                                arr : JSON.stringify(arr)
                            },function(status){
                                if(status){
                                    commonSuccess("回复成功！");
//                                     dialogClose(handleDialog);
                                }else{
                                    commonFailure("回复失败,该工单已不存在！");
                                }
                                    dialogClose(replyDialog);
                            }, 'json');
                          }
                        }, {
                        text : '取消',
                        elCls : 'button btn-close',
                        handler : function() {
                            dialogClose(replyDialog);
                        }
                    }],
                    loader : {
                        url : contextPath + 'views/circuitWOManage/toDoCircuitWO/toDoReply.jsp',
                        autoLoad : false,//不在弹出框组件初始化时自动加裁
                        lazyLoad : false,//不进行延迟加裁
                        dataType : 'html'//加载内容类型
                    }
                    
                });
                return replyDialog;
            }
       
        function validateIsDaiJieShou(children){
            for(var i=0;i<children.length;i++){
                var child=children[i];
                var status=child.status;
                if(status!=taskManage_status.daiJieShou){//若有一个状态不是待接收（处理过），则不能再进行分派
                    return false;
                }
            }
            return true;
        }
        
        //导出本页数据
        function exportXls(records){
            $("#exportXlsJson").val("");//清空值
            
            var json = '[';
            for(var i = 0 ; i < records.length ; i++){
                var row = records[i];
                json += '{'
                    +'"title":'+'"'+row.root.title+'",'
//                     +'"taskLevel":'+'"'+taskManage_taskLevel.typeName(row.root.taskLevel)+'",'
                    +'"taskType":'+'"'+taskManage_orderType.typeName(row.root.taskType)+'",'
                    +'"org":'+'"'+row.root.sendUser.organization.name+'",'
                    +'"sendDate":'+'"'+Grid.Format.datetimeRenderer(row.root.sendDate)+'",'
                    +'"limitTime":'+'"'+Grid.Format.datetimeRenderer(row.root.limitTime)+'",'
                    +'"linkman":'+'"'+row.root.linkman.name+'",'
                    +'"status":'+'"'+taskManage_status.typeName(row.status)+'"'
                    +'},';
            }
            json = json.substring(0, json.length - 1);
            json += ']';
//          console.log(json);
            $("#exportXlsJson").val(json);
            $("#exportForm").submit();
        }
        
        
        // 弹出框提示
        function tooltip(msg){
            BUI.Message.Show({
                msg : msg,
                closeable : false,
                buttons : [
                    {
                      text : '确定',
                      elCls : 'button',
                      handler : function(){
                        $(".bui-ext-mask").removeClass("userMask");
                        this.close();
                    }
                }]
            });
        }
        
        /**
         * 关闭弹出框并解除引用
         * param:d 待关闭的弹出框
         */
        function dialogClose(d){
            d.close();
            d = null;
        }
    /*BUI结束*/   
    //console.log(store.__attrVals.data);
    });
</script>
</body>
</html>