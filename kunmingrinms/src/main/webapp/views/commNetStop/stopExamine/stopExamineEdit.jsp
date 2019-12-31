<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改并审核停机要点计划</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 
	.bui-stdmod-body{
		overflow-y:scroll;
	}
</style>
</head>
<body style="overflow: hidden;">
	<!-- 弹出编辑框 -->
	<div id="content">
		<form class="form-horizontal" id="editForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
						<th><s>*</s>线路</th>
		            	<td>
			            	<div>
			            		<select name="rainLineEdit" id="rainLineEdit" style="width:100%;height:27px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            	<th style="width:95px;"><s>*</s>计划开始时间</th>
	            		<td>
	            			<div class="bui-form-group" data-rules="{dateRange : true}">
								<input type="text" id="startDateEdit" class="calendar calendar-time"  style="width:95%;" 
								data-rules="{required:true}" readonly="readonly"/>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th><s>*</s>所属局</th>
	            		<td>
	            			<div>
	            				<input type="text" name="belongOffice" id=belongOfficeEdit  data-rules="{required:true,maxlength:50}"  
	            				 style="width:95.3%;height:25px">
	            			</div>
		            	</td>
	           			<th style="width:95px;"><s>*</s>计划结束时间</th>
	           			<td>
	           				<div class="bui-form-group" data-rules="{dateRange : true}">
		           				<input type="text" id="endDateEdit" class="calendar calendar-time"  
									 style="width:95%;" data-rules="{required:true}" readonly="readonly"/>
	           				</div>
	           			</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><s>*</s>工作内容</th>
		            	<td>
			            	<div>
			            		<select name="workContent" id="workContentEdit" style="width:100%;height:30px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            	<th><s>*</s>所属专业</th>
		            	<td>
			            	<div>
			            		<select name="belongCraft" id="belongCraftEdit" style="width:100%;height:30px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th><s>*</s>施工类别</th>
	           			<td>
			            	<div>
			            		<select name="executionType" id="executionTypeEdit" style="width:100%;height:30px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
	           			<th><s>*</s>施工属性</th>
	           			<td>
			            	<div>
			            		<select name="executionAttr"  id="executionAttrEdit" style="width:100%;height:30px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		           		<th><s>*</s>施工地点</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="executionAddr" id="executionAddrEdit" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>涉及骨干网<br>名称</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="mainNetName" id="mainNetNameEdit" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>涉及铁路局</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="railwaysBureau" id="railwaysBureauEdit" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>计划原因<br>说明</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="planCaption" id="planCaptionEdit" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>附件</th>
	            		<td colspan="3" >
	            			<div>
	            				<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
		            			</jsp:include>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr>
	          		<th><s>*</s>方案审批<br>编号</th>
		            	<td colspan="3" style="padding:0 0">
			            	<div>
			            		<input type="text" name="planExaminNum" id="planExaminNumEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">
			            	</div>
		            	</td>
		            </tr>
		            <tr>
		            	<th><s>*</s>月度计划<br>审批编号</th>
	            		<td colspan="3" style="padding:0 0">
	            			<div>
								<input type="text" name="monthPlanExamin" id="monthPlanExaminEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">
							</div>
		            	</td>
		            </tr>
	          		<tr>
	          		<th><s>*</s>昆铁施工<br>台计划号</th>
		            	<td colspan="3" style="padding:0 0">
			            	<div>
			            		<input type="text" name="executionPlanNum" id="executionPlanNumEdit"  data-rules="{required:true,maxlength:50}"  style="width:98%;height:50px">
			            	</div>
		            	</td>
		            </tr>
	          		<tr class="thTdPadding">
	          			<th>批复附件</th>
	            		<td colspan="3" >
	            			<div>
	            				<jsp:include page="/views/commNetStop/checkFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
		            			</jsp:include>
	            			</div>
		            	</td>
	          		</tr>
					<tr class="thTdPadding">
						<th>是否天窗</th>
						<td colspan="3">
							<select name="skyLight" id="skyLightEdit" style="width:100%;height:25px" data-rules="{sele:''}">
								<option value="false">否</option>
								<option value="true">是</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	var contextPath = '<%=contextPath%>' + '/';
	var editForm; //弹出新增窗口
	var editTips;
	var id= '${param.id}';//选择对象的id
	
	$(document).ready(function () {
		/* 初始化下拉选*/
		commNetworkStop_rainLine.listData("#rainLineEdit");
		commNetworkStop_workContent.listData("#workContentEdit");
		commNetworkStop_major.listData("#belongCraftEdit");
		commNetworkStop_constructionType.listData("#executionTypeEdit");
		commNetworkStop_constructionAttr.listData("#executionAttrEdit");
		
		// 初始化数据
		initRailLine();
	});
	
	function initRailLine(){
		//根据id查询对象
		$.ajax({
			url:contextPath +  'commNetStopAction/getCommNetStopById.cn',
			type:'post',
			data:{id:id},
			dataType:'json',
			success:function(result,status){
				if(status){
					var recordCns=result.data;//停机要点记录
					setParamEdit(recordCns);//将返回的值设置到对应的位置
				}
			},
			error:function(){
				alert('加载数据异常！');
			}
		});
	}
	
	//隐藏单选框里的第一个空白框
	$("#editForm select option[value='']").hide();
	
	BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay','bui/select'],
			function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay,Select){
		//消息提示框
		if(editTips == undefined) {
			editTips = new Tooltip.Tips({
		        tip : {
		          trigger : '.x-icon-error', //出现此样式的元素显示tip
		          alignType : 'right', //默认方向
		          elCls : 'tips tips-warning tips-no-icon tip1',
		          zIndex : '2000',
		          offset : 10 //距离左边的距离
		        }
		      }).render();
		}
		
		// 渲染BUIForm，用于表单元素验证
		editForm = new Form.Form({
			srcNode : '#editForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
		//自定义验证规则，选择框必须选值
        Form.Rules.add({
            name : 'sele',  //规则名称
            msg : '请选择一个值',//默认显示的错误信息
            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
              if(value==baseValue){
                return formatMsg;
              }
            }
        });
		
      //自定义验证规则，开始日期不能大于结束日期
        Form.Rules.add({
            name : 'dateCompare',  //规则名称
            msg : '开始时间不能大于结束时间',//默认显示的错误信息
            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
            	baseValue=$("#startDateEdit").val();
            	value=$("#endDateEdit").val();
           		var timeRegExp=/\D/g;//正则表达式，替换所有非数字字符
	            var startTime=baseValue.replace(timeRegExp,"");
	            var endTime=value.replace(timeRegExp,"");
	            if(baseValue&&value&&(endTime-startTime<=0)){//比较大小
	            	return formatMsg;
	            }
            }
        });
		
	});
	//BUI结束
	
	/*初始化弹出框的参数*/
	function setParamEdit(recordCns){
		$("#rainLineEdit").val(recordCns.railLineName);
		$("#startDateEdit").val(recordCns.startDate);
		$("#belongOfficeEdit").val(recordCns.belongOffice);
		$("#endDateEdit").val(recordCns.endDate);
		$("#workContentEdit").val(recordCns.workContent);
		$("#belongCraftEdit").val(recordCns.belongCraft);
		$("#executionTypeEdit").val(recordCns.executionType);
		$("#executionAttrEdit").val(recordCns.executionAttr);
		$("#executionAddrEdit").val(recordCns.executionAddr);
		$("#mainNetNameEdit").val(recordCns.mainNetName);
		$("#railwaysBureauEdit").val(recordCns.railwaysBureau);
		$("#planCaptionEdit").val(recordCns.planCaption);
		if(recordCns.attachFile){//初始化上传附件
			setUploadAttachFileId(recordCns.attachFile.id);
		}
		$("#planExaminNumEdit").val(recordCns.planExaminNum);
		$("#monthPlanExaminEdit").val(recordCns.monthPlanExamin);
		$("#executionPlanNumEdit").val(recordCns.executionPlanNum);
		if(recordCns.examinFile){//初始化审核附件
			setCheckUploadAttachFileId(recordCns.examinFile.id);
		}
        $("#skyLightEdit").val(recordCns.skyLight+"");
	}
	
	/*获取修改后弹出框的参数*/
	function getParamEdit(){
		return {
			id:id,
			railLineName : $("#rainLineEdit").val(),
			startDate:$("#startDateEdit").val(),
			belongOffice:$("#belongOfficeEdit").val(),
			endDate:$("#endDateEdit").val(),
			workContent : $("#workContentEdit").val(),
			belongCraft : $("#belongCraftEdit").val(),
			executionType : $("#executionTypeEdit").val(),
			executionAttr : $("#executionAttrEdit").val(),
			executionAddr:$("#executionAddrEdit").val(),
			mainNetName : $("#mainNetNameEdit").val(),
			railwaysBureau:$("#railwaysBureauEdit").val(),
			planCaption:$("#planCaptionEdit").val(),
			planExaminNum	:$("#planExaminNumEdit").val(),
			monthPlanExamin:$("#monthPlanExaminEdit").val(),
			executionPlanNum:$("#executionPlanNumEdit").val(),
            skyLight:$("#skyLightEdit").val()
		};
	}
</script>
</body>
</html>