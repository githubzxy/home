<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>任务详细信息</title>
<link href="<%=contextPath%>/resource/css_framework/css_bui/dpl.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css_framework/css_bui/bui.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/common.css" rel="stylesheet" />
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style type="text/css">
	#childrenDetailGrid .bui-grid-hd{
	 	text-align : center;
	 }
	#childrenDetailGrid .bui-grid-header {
     	overflow-y: hidden;
	}
	.copyToTable{
		width : 100%
	}
	.copyToTable th{
		text-align:center;
 		vertical-align:middle;
 		width : 33%;
 		height: 20px;
 		min-width : 181px;
	}
	.copyToTable td{
		text-align:center;
 		vertical-align:middle;
 		width : 33%;
 		height: 20px;
 		min-width : 181px;
	}
	.bui-grid-row-daiJieShouChild{
	    color: #333333;
	 }
	.bui-grid-row-daiHuiFuChild{
	    color: #00C5CD;
	 }
	.bui-grid-row-yiHuiFuChild{
	    color: #55BB00;
	 }
	 .bui-grid-row-yiGuiDangChild{
	    color: #0000FF;
	 }
	 .bui-grid-row-shenHeTongGuo{
	    color: #00a100;
	 }
	.bui-grid-row-yiTuiHuiChild{
	    color: #68838B;
	 }
	 .bui-grid-row-yiFenPaiChild{
	    color: #FF77FF;
	 }
</style>
</head>
<body>
	<!-- 弹出编辑框 -->
	<div id="detail">
		<form class="form-horizontal" id="detailForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th>任务标题</th>
		            	<td colspan="3">
			            	<div>
			            		<input type="text" id="titleDetail"  style="width:98.3%;height:30px" readonly>
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th>派发人</th>
	            		<td>
	            			<div>
	            				<input type="text" id="sendUserDetail" style="width:96%;height:30px" readonly>
	            			</div>
		            	</td>
	           			<th>联系人</th>
	            		<td>
	            			<div>
								<input type="text" id="linkmanDetail"  style="width:96%;height:30px" readonly>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>派发时间</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="sendDateDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
		            	<th>完成期限</th>
		            	<td>
			            	<div>
			            		<input type="text"  id="limitTimeDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>紧急程度</th>
	           			<td>
			            	<div>
			            		<input type="text"  id="taskLevelDetail"  style="width:96%;height:30px" readonly>	
			            	</div>
		            	</td>
	           			<th style="background-color: GhostWhite;border-right: none;"></th>
		            	<td style="border-left:none;"></td>
		            </tr>
		            <%-- <tr class="thTdPadding" id="checkFileLineDetail" style="display: none;height: 33px">
	          			<th>审核附件</th>
            			<td id="downloadCheckFile" colspan="3">
							<div>
								<jsp:include page="/views/taskManage/checkFileDownLoad.jsp" flush="true">
									<jsp:param name="width" value="100%" />
									<jsp:param name="height" value="100%" />
								</jsp:include>
							</div>
						</td>
	          		</tr>
	          		<tr class="thTdPadding" id="checkMsgLineDetail" style="display: none;">
		           		<th>审核意见</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="checkMsgDetail" style="width:98.3%;height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr> --%>
		            <tr class="thTdPadding" style="height: 33px">
	          			<th>任务下载</th>
	            		<td id="downloadFile" colspan="3">
								<div>
									<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
										<jsp:param name="width"  value="100%" />
										<jsp:param name="height"  value="100%" />
									</jsp:include>
								</div>
							</td>
	          		</tr>
	          		<!-- 抄送列表开始 -->
	          		<tr class="thTdPadding" style="height: 30px;">
	          			<th>抄送列表</th>
	          			<td colspan="3">
	          				<table class="copyToTable">
	          					<thead>
	          						<tr>
	          							<th style="height: 30px">姓名</th>
	          							<th style="height: 30px">单位</th>
	          						</tr>
	          					</thead>
	          					<tbody id="copyToGrid">
	          					
	          					</tbody>
	          				</table>
	          			</td>
	          		</tr>
					<!-- 抄送列表结束 -->
					<tr class="thTdPadding">
		           		<th>备注</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea  id="remarkDetail" style="width:98.3%;height:60px;" readonly></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          	</tbody>
			</table>
			
		</form>
	</div>
	<!-- 子任务列表 -->
	<div class="search-grid-container">
		<div id="miniSquareSpace">
			<%-- <span class="miniSquare"  style="background-color: #00a100"></span>审核通过 --%>
			<span class="miniSquare"  style="background-color: #333333"></span>待接收
			<%-- <span class="miniSquare"  style="background-color: #00C5CD"></span>待回复 --%>
			<span class="miniSquare"  style="background-color: #55BB00"></span>已回复
			<span class="miniSquare"  style="background-color: #0000FF"></span>已归档
			<span class="miniSquare"  style="background-color: #FF77FF"></span>已分派
		</div>
		<div id="showChildrenTask">
			<div id ="childrenDetailGrid"></div>	
		</div>
	</div>
	
		
<script type="text/javascript">

var id= '${param.id}';
var taskStatus= '${param.taskStatus}';//当前任务的状态
//抄送列表
var detailCopyStore;
var detailCopyGrid;
//子任务树列表
var childrenDetailGrid;
var childrenDetailStore;

//根据状态不同，隐藏或显示部分内容（审核通过，审核不通过）
$(document).ready(function () {
	if(taskStatus==taskManage_status.shenHeTongGuo){//审核通过，显示审核附件
		$("#checkFileLineDetail").show();
	}
	if(taskStatus==taskManage_status.shenHeBuTongGuo){//审核不通过，显示审核意见
		$("#checkMsgLineDetail").show();
	}
	
});

BUI.use(["bui/grid","bui/data",'bui/calendar', 'bui/form','bui/overlay','bui/extensions/treegrid'],
		function(Grid,Data,Calendar, Form,Overlay,TreeGrid){
	//抄送列表
	/**抄送人表格开始*/
   	
    detailCopyStore = new Data.Store({
       autoLoad:true
    });
    detailCopyStore.on('load',function(e){
    	BUI.each(e.target.get('data'),function(v,i){
    		var o = v.organization?v.organization.name:'';
//     				p = v.position?v.position.name:'';//职位？
    		$('#copyToGrid').append('<tr><td>'+v.name+'</td><td>'+o+'</td></tr>');
    	});
    });
	
	//子任务树
	var childrenDetailColumns = [{
		 title : '部门',
// 		 elCls : 'center',
		 dataIndex :'owner',
		 width:'25%',
		 sortable : false,	// 表头不排序
		 renderer : function(value) {
			if(value != null && value.organization != null) {
				return value.organization.name;
			}
			return "";
		}
	 },{
		 title : '执行人',
		 elCls : 'center',
		 dataIndex :'owner',
		 sortable : false,
		 width:'20%',
		 renderer : function(value) {
			if(value != null) {
				return value.name;
			}
			return "";
		}
	 },{
		 title : '状态',
		 dataIndex :'status',
		 elCls : 'center',
		 sortable : false,
		 width:'20%',
		 renderer : function(value) {
			 return taskManage_status.typeName(value);
		}
	 },{
		 title : '分派备注',
		 dataIndex :'assignRemark',
		 elCls : 'center',
		 sortable : false,
		 width:'35%'
	 }];

	childrenDetailStore = new Data.TreeStore({
 		 	autoLoad : true,
			root : {
		      id : id
		    },
 			proxy : {
 				url : contextPath + 'taskRootAction/getTaskRootTreeList.cn',
 				method : 'post'
 			},
 		 });
	
	childrenDetailGrid = new TreeGrid({
		 render : '#childrenDetailGrid',
		 columns : childrenDetailColumns,
		 store : childrenDetailStore,
		 idField : 'id',
		 itemStatusFields : {
				daiJieShouChild : 'daiJieShou',
				daiHuiFuChild : 'daiHuiFu',
				yiHuiFuChild : 'yiHuiFu',
				yiGuiDangChild : 'yiGuiDang',
				shenHeTongGuo : 'shenHeTongGuo',
				yiTuiHuiChild : 'yiTuiHui',
				yiFenPaiChild : 'yiFenPai'
		}
	 });
	childrenDetailGrid.render();
	
	//初始化弹出框
	initDetailDialog();
	
});

	/*初始化弹出框的参数*/
	function initDetailDialog(){
		$.ajax({
			url:contextPath +  'taskRootAction/getTaskById.cn',
			type:'post',
			data:{id:id},
			dataType:'json',
			success:function(result,status){
				if(status){
					setParamDetail(result);
				}
			},
			error:function(){alert('加载数据异常！');}
		});
	}
	
	
	function setParamDetail(data){
		$("#titleDetail").val(data.title);
		if(data.sendUser){
			$("#sendUserDetail").val(data.sendUser.name);
		}
		if(data.linkman){
			$("#linkmanDetail").val(data.linkman.name);
		}
		$("#sendDateDetail").val(data.sendDate);
		$("#limitTimeDetail").val(data.limitTime);
		$("#taskLevelDetail").val(taskManage_taskLevel.typeName(data.taskLevel));
		
		if(data.checkAttachFile != null){//审核任务（审核通过状态才显示，其他状态隐藏）
			setCheckAttachFileId(data.checkAttachFile.id);
		}
		$("#checkMsgDetail").val(data.checkMsg);//审核意见（审核不通过状态的数据才显示，其他状态隐藏）
		
		if(data.taskAttachFile != null){//任务下载
			setAttachFileId(data.taskAttachFile.id);
		}
		detailCopyStore.setResult(data.carbonCopyUser);//抄送列表
		$("#remarkDetail").val(data.remark);
	}	
			

</script>
</body>
</html>